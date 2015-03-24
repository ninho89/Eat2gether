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
#import "Favorite.h"
#import "FavoriteMapper.h"


@interface NetworkDataRepository ()

@property (nonatomic, strong) CityMapper *cityMapper;
@property (nonatomic, strong) AdvertisementMapper *advertisementMapper;
@property (nonatomic, strong) FavoriteMapper *favoriteMapper;

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
            
            completionBlock(cities, nil);
        }
    }];
}

#pragma mark - Get All Citie's Advertisement

-(void) getCitiesAdvertisementWithCity:(NSString *)cityObjectId WithCompletionBlock:(void (^)(NSArray *, NSError *))completionBlock{
    
    PFQuery *query = [PFQuery queryWithClassName:kAdvertisementTableParse];
    query.cachePolicy = kPFCachePolicyCacheThenNetwork;
    [query includeKey:kAdvertisementCityIdParse];
    [query whereKey:kAdvertisementCityIdParse equalTo:[PFObject objectWithoutDataWithClassName:kCityTableParse objectId:cityObjectId]];
    [query includeKey:kAdvertisementDetailAdvertisementIdParse];
    [query includeKey:kAdvertisementLocationIdParse];
    [query includeKey:kAdvertisementUserUsername];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if(!error){
            
            NSMutableArray *advertisements = [NSMutableArray array];
            for (PFObject *pfAdvertisement in objects)
            {
                self.advertisementMapper = [[AdvertisementMapper alloc]init];
                Advertisement *advertisement = [self.advertisementMapper mapParseAdvertisement:pfAdvertisement];
                [advertisements addObject:advertisement];
            }
            
            completionBlock(advertisements, nil);
        }
    }];
}

#pragma mark - Save User's Favorite

-(void) setFavorite:(BOOL)favorite withAdvertisement:(Advertisement *)advertisement user:(User *)user completionBlock:(void (^)(NSArray *, NSError *))completionBlock{
 
    //Query to save favorite
//    PFQuery *query = [PFQuery queryWithClassName:@"Favorite"];
//    query.cachePolicy = kPFCachePolicyCacheThenNetwork;
////    [query includeKey:kAdvertisementIdParse];
////    [query includeKey:@"objectIdU"];
//    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
//        if(!error){
//            NSMutableArray *favorites = [NSMutableArray array];
//            for (PFObject *pfFavorites in objects)
//            {
//                self.favoriteMapper = [[FavoriteMapper alloc]init];
//                Favorite *favorite = [self.favoriteMapper mapParseFavorite:pfFavorites];
//                [favorites addObject:favorite];
//            }
//            completionBlock(favorites, nil);
//        }
//    }];
}


-(void) getFavoritesAdvertisementWithUsername:(NSString *)username WithCompletionBlock:(void (^)(NSArray *, NSError *))completionBlock{
    
    //filtra por el username
    PFQuery *query = [PFQuery queryWithClassName:@"Favorite"];
    [query includeKey:@"objectIdU"];
    [query whereKey:@"objectIdU" equalTo:[PFUser objectWithoutDataWithObjectId:username]];
    [query includeKey:@"detailAdvertisementId"];

    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if(!error){
            NSMutableArray *favorites = [NSMutableArray array];
            for (PFObject *pfFavorites in objects)
            {
                self.favoriteMapper = [[FavoriteMapper alloc]init];
                Favorite *favorite = [self.favoriteMapper mapParseFavorite:pfFavorites];
                [favorites addObject:favorite];
            }
            completionBlock(favorites, nil);
        }
    }];
    

}

@end
