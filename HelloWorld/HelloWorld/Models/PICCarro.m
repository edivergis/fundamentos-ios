//
//  PICCarro.m
//  Bem Vindo
//
//  Created by Edi Vergis on 6/15/16.
//  Copyright © 2016 Edi Vergis. All rights reserved.
//

#import "PICCarro.h"
@interface PICCarro(){
    //Atributos privados aqui
}
    //métodos ou properties privadas aqui

@end

@implementation PICCarro
//@synthesize nome = _nome; //hoje não é mais necessário, pois o compilador faz automaticamente
//@synthesize ano = _ano;

- (instancetype)initComNome:(NSString *)nome ano:(NSInteger)ano{
    if (self=[super init]) {
        //tudo que for feito no construtor, deve ser feito nesse ponto
        self.nome = nome; //acessando pelo método acessor set
        _nome = nome; //acessando a variável de forma direta
        [self setAno:ano]; //acessando pelo método acessor set
        _ano = ano; //acessando a variável de forma direta
    }
    return self;
}

- (void) imprimir{
    //self para acessar a classe
    NSLog(@"Nome: %@, Ano: %ld", self.nome, (long)self.ano);
}

- (BOOL)isEqual:(id)other
{
    BOOL retorno = NO;
    if (other == self) {
        retorno = YES;
    } else if ([other isMemberOfClass:self.class]) { //compara se é a mesma classe
        retorno =  YES;
    }else if ([other isKindOfClass:self.class]) { //compara se pertencem ao mesmo tipo, verificando a classe mais genérica
        retorno = YES;
    }else if ([other conformsToProtocol:@protocol(IPICNovasFuncoes)]){ //verifica se implementa a mesma interface
        retorno = YES;
    }
    return retorno;
}

- (NSUInteger)hash
{
    return self.hash; //hash do objeto
}

- (void)acelerar:(NSInteger)km{
    NSLog(@"Acelerou para a velocidade %ld", km);
}

- (void)parar{
    NSLog(@"Carro parado");
}

//parse enum para string
- (NSString *)tipoCombustivelToString:(TipoCombustivel)combustivel{
    NSString* stringCombustivel = @"Inválido";
    
    switch (combustivel) {
        case TipoCombustivelEtanol:
            stringCombustivel = @"Etanol";
            break;
        case TipoCombustivelGasolina:
            stringCombustivel = @"Gasolina";
            break;
        case TipoCombustivelGNV:
            stringCombustivel = @"GNV";
            break;
        case TipoCombustivelDiesel:
            stringCombustivel = @"Diesel";
            break;
        default:
            break;
    }
    return stringCombustivel;
}


@end
