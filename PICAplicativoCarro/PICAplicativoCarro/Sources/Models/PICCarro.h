//
//  PICCarro.h
//  PICCarApp
//
//  Created by Edi Vergis on 6/24/16.
//  Copyright © 2016 Edi Vergis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PICCarro : NSObject
@property (nonatomic, strong) NSString *nome;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSString *urlFoto;
@property (nonatomic, strong) NSString *urlInfo;
@property (nonatomic, strong) NSString *urlVideo;
@property (nonatomic, strong) NSString *latitude;
@property (nonatomic, strong) NSString *longitude;
@end

@protocol PICCarro;