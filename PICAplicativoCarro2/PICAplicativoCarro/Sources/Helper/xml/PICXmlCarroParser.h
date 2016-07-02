//
//  PICXmlCarroParser.h
//  PICAplicativoCarro
//
//  Created by C1284047 (Edi Vergis) on 6/27/16.
//  Copyright © 2016 Edi Vergis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PICCarro.h"

@interface PICXmlCarroParser : NSObject<NSXMLParserDelegate>


- (NSMutableArray<PICCarro>*)parseXMLSAX:(NSString*)caminhoXML;
- (NSMutableArray<PICCarro>*) parseXmlDOM:(NSString*)url;

@end
