//
//  PICCarroDBCoreData.m
//  PICAplicativoCarro
//
//  Created by C1284047 (Edi Vergis) on 7/7/16.
//  Copyright © 2016 Edi Vergis. All rights reserved.
//

#import "AppDelegate.h"
#import "PICCarroDBCoreData.h"
#import "PICCarro.h"

@implementation PICCarroDBCoreData

+ (PICCarroEntity*) novaInstancia{
    
    id appDelegate = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    PICCarroEntity *c = [NSEntityDescription insertNewObjectForEntityForName:@"PICCarroEntity" inManagedObjectContext:context];
    
    return c;
}

- (NSArray<PICCarroEntity*>*) getCarroPorTipo:(NSString*)tipo{

    id appDelegate = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"PICCarroEntity" inManagedObjectContext:context];
    
    NSFetchRequest *request = [NSFetchRequest new];
    request.entity = entity;
    
    NSPredicate *query = [NSPredicate predicateWithFormat:@"tipo=%@", tipo];
    request.predicate = query;
    
    NSSortDescriptor *sortedDescriptor = [NSSortDescriptor sortDescriptorWithKey:@"timestamp" ascending:YES];
    
    id sortDescriptors = @[sortedDescriptor];
    request.sortDescriptors = sortDescriptors;
    
    NSError *error = nil;
    NSArray<PICCarroEntity*> *array = [context executeFetchRequest:request error:&error];
    
    if (error) {
        NSLog(@"Erro na consulta %@", error.description);
    }

    return array;
}

- (void) save:(PICCarroEntity*)carroEntity{
    
    id appDelegate = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    if (!carroEntity.timestamp) {
        [carroEntity setTimestamp:[NSDate date]];
    }
    
    //[context insertObject:carroEntity];
    
    NSError *error = nil;
    
    [context save:&error];
    if (error) {
        NSLog(@"Erro ao salvar contexto %@", error.description);
    }

}

- (void) delete:(PICCarroEntity*)carroEntity{
    
    id appDelegate = [UIApplication sharedApplication].delegate;
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    NSError *error = nil;
    [context deleteObject:carroEntity];
    
    [context save:&error];
    if (error) {
        NSLog(@"Erro na consulta %@", error.description);
    }
    
}

- (void) deleteCarroPorTipo:(NSString*)tipo{
    
    NSArray<PICCarroEntity *> *carros = [self getCarroPorTipo:tipo];
    
    for (PICCarroEntity *carro in carros) {
        [self delete:carro];
    }
    
}



@end
