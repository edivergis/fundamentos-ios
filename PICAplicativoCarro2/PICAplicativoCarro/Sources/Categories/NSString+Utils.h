//
//  NSString+Utils.h
//  PICAplicativoCarro
//
//  Created by C1284047 (Edi Vergis) on 6/27/16.
//  Copyright © 2016 Edi Vergis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Utils)

//Remove os espaços e os caracteres \n do final da string
- (NSString*)trimAndNewLine;
//Concatena as string
- (NSString*)concat:(NSString*)string;
//Subistitui as ocorrências de uma string por outra string
- (NSString*)subistituir:(NSString*)string por:(NSString*)outraString;
@end
