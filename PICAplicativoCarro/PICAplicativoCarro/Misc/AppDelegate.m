//
//  AppDelegate.m
//  PICCarApp
//
//  Created by Edi Vergis on 6/24/16.
//  Copyright © 2016 Edi Vergis. All rights reserved.
//

#import "AppDelegate.h"
#import "PICListaCarrosViewController.h"
#import "PICSobreViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    //Criando a window
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //Criando as view controllers
    //recuperando NIB (XIB) pelo nome da classe automaticamente
    PICListaCarrosViewController *listacarros = [[PICListaCarrosViewController alloc] init];
    PICSobreViewController *sobre = [[PICSobreViewController alloc] init];
    
    //Criando as navigations controllers
    UINavigationController *nav1 = [[UINavigationController alloc] init];
    UINavigationController *nav2 = [[UINavigationController alloc] init];
    
    //Atribuindo as view controllers dentro das navigations
    [nav1 pushViewController:listacarros animated:NO];
    [nav2 pushViewController:sobre animated:NO];
    
    
    //Criando a TabBar
    UITabBarController *tabController = [[UITabBarController alloc] init];
    [tabController addChildViewController:nav1];
    [tabController addChildViewController:nav2];
    
    //Configurando os item da TabBar
    nav1.tabBarItem.title = @"Carros";
    nav1.tabBarItem.image = [UIImage imageNamed:@"tab_carros.png"];
    nav2.tabBarItem.title = @"Sobre";
    nav2.tabBarItem.image = [UIImage imageNamed:@"tab_sobre.png"];
    
    //Configura o UITabBarController como o view controller principal
    self.window.rootViewController = tabController;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
