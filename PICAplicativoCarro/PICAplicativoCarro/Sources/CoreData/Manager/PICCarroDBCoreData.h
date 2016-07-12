//
//  PICCarroDBCoreData.h
//  PICAplicativoCarro
//
//  Created by C1284047 (Edi Vergis) on 7/9/16.
//  Copyright © 2016 Edi Vergis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PICCarroEntity.h"

@interface PICCarroDBCoreData : NSObject

+(PICCarroEntity*)novaInstancia;
-(NSArray<PICCarroEntity*>*) getCarroPorTipo:(NSString*)tipo;
-(void)save:(PICCarroEntity*)carroEntity;
-(void)delete:(PICCarroEntity*)carroEntity;
-(void) deleteCarroPorTipo:(NSString*)tipo;

@end
