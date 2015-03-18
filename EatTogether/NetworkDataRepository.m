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

#pragma mark - Get All Cities

-(void) getCitiesWithCompletionBlock:(void (^)(NSArray *, NSError *))completionBlock {
    //Consulta todas las ciudades con sus cordenadas
    PFQuery *query = [PFQuery queryWithClassName:kCityTableParse];
    //[query includeKey:kCityLocationIdParse]; //se usa para coger la relacion para saber sus coordenadas
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            
            NSMutableArray *cities = [NSMutableArray array];
            for (PFObject *pfCity in objects)
            {
                self.cityMapper = [[CityMapper alloc]init];
                City *city = [self.cityMapper mapParseCity:pfCity];
                [cities addObject:city];
            }

            /*
            for (PFObject *arr in objects) {
                NSLog(@"Ciudad: %@", [arr valueForKey:kCityNameParse]);
                NSLog(@"Pais: %@", [arr valueForKey:kCityCountryParse]);
                NSLog(@"Longitud: %@", [[arr valueForKey:kLocationIdParse] valueForKey:kLocationLongitude]);
                NSLog(@"Latitude: %@", [[arr valueForKey:kLocationIdParse] valueForKey:kLocationLatitude]);
            }*/
            
            completionBlock(cities, nil);
        }
    }];
}

#pragma mark - Get All Citie's Advertisement

-(void) getCitiesAdvertisementWithSCity:(NSString *)city WithCompletionBlock:(void (^)(NSArray *, NSError *))completionBlock{
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"cityName = %@", city];
    PFQuery *queryCityName = [PFQuery queryWithClassName:kCityTableParse predicate:predicate];
    [queryCityName findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        PFQuery *query = [PFQuery queryWithClassName:kAdvertisementTableParse];
        [query includeKey:kAdvertisementCityIdParse];
        [query whereKey:kAdvertisementCityIdParse equalTo:[PFObject objectWithoutDataWithClassName:kCityTableParse objectId:[[objects valueForKey:@"objectId"]firstObject]]];
        [query includeKey:kAdvertisementDetailAdvertisementIdParse];
        [query includeKey:kUserIdParse];
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            if(!error){
                
                NSMutableArray *advertisement = [NSMutableArray array];
                for (PFObject *pfAdvertisement in objects)
                {
                    //TODO mapear
                }
                /*
                for (PFObject *pfAdvertisement in objects)
                {
                    NSLog(@"Advertisement id: %@", [pfAdvertisement valueForKey:kAdvertisementIdParse]);
                    NSLog(@"User name: %@", [[pfAdvertisement valueForKey:kAdvertisementUserIdParse]valueForKey:kUserNameParse]);
                    NSLog(@"Detail advertisement starter: %@", [[pfAdvertisement valueForKey:kAdvertisementDetailAdvertisementIdParse]valueForKey:kDetailAdvertisementStarterParse]);
                    NSLog(@"Detail advertisement price: %@", [[pfAdvertisement valueForKey:kAdvertisementDetailAdvertisementIdParse]valueForKey:kDetailAdvertisementPriceParse]);
                    NSLog(@"Detail advertisement city: %@", [[pfAdvertisement valueForKey:kAdvertisementCityIdParse]valueForKey:kCityNameParse]);
                    
                }*/
                
                completionBlock(objects, nil);
            }
        }];
    }];
}



@end
