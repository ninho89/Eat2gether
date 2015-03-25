//
//  Constants.h
//  EatTogetherPrueba
//
//  Created by Filippo Aresu on 16/3/15.
//  Copyright (c) 2015 Filippo Aresu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Constants : NSObject

//Constants City Table Parse
extern NSString * const kCityTableParse;
extern NSString * const kCityObjectIdParse;
extern NSString * const kCityIdParse;
extern NSString * const kCityNameParse;
extern NSString * const kCityCountryParse;
extern NSString * const kCityLocationIdParse;
extern NSString * const kCityPictureParse;

//Constants Location Table Parse
extern NSString * const kLocationTableParse;
extern NSString * const kLocationIdParse;
extern NSString * const kLocationCityIdParse;
extern NSString * const kLocationLatitudeParse;
extern NSString * const kLocationLongitudeParse;

//Constants Advertisement Table Parse
extern NSString * const kAdvertisementTableParse;
extern NSString * const kAdvertisementIdParse;
extern NSString * const kAdvertisementDetailAdvertisementIdParse;
extern NSString * const kAdvertisementUserIdParse;
extern NSString * const kAdvertisementUserUsername;
extern NSString * const kAdvertisementLocationIdParse;
extern NSString * const kAdvertisementLocationLatitude;
extern NSString * const kAdvertisementLocationLongitude;
extern NSString * const kAdvertisementCityIdParse;
extern NSString * const kAdvertisementCityLatitude;
extern NSString * const kAdvertisementCityLongitude;

//Constants Detail Advertisement Table Parse
extern NSString * const kDetailAdvertisementTableParse;
extern NSString * const kDetailAdvertisementIdParse;
extern NSString * const kDetailAdvertisementDescriptionParse;
extern NSString * const kDetailAdvertisementStarterParse;
extern NSString * const kDetailAdvertisementMainDishParse;
extern NSString * const kDetailAdvertisementDessertParse;
extern NSString * const kDetailAdvertisementNumGuestsParse;
extern NSString * const kDetailAdvertisementPriceParse;
extern NSString * const kDetailAdvertisementDateParse;
extern NSString * const kDetailAdvertisementPictureParse;
extern NSString * const kDetailAdvertisementIdiomsParse;
extern NSString * const kDetailAdvertisementTopicsParse;

//Constants User Table Parse
extern NSString * const kUserTableParse;
extern NSString * const kUserIdParse;
extern NSString * const kUserNameParse;
extern NSString * const kUserSurnameParse;
extern NSString * const kUserMailParse;
extern NSString * const kUserAddressParse;
extern NSString * const kUserPhoneParse;
extern NSString * const kUserPictureParse;

// Constants Custom Cell
extern NSString *const kCellCity;
extern NSString *const kCellAdvertisement;
extern NSString *const kCellFavorite;

//Costants Storyboard ViewController
extern NSString *const kStoryboardDetailCityListAdvertisementViewController;
extern NSString *const kStoryboardMapCityListAdvertisementViewController;
extern NSString *const kStoryboardDetailAdvertisementViewController;
extern NSString *const kStoryboardUserProfileViewController;
extern NSString *const kStoryboardUserCreateAccountViewController;
extern NSString *const kStoryboardFavoriteAdvertisementViewController;
extern NSString *const kStoryboardUserProfileAccountViewController;
extern NSString *const kStoryboardUserProfileAccountAdvertisementsViewController;
extern NSString *const kStoryboardUserProfileAccountAdvertisementRequestViewController;
extern NSString *const kStoryboardUserProfileAccountAddAdvertisementsViewController;
extern NSString *const kStoryboardUserProfileAccountAdvertisementRequestRecieveViewController;


@end
