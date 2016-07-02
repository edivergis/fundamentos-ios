//
//  PICCarroService.h
//  PICCarApp
//
//  Created by Edi Vergis on 6/24/16.
//  Copyright © 2016 Edi Vergis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PICCarro.h"

@interface PICCarroService : NSObject

- (NSArray<PICCarro>*) recuperarCarros;
- (NSArray<PICCarro>*) recuperarCarrosPorTipo:(NSString*)tipo;
- (void) recuperarCarrosPorTipo:(NSString*)tipo callback:(void (^) (NSString * error, NSMutableArray<PICCarro> *arrayCarro))callback;
@end
