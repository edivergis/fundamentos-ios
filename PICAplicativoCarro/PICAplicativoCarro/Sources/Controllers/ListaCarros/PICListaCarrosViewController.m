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

@interface PICListaCarrosViewController (){
    NSArray<PICCarro> *listaCarros;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation PICListaCarrosViewController
static NSString* cellIdentifier = @"Cell";


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Carros";
    //Atribuindo delegates
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    
    [self alertComTitulo:@"Seleção" mensagem:[NSString stringWithFormat:@"Selecionou o carro  na linha %ld ", indexPath.row]];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    [cell.textLabel setText:[NSString stringWithFormat:@"Carro linha %ld", indexPath.row]];
    [cell.imageView  setImage:[UIImage imageNamed:@"ferrari_ff.png"]];
    
    return cell;
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
