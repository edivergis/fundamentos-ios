//
//  DetalhesCarrosViewController.m
//  PICCarApp
//
//  Created by Edi Vergis on 6/24/16.
//  Copyright © 2016 Edi Vergis. All rights reserved.
//

#import "PICDetalhesCarroViewController.h"
#import "PICDownloadImageView.h"

@interface PICDetalhesCarroViewController ()
@property (weak, nonatomic) IBOutlet PICDownloadImageView *imageView;
@property (weak, nonatomic) IBOutlet UITextView *textView;


@end

@implementation PICDetalhesCarroViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.imageView setUrl:self.carro.url_foto];
    self.textView.text = self.carro.desc;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
