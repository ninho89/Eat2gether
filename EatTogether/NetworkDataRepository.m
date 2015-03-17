//
//  NetworkDataRepository.m
//  EatTogether
//
//  Created by Filippo Aresu on 17/3/15.
//  Copyright (c) 2015 Filippo Aresu. All rights reserved.
//

#import "NetworkDataRepository.h"
#import "CityMapper.h"
#import "City.h"

@interface NetworkDataRepository ()

@property (nonatomic, strong) CityMapper *cityMapper;

@end

@implementation NetworkDataRepository


-(void) getCitiesWithCompletionBlock:(void (^)(NSArray *, NSError *))completionBlock {
    //Consulta todas las ciudades con sus cordenadas
    PFQuery *query = [PFQuery queryWithClassName:kCityTableParse];
    //[query includeKey:kCityLocationIdParse]; //coge la relacion para saber sus coordenadas
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            
            NSMutableArray *cities = nil;
            for (PFObject *pfCity in objects)
            {
                self.cityMapper = [[CityMapper alloc]init];
                City *city = [self.cityMapper mapParseCity:pfCity];
                [cities addObject:city];
                //guardar en coreData
            }
            
            /*
            for (PFObject *arr in objects) {
                NSLog(@"Ciudad: %@", [arr valueForKey:kCityNameParse]);
                NSLog(@"Pais: %@", [arr valueForKey:kCityCountryParse]);
                NSLog(@"Longitud: %@", [[arr valueForKey:kLocationIdParse] valueForKey:kLocationLongitude]);
                NSLog(@"Latitude: %@", [[arr valueForKey:kLocationIdParse] valueForKey:kLocationLatitude]);
            }*/
            
            completionBlock(objects, nil);
        }
    }];
}


@end
