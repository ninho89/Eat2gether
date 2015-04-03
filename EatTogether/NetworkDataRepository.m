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
#import "User.h"
#import "Reservation.h"
#import "UserMapper.h"

@interface NetworkDataRepository ()

@property (nonatomic, strong) CityMapper *cityMapper;
@property (nonatomic, strong) AdvertisementMapper *advertisementMapper;
@property (nonatomic, strong) FavoriteMapper *favoriteMapper;
@property (nonatomic, strong) NSMutableArray *advertisements;
@property (nonatomic, strong) NSMutableArray *advertisements2;
@property (nonatomic, strong) NSMutableArray *userArray;
@property (nonatomic, strong) UserMapper *userMapper;

@end

@implementation NetworkDataRepository

#pragma mark - Get All Cities

-(void) getCitiesWithCompletionBlock:(void (^)(NSArray *, NSError *))completionBlock {
    //Consulta todas las ciudades con sus cordenadas
    PFQuery *query = [PFQuery queryWithClassName:kCityTableParse];
    query.cachePolicy = kPFCachePolicyCacheThenNetwork;
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            
            NSMutableArray *cities = [NSMutableArray array];
            for (PFObject *pfCity in objects)
            {
                self.cityMapper = [[CityMapper alloc]init];
                City *city = [self.cityMapper mapParseCity:pfCity];
                [cities addObject:city];
            }
            completionBlock(cities, error);
        }
    }];
}

#pragma mark - Get All Citie's Advertisement

-(void) getCitiesAdvertisementWithCity:(NSString *)cityObjectId WithCompletionBlock:(void (^)(NSArray *, NSError *))completionBlock{
    
    PFQuery *query = [PFQuery queryWithClassName:kAdvertisementTableParse];
    query.cachePolicy = kPFCachePolicyCacheThenNetwork;
    [query includeKey:@"cityId"];
    [query whereKey:@"cityId" equalTo:[PFObject objectWithoutDataWithClassName:kCityTableParse objectId:cityObjectId]];
    [query includeKey:@"detailAdvertisementId"];
    [query includeKey:@"locationId"];
    [query includeKey:@"username"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if(!error){
            
            NSMutableArray *advertisements = [NSMutableArray array];
            for (PFObject *pfAdvertisement in objects)
            {
                self.advertisementMapper = [[AdvertisementMapper alloc]init];
                Advertisement *advertisement = [self.advertisementMapper mapParseAdvertisement:pfAdvertisement];
                [advertisements addObject:advertisement];
                
            }
            completionBlock(advertisements, error);
        }
    }];
}

#pragma mark - Save User's Favorite

-(void) setFavorite:(BOOL)favorite withAdvertisement:(Advertisement *)advertisement user:(User *)user completionBlock:(void (^)(NSArray *, NSError *))completionBlock{
 
    //Query to save favorite
    PFUser *user1 = [PFUser user];
    user1.objectId = user.userObjectId;
    
    //Guarda el advertisementId
    PFObject *objAdvId = [PFObject objectWithoutDataWithClassName:@"Advertisement" objectId:advertisement.advertisementObjectId];

    PFObject *myFav = [PFObject objectWithClassName:@"Favorite"];
    [myFav setObject:user1 forKey:@"objectIdU"];
    [myFav setObject:objAdvId forKey:@"advertisementId"];
    [myFav setObject:@(favorite) forKey:@"favoriteCheck"];
    
    [myFav saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            // La persona se ha grabado correctamente.
            NSLog(@"Favorito guardado");
        } else {
            // Se ha producido un error al guardar la información de la Persona.
            NSLog(@"Error al guardar el favorito");
        }
    }];
}

