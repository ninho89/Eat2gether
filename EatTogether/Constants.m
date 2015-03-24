//
//  Constants.m
//  EatTogetherPrueba
//
//  Created by Filippo Aresu on 16/3/15.
//  Copyright (c) 2015 Filippo Aresu. All rights reserved.
//

#import "Constants.h"

@implementation Constants

//Constants City Table Parse
NSString * const kCityTableParse = @"City";
NSString * const kCityObjectIdParse = @"objectId";
NSString * const kCityIdParse = @"cityId";
NSString * const kCityNameParse = @"cityName";
NSString * const kCityCountryParse = @"cityCountry";
NSString * const kCityLocationIdParse = @"locationId";
NSString * const kCityPictureParse = @"cityPicture";

//Constants Location Table Parse
NSString * const kLocationTableParse = @"Location";
NSString * const kLocationIdParse = @"locationId";
NSString * const kLocationCityIdParse = @"cityId";
NSString * const kLocationLatitudeParse = @"locationLatitude";
NSString * const kLocationLongitudeParse = @"locationLongitude";

//Constants Advertisement Table Parse
NSString * const kAdvertisementTableParse = @"Advertisement";
NSString * const kAdvertisementIdParse = @"advertisementId";
NSString * const kAdvertisementDetailAdvertisementIdParse = @"detailAdvertisementId";
NSString * const kAdvertisementUserIdParse = @"userId";
NSString * const kAdvertisementUserUsername = @"username";
NSString * const kAdvertisementLocationIdParse = @"locationId";
NSString * const kAdvertisementLocationLatitude = @"locationLatitude";
NSString * const kAdvertisementLocationLongitude = @"locationLongitude";
NSString * const kAdvertisementCityIdParse = @"cityId";
NSString * const kAdvertisementCityLatitude = @"locationLatitude";
NSString * const kAdvertisementCityLongitude = @"locationLatitude";

//Constants Detail Advertisement Table Parse
NSString * const kDetailAdvertisementTableParse = @"DetailAdvertisement";
NSString * const kDetailAdvertisementIdParse = @"detailAdvertisementId";
NSString * const kDetailAdvertisementDescriptionParse = @"detailAdvertisementDescription";
NSString * const kDetailAdvertisementStarterParse = @"detailAdvertisementStarter";
NSString * const kDetailAdvertisementMainDishParse = @"detailAdvertisementMainDish";
NSString * const kDetailAdvertisementDessertParse = @"detailAdvertisementDessert";
NSString * const kDetailAdvertisementNumGuestsParse = @"detailAdvertisementNumGuests";
NSString * const kDetailAdvertisementPriceParse = @"detailAdvertisementPrice";
NSString * const kDetailAdvertisementDateParse = @"detailAdvertisementDate";
NSString * const kDetailAdvertisementPictureParse = @"detailAdvertisementPicture";
NSString * const kDetailAdvertisementIdiomsParse = @"detailAdvertisementIdioms";
NSString * const kDetailAdvertisementTopicsParse = @"detailAdvertisementTopics";

//Constants User Table Parse
NSString * const kUserTableParse = @"User";
NSString * const kUserIdParse = @"userId";
NSString * const kUserNameParse = @"username";
NSString * const kUserSurnameParse = @"userSurname";
NSString * const kUserMailParse = @"userMail";
NSString * const kUserAddressParse = @"userAddress";
NSString * const kUserPhoneParse = @"userPhone";
NSString * const kUserPictureParse = @"userPicture";

//Constants Custom Cell
NSString *const kCellCity = @"CellIdCity";
NSString *const kCellAdvertisement = @"CellIdAdvertisement";
NSString *const kCellFavorite = @"CellIdFavorite";

//Costants Storyboard ViewController
NSString *const kStoryboardDetailCityListAdvertisementViewController = @"detailCityListAdvertisementViewController";
NSString *const kStoryboardMapCityListAdvertisementViewController = @"mapCityListAdvertisementViewController";
NSString *const kStoryboardDetailAdvertisementViewController = @"detailAdvertisement";
NSString *const kStoryboardUserProfileViewController = @"userProfileViewController";
NSString *const kStoryboardUserCreateAccountViewController = @"userCreateAccountViewController";
NSString *const kStoryboardFavoriteAdvertisementViewController = @"favoriteAdvertisementViewController";
NSString *const kStoryboardUserProfileAccountViewController = @"userProfileAccountViewController";
NSString *const kStoryboardUserProfileAccountAdvertisementsViewController = @"userProfileAccountAdvertisementsViewController";
NSString *const kStoryboardUserProfileAccountAdvertisementRequestViewController = @"userProfileAccountAdvertisementsRequestViewController";



@end
