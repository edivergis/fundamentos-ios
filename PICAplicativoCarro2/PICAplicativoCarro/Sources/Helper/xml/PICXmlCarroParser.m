//
//  PICXmlCarroParser.m
//  PICAplicativoCarro
//
//  Created by C1284047 (Edi Vergis) on 6/27/16.
//  Copyright © 2016 Edi Vergis. All rights reserved.
//

#import "PICXmlCarroParser.h"
#import "NSString+Utils.h"
#import "SMXMLDocument.h"

@interface PICXmlCarroParser(){
    NSMutableArray<PICCarro>* listaCarros;
    PICCarro *carro;
    NSString *tempString;
}

@end

@implementation PICXmlCarroParser
static NSString *CONST_CARROS = @"carros";
static NSString *CONST_CARRO = @"carro";
static NSString *CONST_NOME = @"nome";
static NSString *CONST_DESC = @"desc";
static NSString *CONST_URL_FOTO = @"url_foto";
static NSString *CONST_URL_INFO = @"url_info";
static NSString *CONST_URL_VIDEO = @"url_video";
static NSString *CONST_LATITUDE = @"latitude";
static NSString *CONST_LONGITUDE = @"longitude";

#pragma mark - XML SAX
- (NSMutableArray<PICCarro>*)parseXMLSAX:(NSString *)caminhoXML{
    
    listaCarros = [@[]mutableCopy];
    tempString = @"";
    
    NSData *data = [NSData dataWithContentsOfFile:caminhoXML];
    if (data.length > 0) {
        
        NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:data];
        [xmlParser setDelegate:self];
        if([xmlParser parse]){
            
            NSLog(@"Parser, encontrado %ld", listaCarros.count);
        }else{
            NSLog(@"Erro no parser");
        }
    }else{
        NSLog(@"Erro ao recuperar arquivo");
    }
    
    return listaCarros;
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict{
    
    if ([elementName isEqualToString:CONST_CARRO]) {
        //TAG carro encontrada, então deve ser criado uma nova instância do carro
        carro = [PICCarro new];
    }

}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{

    if ([elementName isEqualToString:CONST_CARROS]) {
        
        //indica que ele encontrou o fim da TAG </carros>
        NSLog(@"Fim da lista de carros");
        
    }else if ([elementName isEqualToString:CONST_CARRO]){
        
        //indica que ele encontrou o fim da TAG </carro>, ou seja fez a leitura completa dos sub nós do elemento <carro>
        [listaCarros addObject:carro];
        carro = nil; //limpando o ponteiro do elemento carro
        
    }else if (carro != nil){
        
        //Se não for a tag carro poder ser as outra tag incluídas no XML
        //Se o carro não for nulo indica que são as propriedades relacionadas a ele
        
        if ([elementName isEqualToString:CONST_NOME]) {
            [carro setNome: tempString];
        }else if([elementName isEqualToString:CONST_DESC]){
            [carro setDesc:tempString];
        }else if([elementName isEqualToString:CONST_URL_FOTO]){
            [carro setUrl_foto:tempString];
        }else if([elementName isEqualToString:CONST_URL_INFO]){
            [carro setUrl_info:tempString];
        }else if([elementName isEqualToString:CONST_URL_VIDEO]){
            [carro setUrl_video:tempString];
        }else if([elementName isEqualToString:CONST_LATITUDE]){
            [carro setLatitude:tempString];
        }else if([elementName isEqualToString:CONST_LONGITUDE]){
            [carro setLongitude:tempString];
        }
        
        tempString = @"";
        
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    
    //Faz a leitura do que está dentro das strings que estão dentro dos atributos do XML
    tempString = [[tempString concat:string] trimAndNewLine];
}

#pragma mark - XML DOM
//Parse XML usando DOM
- (NSMutableArray<PICCarro>*) parseXmlDOM:(NSString*)url{
    listaCarros = [@[] mutableCopy];
    NSData *data = [NSData dataWithContentsOfFile:url];
    
    if (data.length > 0) {
        NSError *error = nil;
        SMXMLDocument *document = [[SMXMLDocument  alloc] initWithData:data error:&error];
        
        if (error) {
            NSLog(@"Erro ao carregadar dados: %@", error.description);
        }else{
            SMXMLElement *rootElement = [document root];
            NSArray *elmentsCarro = [rootElement childrenNamed:CONST_CARRO];
            
            for (SMXMLElement *tagCarro in elmentsCarro) {
                carro = [PICCarro new];
                [carro setNome:[tagCarro valueWithPath:CONST_NOME]];
                [carro setDesc:[tagCarro valueWithPath:CONST_DESC]];
                [carro setUrl_info:[tagCarro valueWithPath:CONST_URL_INFO]];
                [carro setUrl_foto:[tagCarro valueWithPath:CONST_URL_FOTO]];
                [carro setUrl_video:[tagCarro valueWithPath:CONST_URL_VIDEO]];
                
                NSString *latitude = [tagCarro valueWithPath:CONST_LATITUDE];
                if (latitude != nil) {
                    [carro setLatitude:latitude];
                }
                
                NSString *longitude = [tagCarro valueWithPath:CONST_LONGITUDE];
                if (longitude != nil) {
                    [carro setLongitude:longitude];
                }
                
                [listaCarros addObject:carro];
            }
        }
    }else{
        NSLog(@"Erro ao recuperar arquivo");
    }
    return listaCarros;
}


@end
