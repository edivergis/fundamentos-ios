//
//  PICCarroEntity+CoreDataProperties.h
//  PICAplicativoCarro
//
//  Created by C1284047 (Edi Vergis) on 7/9/16.
//  Copyright © 2016 Edi Vergis. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "PICCarroEntity.h"

NS_ASSUME_NONNULL_BEGIN

@interface PICCarroEntity (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *desc;
@property (nullable, nonatomic, retain) NSString *latitude;
@property (nullable, nonatomic, retain) NSString *longitude;
@property (nullable, nonatomic, retain) NSString *nome;
@property (nullable, nonatomic, retain) NSDate *timestamp;
@property (nullable, nonatomic, retain) NSString *tipo;
@property (nullable, nonatomic, retain) NSString *url_foto;
@property (nullable, nonatomic, retain) NSString *url_info;
@property (nullable, nonatomic, retain) NSString *url_video;

@end

NS_ASSUME_NONNULL_END
