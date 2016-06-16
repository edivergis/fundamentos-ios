//
//  PICCarro.h
//  Bem Vindo
//
//  Created by Edi Vergis on 6/15/16.
//  Copyright © 2016 Edi Vergis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IPICNovasFuncoes.h"

//implmentando enum, normalmente ele fica no .h da classe que ele pertence
typedef NS_ENUM(NSUInteger, TipoCombustivel) {
    TipoCombustivelEtanol,
    TipoCombustivelGasolina,
    TipoCombustivelGNV,
    TipoCombustivelDiesel,
};

@interface PICCarro : NSObject <IPICNovasFuncoes>{
    //NSString *_nome;  antes era necessário declarar a variável aqui e sintetizar no .m (@synthesize)
    //NSInteger _ano;
}

- (instancetype) init __attribute__((unavailable("init not available"))); //desabilitando o construtor padrão
- (instancetype) initComNome:(NSString*)nome ano:(NSInteger)ano;
@property (nonatomic, strong) NSString* nome;
@property (nonatomic, assign) NSInteger ano;
@property (nonatomic, assign) TipoCombustivel combustivel;

- (NSString*)tipoCombustivelToString:(TipoCombustivel)combustivel;

@end
