//
//  PICJsonParser.m
//  PICAplicativoCarro
//
//  Created by C1284047 (Edi Vergis) on 6/27/16.
//  Copyright © 2016 Edi Vergis. All rights reserved.
//

#import "PICJsonParser.h"

@implementation PICJsonParser
static NSString *CONST_CARROS = @"carros";
static NSString *CONST_CARRO = @"carro";
static NSString *CONST_NOME = @"nome";
static NSString *CONST_DESC = @"desc";
static NSString *CONST_URL_FOTO = @"url_foto";
static NSString *CONST_URL_INFO = @"url_info";
static NSString *CONST_URL_VIDEO = @"url_video";
static NSString *CONST_LATITUDE = @"latitude";
static NSString *CONST_LONGITUDE = @"longitude";

- (void)parseData:(NSMutableArray *)listaCarros data:(NSData *)data
{
    if (data.length > 0) {
        
        NSError *error = nil;
        NSDictionary *dicJson = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableLeaves error:&error];
        
        if (error) {
            NSLog(@"Erro ao abrir arquivo");
        }else{
            NSDictionary *dicCarros = dicJson[CONST_CARROS];
            NSArray *arrayCarros = dicCarros[CONST_CARRO];
            
            for (NSDictionary *dicCarro in arrayCarros) {
                PICCarro * carro = [PICCarro new];
                [carro setNome:dicCarro[CONST_NOME]];
                [carro setDesc:dicCarro[CONST_DESC]];
                [carro setUrl_info:dicCarro[CONST_URL_INFO]];
                [carro setUrl_foto:dicCarro[CONST_URL_FOTO]];
                [carro setUrl_video:dicCarro[CONST_URL_VIDEO]];
                [carro setLatitude:dicCarro[CONST_LATITUDE]];
                [carro setLongitude:dicCarro[CONST_LONGITUDE]];
                
                [listaCarros addObject:carro];
            }
        }
        
    }else{
        NSLog(@"Erro ao recuperar arquivo");
    }
}

- (NSMutableArray<PICCarro> *)parseJsonData:(NSData *)dataFile{
    
    NSMutableArray<PICCarro> *listaCarros = [@[] mutableCopy];
    [self parseData:listaCarros data:dataFile];
    return listaCarros;
}

- (NSMutableArray<PICCarro> *)parseJson:(NSString *)caminhoArquivo{
    
    NSMutableArray<PICCarro> *listaCarros = [@[] mutableCopy];
    NSData *data = [NSData dataWithContentsOfFile:caminhoArquivo];
    
    [self parseData:listaCarros data:data];
    
    return listaCarros;
}

- (NSMutableArray<PICCarro> *)parseJsonModel:(NSString *)caminhoArquivo{
    
    NSMutableArray<PICCarro> *listaCarros = nil;
    NSData *data = [NSData dataWithContentsOfFile:caminhoArquivo];
    
    if (data.length > 0) {
        NSError *error =nil;
        PICCarros *cardList = [[PICCarros alloc] initWithData:data error:&error];
        listaCarros = (NSMutableArray<PICCarro>*)[[cardList carros] carro];
        
        if (error) {
            NSLog(@"Erro ao fazer parser : %@", error.description);
        }
        
    }else{
        NSLog(@"Erro ao recuperar arquivo");
    }
    
    return listaCarros;
}

@end
