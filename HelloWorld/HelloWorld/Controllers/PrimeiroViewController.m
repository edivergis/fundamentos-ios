//
//  PrimeiroViewController.m
//  Bem Vindo
//
//  Created by Edi Vergis on 6/15/16.
//  Copyright © 2016 Edi Vergis. All rights reserved.
//

#import "PrimeiroViewController.h"

@interface PrimeiroViewController ()
@property (weak, nonatomic) IBOutlet UILabel *labeliPhone;

@property (weak, nonatomic) IBOutlet UILabel *meuPrimeiroLabel;
@property (weak, nonatomic) IBOutlet UIButton *btnOK;


@end

@implementation PrimeiroViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.meuPrimeiroLabel.text = @"Tela Carregada com Sucesso";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)acaoDoBotao:(id)sender {
    
    NSLog(@"Olá");
    self.meuPrimeiroLabel.text = @"Alterado o label";
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
