//
//  SegundaViewController.m
//  HelloWorldTwo
//
//  Created by C1284047 (Edi Vergis) on 6/18/16.
//  Copyright © 2016 Edi Vergis. All rights reserved.
//

#import "SegundaViewController.h"

@interface SegundaViewController ()

@end

@implementation SegundaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Segunda view controller";
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)acaoVoltar:(id)sender {
    //[self dismissViewControllerAnimated:YES completion:nil];
    
    [self.navigationController popViewControllerAnimated:YES];
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
