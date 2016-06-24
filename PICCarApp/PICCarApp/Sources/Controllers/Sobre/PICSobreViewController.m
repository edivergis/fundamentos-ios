//
//  SosbreViewController.m
//  PICCarApp
//
//  Created by Edi Vergis on 6/24/16.
//  Copyright © 2016 Edi Vergis. All rights reserved.
//

#import "PICSobreViewController.h"

@interface PICSobreViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *progress;

@end

@implementation PICSobreViewController
static NSString *URL_SOBRE = @"http://www.livroiphone.com.br/carros/sobre.htm";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Sobre";
    [self.progress startAnimating];
    
    NSString *path;// = [[NSBundle mainBundle] pathForResource:@"piciOS" ofType:@"html"];
    path = URL_SOBRE;
    
    NSURL *url = [NSURL URLWithString:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
    self.webView.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear: animated];
    //Caso seja necessário recarregar a página  web toda vez que a view controller sobre aparecer, o código pode ser inserido nesse ponto, pois esse método é chamado toda vez que a view aparece na tela.
}

#pragma mark - UIWebViewDelegate
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self.progress stopAnimating];
}

//Indica qual página será carregada pela WebView
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType{
    NSLog(@"Carregando a página %@",request.URL);
    return YES;
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
