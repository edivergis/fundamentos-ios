//
//  PICJsonParser.h
//  PICAplicativoCarro
//
//  Created by C1284047 (Edi Vergis) on 7/2/16.
//  Copyright © 2016 Edi Vergis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PICCarro.h"

@interface PICJsonParser : NSObject
- (NSMutableArray<PICCarro>*)parseJson:(NSString*)caminhoArquivo;
- (NSMutableArray<PICCarro>*)parseJsonModel:(NSString*)caminhoArquivo;
- (NSMutableArray<PICCarro> *)parseJsonData:(NSData *)dataFile;
@end
