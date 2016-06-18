//
//  IPICNovasFuncoes.h
//  Bem Vindo
//
//  Created by Edi Vergis on 6/16/16.
//  Copyright © 2016 Edi Vergis. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IPICNovasFuncoes <NSObject>
@required //indica que é obrigatório implementar, caso não seja colocado o required, por default já é required
- (void) acelerar:(NSInteger)km;
- (void) parar;
@optional //indica que não é necessário implementar
- (void) mudarMarcha:(NSInteger)marcha;

@end
