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
#import "PICCarroDBCoreData.h"
#import "PICCarroEntity.h"

@implementation PICCarroService


- (NSArray<PICCarro>*) recuperarCarros{

//    NSMutableArray<PICCarro> * listaCarros = [@[] mutableCopy];
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
    PICXmlCarroParser *parser = [[PICXmlCarroParser  alloc] init];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"carros_classicos" ofType:@"xml"];
    return [parser parseXmlDOM:path];
}

- (NSArray<PICCarro>*) recuperarCarrosPorTipo:(NSString *)tipo{
    
    NSMutableArray<PICCarro>*listaCarros;
    NSString *nomeArquivo = [@"carros_" concat:tipo];
    
    
//  PICXmlCarroParser *parser = [[PICXmlCarroParser  alloc] init];
//    NSString *path = [[NSBundle mainBundle] pathForResource:nomeArquivo ofType:@"xml"];
//  listaCarros = [parser parseXmlDOM:path];
    
    
    NSString *path = [[NSBundle mainBundle] pathForResource:nomeArquivo ofType:@"json"];
     PICJsonParser *parserJson = [PICJsonParser new];
    //listaCarros = [parserJson parseJson:path];
    listaCarros = [parserJson parseJsonModel:path];
    
    return listaCarros;
}

- (void)recuperarCarrosPorTipo:(NSString *)tipo callback:(void (^)(NSString *, NSMutableArray<PICCarro> *))callback{
    
    PICCarroDBCoreData *db = [PICCarroDBCoreData new];
    
    NSArray<PICCarroEntity*> *listaCarros = [db getCarroPorTipo:tipo];
    
    if (listaCarros.count == 0) {
        
        PICJsonParser *jsonParser = [PICJsonParser new];
        
        NSURLSession *session = [NSURLSession sharedSession];
        
        NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"http://www.livroiphone.com.br/carros/carros_%@.json", tipo]];
        
        NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
            
            if (!error) {
                
                NSMutableArray<PICCarro>* arrayCarro = [jsonParser parseJsonData:data];
                
                for (PICCarro *carro in arrayCarro) {
                    
                    PICCarroEntity *cEntity = [PICCarroDBCoreData novaInstancia];
                    [cEntity setNome:carro.nome];
                    [cEntity setDesc:carro.desc];
                    [cEntity setUrl_foto:carro.url_foto];
                    [cEntity setUrl_info:carro.url_info];
                    [cEntity setUrl_video:carro.url_video];
                    [cEntity setLatitude:carro.latitude];
                    [cEntity setLongitude:carro.longitude];
                    [cEntity setTipo:tipo];
                    
                    [db save:cEntity];
                    
                }
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    callback(error.description, arrayCarro);
                });
                
            }else{
                
                callback(error.description, nil);
                
            }
            
        }];
        
        [task resume];
    }else{
        dispatch_async(dispatch_get_main_queue(), ^{
            callback(nil, (NSMutableArray<PICCarro>*)listaCarros);
        });
    }
    
    
    
    
    
   

}

















@end
