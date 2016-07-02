//
//  PICCarroService.m
//  PICCarApp
//
//  Created by Edi Vergis on 6/24/16.
//  Copyright © 2016 Edi Vergis. All rights reserved.
//

#import "PICCarroService.h"
#import "PICXmlCarroParser.h"
#import "NSString+Utils.h"
#import "PICJsonParser.h"

@implementation PICCarroService


- (NSString*) recuperarCaminhoArquivo:(NSString*)tipo xml:(BOOL)xmlOrJson{
    return [[NSBundle mainBundle] pathForResource:[@"carros_" concat:tipo] ofType: (xmlOrJson) ? @"xml" : @"json"];
}

- (NSArray<PICCarro>*) recuperarCarros{

    NSMutableArray<PICCarro> * listaCarros = [@[] mutableCopy];
//    
//    for (int i = 0; i < 3; i++) {
//        
//        PICCarro *carro = [PICCarro new];
//        [carro setNome:[NSString stringWithFormat:@"Ferrari %d", i]];
//        [carro setDesc:[NSString stringWithFormat:@"Desc Ferrari %d", i]];
//        [carro setUrlFoto:@"ferrari_ff.png"];
//        [listaCarros addObject:carro];
//        
//    }
    
    PICXmlCarroParser *carroParser = [[PICXmlCarroParser alloc] init];
    listaCarros = [carroParser parseXMLSAX:[[NSBundle mainBundle] pathForResource:@"carros_classicos" ofType:@"xml"]];
    
    return listaCarros;
}

- (NSArray<PICCarro>*) recuperarCarrosPorTipo:(NSString*)tipo{
    NSMutableArray<PICCarro> * listaCarros = [@[] mutableCopy];
    
    //PICXmlCarroParser *carroParser = [[PICXmlCarroParser alloc] init];
    //XML SAX
    //listaCarros = [carroParser parseXMLSAX:[self recuperarCaminhoArquivo:tipo]];
    
    //XML DOM
    //listaCarros = [carroParser parseXmlDOM:[self recuperarCaminhoArquivo:tipo]];
    
    //JSON  Genérico
    PICJsonParser *jsonParser = [PICJsonParser new];
    //listaCarros = [jsonParser parseJson:[self recuperarCaminhoArquivo:tipo xml:NO]];
   
    //JSONModel
     listaCarros = [jsonParser parseJsonModel:[self recuperarCaminhoArquivo:tipo xml:NO]];
    
    
    return listaCarros;
}

- (void) recuperarCarrosPorTipo:(NSString*)tipo callback:(void (^) (NSString * error, NSMutableArray<PICCarro> *arrayCarro))callback{
    PICJsonParser *jsonParser = [PICJsonParser new];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat: @"http://www.livroiphone.com.br/carros/carros_%@.json", tipo]];
    NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (!error) {
            NSMutableArray<PICCarro>* arrayCarro = [jsonParser parseJsonData:data];
            dispatch_async(dispatch_get_main_queue(), ^{
                // sleep(2.0);
                callback(error.description,arrayCarro);
            });
        }else{
            callback(error.description,nil);
        }
    }];
    [task resume];
}



@end
