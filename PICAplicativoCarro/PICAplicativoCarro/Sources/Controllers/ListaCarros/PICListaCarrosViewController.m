//
//  ListaCarrosViewController.m
//  PICCarApp
//
//  Created by Edi Vergis on 6/24/16.
//  Copyright © 2016 Edi Vergis. All rights reserved.
//

#import "PICListaCarrosViewController.h"
#import "UIViewController+Utils.h"
#import "PICCarro.h"
#import "PICCarroService.h"
#import "PICDetalhesCarroViewController.h"
#import "PICCarroCell.h"

@interface PICListaCarrosViewController (){
    NSArray<PICCarro> *listaCarros;
    PICCarroService *service;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSString *tipo;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *progress;

@end

@implementation PICListaCarrosViewController
static NSString* cellIdentifier = @"Cell";


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Carros";
    //Atribuindo delegates
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    UINib *nib = [UINib nibWithNibName:@"CarroCell" bundle:nil];
    
    [self.tableView registerNib:nib forCellReuseIdentifier:cellIdentifier];
    
    service = [[PICCarroService alloc] init];
    self.tipo = @"classicos";
    [self buscarCarros];
    
    UIBarButtonItem *barButtonAtualizar = [[UIBarButtonItem alloc]initWithTitle:@"Atualizar" style:UIBarButtonItemStylePlain target:self action:@selector(buscarCarros)];
    
    [self.navigationItem setRightBarButtonItem:barButtonAtualizar];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    PICCarro *carro = listaCarros[indexPath.row];
    
    PICDetalhesCarroViewController * detalheVC = [[PICDetalhesCarroViewController alloc] init];
    [detalheVC setCarro:carro];
    
    [self.navigationController pushViewController:detalheVC animated:YES];
    
    
//    [self alertComTitulo:@"Seleção" mensagem:[NSString stringWithFormat:@"Selecionou o carro  na linha %ld ", indexPath.row]];
}

#pragma mark - UITableViewDataSource
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 70.0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return listaCarros.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    PICCarro *carro = listaCarros[indexPath.row];
    
    PICCarroCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    [cell setNomeCarro:carro.nome];
    [cell setDescCarro:carro.desc];
    [cell setUrlImageCarro:carro.url_foto];

    
    return cell;
}

- (IBAction)trocarTipo:(UISegmentedControl*)sender {
    
    switch (sender.selectedSegmentIndex) {
        case 0:
            self.tipo = @"classicos";
            break;
        case 1:
            self.tipo = @"esportivos";
            break;
        case 2:
            self.tipo = @"luxo";
            break;
            
        default:
            break;
    }
    
    [self buscarCarros];
    
}

//- (void) buscarCarros{
//    // listaCarros = [service recuperarCarrosPorTipo:self.tipo];
//    
//    [service recuperarCarrosPorTipo:self.tipo callback:^(NSString *error, NSMutableArray<PICCarro> *arrayCarro) {
//        listaCarros = arrayCarro;
//        [self.tableView reloadData];
//    }];
//    
//}

- (void) buscarCarros{
    
    listaCarros = nil;
    UIView *view = [[UIView alloc] initWithFrame:self.view.frame];
    
    [view setBackgroundColor:[UIColor lightGrayColor]];
    [view setAlpha:0.5];
    [self.view addSubview:view];
    
    [self.progress startAnimating];
    
    [service recuperarCarrosPorTipo:self.tipo callback:^(NSString *error, NSMutableArray<PICCarro> *arrayCarro) {
    
        if (error) {
            [self alertComTitulo:@"Atenção" mensagem:error];
        }else{
            listaCarros = arrayCarro;
            [self.tableView reloadData];
            [self.progress stopAnimating];
            [view removeFromSuperview];
        }
    }];
    
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
