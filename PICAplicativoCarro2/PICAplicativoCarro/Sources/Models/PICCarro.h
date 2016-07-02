//
//  PICCarro.h
//  PICCarApp
//
//  Created by Edi Vergis on 6/24/16.
//  Copyright © 2016 Edi Vergis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JSONModel.h"

@interface PICCarro : JSONModel
@property (nonatomic, strong) NSString *nome;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSString *url_foto;
@property (nonatomic, strong) NSString *url_info;
@property (nonatomic, strong) NSString *url_video;
@property (nonatomic, strong) NSString *latitude;
@property (nonatomic, strong) NSString *longitude;
@end

@protocol PICCarro
@end

@interface PICCarroList : JSONModel

@property (nonatomic, strong) NSMutableArray<PICCarro> *carro;

@end

@interface PICCarros : JSONModel

@property (nonatomic, strong) PICCarroList *carros;

@end



