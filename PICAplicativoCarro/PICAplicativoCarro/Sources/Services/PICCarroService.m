//
//  PICCarroService.m
//  PICCarApp
//
//  Created by Edi Vergis on 6/24/16.
//  Copyright © 2016 Edi Vergis. All rights reserved.
//

#import "PICCarroService.h"
#import "PICCarro.h"

@implementation PICCarroService


- (NSArray<PICCarro>*) recuperarCarros{

    NSMutableArray<PICCarro> * listaCarros = [@[] mutableCopy];
    
    for (int i; i < 10; i++) {
        
        PICCarro *carro = [PICCarro new];
        [carro setNome:[NSString stringWithFormat:@"Ferrari %d", i]];
        [carro setDesc:[NSString stringWithFormat:@"Desc Ferrari %d", i]];
        [carro setUrlFoto:@"ferrari_ff.png"];
        [listaCarros addObject:carro];
        
    }
    
    return listaCarros;
}

@end
