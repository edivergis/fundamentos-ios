//
//  PICCellCar.m
//  PICCarApp
//
//  Created by Edi Vergis on 6/24/16.
//  Copyright © 2016 Edi Vergis. All rights reserved.
//

#import "PICCarroCell.h"

@interface PICCarroCell() 
@property (weak, nonatomic) IBOutlet UIImageView *imageViewCarro;
@property (weak, nonatomic) IBOutlet UILabel *labelNomeCarro;
@property (weak, nonatomic) IBOutlet UILabel *labelDescCarro;

@end

@implementation PICCarroCell
- (void)setNomeCarro:(NSString *)nome{
    self.labelNomeCarro.text = nome;
}

- (void)setDescCarro:(NSString *)descCarro{
    self.labelDescCarro.text = descCarro;
}

- (void)setUrlImageCarro:(NSString *)urlImage{
    self.imageViewCarro.image = [UIImage imageNamed:urlImage];
}

@end
