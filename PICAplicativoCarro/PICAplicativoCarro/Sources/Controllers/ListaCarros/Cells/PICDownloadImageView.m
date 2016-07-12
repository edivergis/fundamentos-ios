//
//  PICDownloadImageView.m
//  PICAplicativoCarro
//
//  Created by C1284047 (Edi Vergis) on 7/2/16.
//  Copyright © 2016 Edi Vergis. All rights reserved.
//

#import "PICDownloadImageView.h"
#import "NSString+Utils.h"
@interface PICDownloadImageView(){
    UIActivityIndicatorView *progress;
    NSOperationQueue *mainQueue;
    NSOperationQueue *queue;
}
@end

@implementation PICDownloadImageView

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    
    queue = [NSOperationQueue new];
    mainQueue = [NSOperationQueue mainQueue];
    
    return [super initWithCoder:aDecoder];
}

- (void) criarProgress{
    progress = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [progress setHidesWhenStopped:YES];
    [self addSubview:progress];
}

- (void)layoutSubviews{
    progress.center = [self convertPoint:self.center toView:self.superview];
}

- (void)setUrl:(NSString *)url{
    [self criarProgress];
    [self setUrl:url cache:YES];
}

- (void) setUrl:(NSString*)url cache:(BOOL)cache{
    self.image = nil;
    [queue cancelAllOperations];
    [progress startAnimating];
    
    [queue addOperationWithBlock:^{
        [self downloadImage:url cache:cache];
    }];
}

- (void) downloadImage:(NSString*)url cache:(BOOL)cache{
    NSData *data = nil;
    if (!cache) {
        NSURL *urlImage = [NSURL URLWithString:url];
        data = [NSData dataWithContentsOfURL:urlImage];
    }else{
        NSString *path = [url substituir:@"/" por:@"_"];
        path = [path substituir:@"\\" por:@"_"];
        path = [path substituir:@":" por:@"_"];
        path = [[NSHomeDirectory() concat:@"/Documents/"] concat:path];
        
        BOOL existe = [[NSFileManager defaultManager] fileExistsAtPath:path];
        if (existe) {
            data = [NSData dataWithContentsOfFile:path];
        }else{
            NSURL *urlImage = [NSURL URLWithString:url];
            data = [NSData dataWithContentsOfURL:urlImage];
            UIImage *image = [UIImage imageWithData:data];
            if (image != nil) {
                [data writeToFile:path atomically:YES];
            }
        }
    }
    
    [mainQueue addOperationWithBlock:^{
       
        [self showImage:data];
    }];
}

- (void) showImage:(NSData*)data{
    
    if (data.length > 0) {
        self.image = [UIImage imageWithData:data];
    }
    
    [progress stopAnimating];
}


















@end