-(void) setReservation:(BOOL)statusReservation withAdvertisement:(Advertisement *)advertisement user:(User *)user completionBlock:(void (^)(NSArray *, NSError *))completionBlock{
    
    //query save reservation
    PFUser *user1 = [PFUser user];
    user1.objectId = user.userObjectId;

    //guarda el advertisement
    PFObject *adv = [PFObject objectWithoutDataWithClassName:@"Advertisement" objectId:advertisement.advertisementObjectId];
    
    PFObject *myReservation = [PFObject objectWithClassName:@"Reservation"];
    [myReservation setObject:user1 forKey:@"objectIdU"];
    [myReservation setObject:adv forKey:@"advertisementId"];
    [myReservation setObject:advertisement.user.userObjectId forKey:@"objectIdUAdv"];
    [myReservation setObject:@(statusReservation) forKey:@"statusReservation"];

    [myReservation saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (!error) {
            // La persona se ha grabado correctamente.
            NSLog(@"Reserva guardada");
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Solicitud" message:@"Solicitud enviada" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [alert show];
        } else {
            // Se ha producido un error al guardar la información de la Persona.
            NSLog(@"Error al guardar la reserva");
        }
    }];
    
}

-(void) getFavoritesAdvertisementWithUsername:(NSString *)username WithCompletionBlock:(void (^)(NSArray *, NSError *))completionBlock{

    self.advertisements = [[NSMutableArray alloc]init];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Favorite"];
    //filtra por el username
    [query includeKey:@"objectIdU"];
    [query whereKey:@"objectIdU" equalTo:[PFUser objectWithoutDataWithObjectId:username]];
    [query includeKey:@"detailAdvertisementId"];
    [query includeKey:@"advertisementId"];

    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if(!error){
            for (PFObject *pfFavorites in objects)
            {
                NSString *obj = [[[pfFavorites valueForKey:@"advertisementId"]valueForKey:@"detailAdvertisementId"]valueForKey:@"objectId"];
                
                PFQuery *query2 = [PFQuery queryWithClassName:@"Advertisement"];
                [query2 includeKey:@"detailAdvertisementId"];
                [query2 whereKey:@"detailAdvertisementId" equalTo:[PFObject objectWithoutDataWithClassName:@"DetailAdvertisement" objectId:obj]];
                [query2 includeKey:@"cityId"];
                [query2 includeKey:@"locationId"];
                [query2 includeKey:@"username"];
                
                [query2 findObjectsInBackgroundWithBlock:^(NSArray *objects2, NSError *error) {
                    for (PFObject *pfAdvertisement in objects2)
                    {
                        self.advertisementMapper = [[AdvertisementMapper alloc]init];
                        Advertisement *advertisement = [self.advertisementMapper mapParseAdvertisement:pfAdvertisement];
                        [self.advertisements addObject:advertisement];
                    }
                    completionBlock(self.advertisements, error);
                }];
            }
        }
    }];
}


-(void) getReservationWithUsername:(NSString *)username WithCompletionBlock:(void (^)(NSArray *, NSError *))completionBlock{
    
    self.advertisements2 = [[NSMutableArray alloc]init];

    PFQuery *query = [PFQuery queryWithClassName:@"Reservation"];
    [query includeKey:@"objectIdU"];
    [query whereKey:@"objectIdU" equalTo:[PFUser objectWithoutDataWithObjectId:username]];
    [query includeKey:@"advertisementId"];
    [query includeKey:@"detailAdvertisementId"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if(!error){
            for (PFObject *pfReservations in objects)
            {
                NSString *obj = [[[pfReservations valueForKey:@"advertisementId"]valueForKey:@"detailAdvertisementId"]valueForKey:@"objectId"];
                
                PFQuery *query2 = [PFQuery queryWithClassName:@"Advertisement"];
                [query2 includeKey:@"detailAdvertisementId"];
                [query2 whereKey:@"detailAdvertisementId" equalTo:[PFObject objectWithoutDataWithClassName:@"DetailAdvertisement" objectId:obj]];
                [query2 includeKey:@"cityId"];
                [query2 includeKey:@"locationId"];
                [query2 includeKey:@"username"];
                
                [query2 findObjectsInBackgroundWithBlock:^(NSArray *objects2, NSError *error) {
                    for (PFObject *pfAdvertisement in objects2)
                    {
                        self.advertisementMapper = [[AdvertisementMapper alloc]init];
                        Advertisement *advertisement = [self.advertisementMapper mapParseAdvertisement:pfAdvertisement];
                        [self.advertisements2 addObject:advertisement];
                    }
                    completionBlock(self.advertisements2, error);
                }];
            }
        }
    }];
}

