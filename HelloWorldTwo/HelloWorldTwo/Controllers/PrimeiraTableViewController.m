//
//  PrimeiraTableViewController.m
//  HelloWorldTwo
//
//  Created by C1284047 (Edi Vergis) on 6/25/16.
//  Copyright © 2016 Edi Vergis. All rights reserved.
//

#import "PrimeiraTableViewController.h"

@interface PrimeiraTableViewController (){
    NSArray *arrayList;
}

@end

@implementation PrimeiraTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    arrayList = [NSArray arrayWithObjects:@"Valor 1", @"Valor 2", @"Valor 3", @"Valor 4", nil];
//    
    NSArray *array = @[@"Valor 1", @"Valor 2", @"Valor 3", @"Valor 4"];
    NSMutableArray *mArray = [@[@"Valor 1", @"Valor 2", @"Valor 3", @"Valor 4"]mutableCopy];
    
//    NSDictionary *dic = [NSDictionary dictionaryWithObjects:@"obj1", @"obj2", @"obj3" forKeys:@"chave1",@"chave2", @"chave3"];
//    
//    dic = @{@"chave1":@"valor1",@"chave2":@"valor2",@"chave3":@"valor3"};
    
    NSNumber *number = @0;
    BOOL booleano = @YES;
    
    NSMutableDictionary *dic = [@{} mutableCopy];
    int b = 1;
    
    [dic setObject:@"objeto" forKey:@1];
    
    [dic objectForKey:@(b)];
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return arrayList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.textLabel.text = arrayList[indexPath.row];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
