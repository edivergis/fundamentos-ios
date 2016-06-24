//
//  NSString+Utils.m
//  Bem Vindo
//
//  Created by Edi Vergis on 6/16/16.
//  Copyright © 2016 Edi Vergis. All rights reserved.
//

#import "NSString+Utils.h"

@implementation NSString (Utils)

- (NSString*)trim{
    //Retorna uma string sem espaços no início e fim
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

- (BOOL) isEmpty{
    BOOL isEmpty = NO;
    if ([self trim].length == 0) {
        isEmpty = YES;
    }
    return isEmpty;
}


@end
