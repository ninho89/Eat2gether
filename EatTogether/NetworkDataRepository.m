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
#import "Advertisement.h"
#import "AdvertisementMapper.h"

@interface NetworkDataRepository ()

@property (nonatomic, strong) CityMapper *cityMapper;
@property (nonatomic, strong) AdvertisementMapper *advertisementMapper;

@end

@implementation NetworkDataRepository

#pragma mark - Get All Cities

-(void) getCitiesWithCompletionBlock:(void (^)(NSArray *, NSError *))completionBlock {
    //Consulta todas las ciudades con sus cordenadas
    PFQuery *query = [PFQuery queryWithClassName:kCityTableParse];
    query.cachePolicy = kPFCachePolicyCacheThenNetwork;
    [query includeKey:kCityLocationIdParse]; //se usa para coger la relacion para saber sus coordenadas
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

-(void) getCitiesAdvertisementWithSCity:(NSString *)cityObjectId WithCompletionBlock:(void (^)(NSArray *, NSError *))completionBlock{
    
    PFQuery *query = [PFQuery queryWithClassName:kAdvertisementTableParse];
    query.cachePolicy = kPFCachePolicyCacheThenNetwork;
    [query includeKey:kAdvertisementCityIdParse];
    [query whereKey:kAdvertisementCityIdParse equalTo:[PFObject objectWithoutDataWithClassName:kCityTableParse objectId:cityObjectId]];
    [query includeKey:kAdvertisementDetailAdvertisementIdParse];
    [query includeKey:kAdvertisementLocationIdParse];
    [query includeKey:kUserIdParse];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if(!error){
            
            NSMutableArray *advertisements = [NSMutableArray array];
            for (PFObject *pfAdvertisement in objects)
            {
                self.advertisementMapper = [[AdvertisementMapper alloc]init];
                Advertisement *advertisement = [self.advertisementMapper mapParseAdvertisement:pfAdvertisement];
                [advertisements addObject:advertisement];
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
            
            completionBlock(advertisements, nil);
        }
    }];
}



@end
