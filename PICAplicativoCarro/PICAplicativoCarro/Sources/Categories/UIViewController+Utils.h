//
//  UIViewController+Utils.h
//  PICCarApp
//
//  Created by Edi Vergis on 6/24/16.
//  Copyright © 2016 Edi Vergis. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Utils)

-(void) alertComTitulo:(NSString *) titulo mensagem:(NSString *) msg blocoResposta:(void (^)())bloco;

-(void) alertComTitulo:(NSString *) titulo mensagem:(NSString *) msg;

@end