-(void) getReservationWithUsername1:(NSString *)usernameAdv WithCompletionBlock:(void (^)(NSArray *, NSArray *, NSError *))completionBlock{
    
    self.advertisements2 = [[NSMutableArray alloc]init];
    self.userArray = [[NSMutableArray alloc]init];
    
    PFQuery *query = [PFQuery queryWithClassName:@"Reservation"];
    [query includeKey:@"objectIdU"];
    [query whereKey:@"objectIdUAdv" equalTo:usernameAdv];
    [query includeKey:@"advertisementId"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if(!error){
            for (PFObject *pfAdvertisement in objects)
            {
                User *user = [[User alloc]init];
                user.userObjectId = [[pfAdvertisement valueForKey:@"objectIdU"]valueForKey:@"objectId"];
                user.username = [[pfAdvertisement valueForKey:@"objectIdU"]valueForKey:@"username"];
                user.email = [[pfAdvertisement valueForKey:@"objectIdU"]valueForKey:@"email"];
                PFFile *imageFile = [[pfAdvertisement valueForKey:@"objectIdU"]valueForKey:@"userPicture"];
                user.userPicture = imageFile.url;

                [self.userArray addObject:user];
                
                NSString *obj = [[[pfAdvertisement valueForKey:@"advertisementId"]valueForKey:@"detailAdvertisementId"]valueForKey:@"objectId"];
                
                PFQuery *query2 = [PFQuery queryWithClassName:@"Advertisement"];
                [query2 includeKey:@"detailAdvertisementId"];
                [query2 whereKey:@"detailAdvertisementId" equalTo:[PFObject objectWithoutDataWithClassName:@"DetailAdvertisement" objectId:obj]];
                [query2 includeKey:@"cityId"];
                [query2 includeKey:@"username"];
                
                [query2 findObjectsInBackgroundWithBlock:^(NSArray *objects2, NSError *error) {
                    for (PFObject *pfAdvertisement in objects2)
                    {
                        self.advertisementMapper = [[AdvertisementMapper alloc]init];
                        Advertisement *advertisement = [self.advertisementMapper mapParseAdvertisement:pfAdvertisement];
                        [self.advertisements2 addObject:advertisement];
                    }
                    completionBlock(self.advertisements2, self.userArray, error);
                }];
            }
        }
    }];
}

-(void) getAdvertisementWithUserObjectId:(NSString *)userObjectId WithCompletionBlock:(void (^)(NSArray *, NSError *))completionBlock{
    
    PFQuery *query = [PFQuery queryWithClassName:kAdvertisementTableParse];
    query.cachePolicy = kPFCachePolicyCacheThenNetwork;
    [query includeKey:@"cityId"];
    [query whereKey:@"username" equalTo:[PFUser objectWithoutDataWithObjectId:userObjectId]];
    [query includeKey:@"detailAdvertisementId"];
    [query includeKey:@"locationId"];
    [query includeKey:@"username"];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if(!error){
            NSMutableArray *advertisements = [NSMutableArray array];
            for (PFObject *pfAdvertisement in objects)
            {
                self.advertisementMapper = [[AdvertisementMapper alloc]init];
                Advertisement *advertisement = [self.advertisementMapper mapParseAdvertisement:pfAdvertisement];
                [advertisements addObject:advertisement];
            }
            completionBlock(advertisements, error);
        }
    }];
}


@end
