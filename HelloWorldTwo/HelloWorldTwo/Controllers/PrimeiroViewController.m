//
//  PrimeiroViewController.m
//  Bem Vindo
//
//  Created by Edi Vergis on 6/15/16.
//  Copyright © 2016 Edi Vergis. All rights reserved.
//

#import "PrimeiroViewController.h"

@interface PrimeiroViewController ()

@property (weak, nonatomic) IBOutlet UILabel *meuPrimeiroLabel;
@property (weak, nonatomic) IBOutlet UITextField *txtSobrenome;
@property (weak, nonatomic) IBOutlet UITextField *txtNome;
@end

@implementation PrimeiroViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.meuPrimeiroLabel.text = @"Tela Carregada com Sucesso";
    
    //Indica que a própria classe implmenta o protocolo UITextFieldDelegate
    //Responde aos eventos
    self.txtNome.delegate = self;
    //self.txtSobrenome.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)acaoDoBotao:(id)sender {
    
    if ([self.txtNome.text isEqualToString:@""] && [self.txtSobrenome.text isEqualToString:@""]) {
        
        //método antigo de enviar alerta
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Atenção" message:@"Todos os campos devem ser preenchidos" delegate:self cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
//        [alert show];
        
        //método novo de enviar alerta
        UIAlertController *controller = [UIAlertController alertControllerWithTitle:@"Atenção" message:@"Todos os campos devem ser preenchidos!" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction = [UIAlertAction actionWithTitle:NSLocalizedString(@"OK", @"OK action") style:UIAlertActionStyleDefault handler:nil];
        [controller addAction:okAction];
        [self presentViewController:controller animated:YES completion:nil];
        
    }else{
        NSString *string = @"Olá ";
        string = [string stringByAppendingString:self.txtNome.text];
        string = [string stringByAppendingString:@" "];
        string = [string stringByAppendingString:self.txtSobrenome.text];
        [self.meuPrimeiroLabel setText:string];
        
        //retirando o focu dos componentes de texto
        [self.txtNome resignFirstResponder];
        [self.txtSobrenome resignFirstResponder];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    [self.txtNome resignFirstResponder];
//    [self.txtSobrenome resignFirstResponder];
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    BOOL retorno = NO;
    if (textField ==  self.txtNome) {
        [self.txtSobrenome becomeFirstResponder];
        retorno = YES;
    }else if (textField == self.txtSobrenome){
        [self acaoDoBotao:nil];
    }
    return retorno;
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
