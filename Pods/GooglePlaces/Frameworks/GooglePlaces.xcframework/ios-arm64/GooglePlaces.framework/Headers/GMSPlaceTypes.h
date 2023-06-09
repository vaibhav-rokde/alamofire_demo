//
//  GMSPlaceTypes.h
//  Google Places SDK for iOS
//
//  Copyright 2016 Google LLC
//
//  Usage of this SDK is subject to the Google Maps/Google Earth APIs Terms of
//  Service: https://cloud.google.com/maps-platform/terms
//

#import <Foundation/Foundation.h>

/**
 * \defgroup PlaceTypes GMSPlaceType
 * @{
 */

/**
 * The constants for the Table 1 place types for the API. Complete list can be found at
 * https://developers.google.com/maps/documentation/places/ios-sdk/supported_types
 */
extern NSString *const kGMSPlaceTypeAccounting;
extern NSString *const kGMSPlaceTypeAirport;
extern NSString *const kGMSPlaceTypeAmusementPark;
extern NSString *const kGMSPlaceTypeAquarium;
extern NSString *const kGMSPlaceTypeArtGallery;
extern NSString *const kGMSPlaceTypeAtm;
extern NSString *const kGMSPlaceTypeBakery;
extern NSString *const kGMSPlaceTypeBank;
extern NSString *const kGMSPlaceTypeBar;
extern NSString *const kGMSPlaceTypeBeautySalon;
extern NSString *const kGMSPlaceTypeBicycleStore;
extern NSString *const kGMSPlaceTypeBookStore;
extern NSString *const kGMSPlaceTypeBowlingAlley;
extern NSString *const kGMSPlaceTypeBusStation;
extern NSString *const kGMSPlaceTypeCafe;
extern NSString *const kGMSPlaceTypeCampground;
extern NSString *const kGMSPlaceTypeCarDealer;
extern NSString *const kGMSPlaceTypeCarRental;
extern NSString *const kGMSPlaceTypeCarRepair;
extern NSString *const kGMSPlaceTypeCarWash;
extern NSString *const kGMSPlaceTypeCasino;
extern NSString *const kGMSPlaceTypeCemetery;
extern NSString *const kGMSPlaceTypeChurch;
extern NSString *const kGMSPlaceTypeCityHall;
extern NSString *const kGMSPlaceTypeClothingStore;
extern NSString *const kGMSPlaceTypeConvenienceStore;
extern NSString *const kGMSPlaceTypeCourthouse;
extern NSString *const kGMSPlaceTypeDentist;
extern NSString *const kGMSPlaceTypeDepartmentStore;
extern NSString *const kGMSPlaceTypeDoctor;
extern NSString *const kGMSPlaceTypeDrugstore;
extern NSString *const kGMSPlaceTypeElectrician;
extern NSString *const kGMSPlaceTypeElectronicsStore;
extern NSString *const kGMSPlaceTypeEmbassy;
extern NSString *const kGMSPlaceTypeFireStation;
extern NSString *const kGMSPlaceTypeFlorist;
extern NSString *const kGMSPlaceTypeFuneralHome;
extern NSString *const kGMSPlaceTypeFurnitureStore;
extern NSString *const kGMSPlaceTypeGasStation;
extern NSString *const kGMSPlaceTypeGroceryOrSupermarket;
extern NSString *const kGMSPlaceTypeGym;
extern NSString *const kGMSPlaceTypeHairCare;
extern NSString *const kGMSPlaceTypeHardwareStore;
extern NSString *const kGMSPlaceTypeHinduTemple;
extern NSString *const kGMSPlaceTypeHomeGoodsStore;
extern NSString *const kGMSPlaceTypeHospital;
extern NSString *const kGMSPlaceTypeInsuranceAgency;
extern NSString *const kGMSPlaceTypeJewelryStore;
extern NSString *const kGMSPlaceTypeLaundry;
extern NSString *const kGMSPlaceTypeLawyer;
extern NSString *const kGMSPlaceTypeLibrary;
extern NSString *const kGMSPlaceTypeLightRailStation;
extern NSString *const kGMSPlaceTypeLiquorStore;
extern NSString *const kGMSPlaceTypeLocalGovernmentOffice;
extern NSString *const kGMSPlaceTypeLocksmith;
extern NSString *const kGMSPlaceTypeLodging;
extern NSString *const kGMSPlaceTypeMealDelivery;
extern NSString *const kGMSPlaceTypeMealTakeaway;
extern NSString *const kGMSPlaceTypeMosque;
extern NSString *const kGMSPlaceTypeMovieRental;
extern NSString *const kGMSPlaceTypeMovieTheater;
extern NSString *const kGMSPlaceTypeMovingCompany;
extern NSString *const kGMSPlaceTypeMuseum;
extern NSString *const kGMSPlaceTypeNightClub;
extern NSString *const kGMSPlaceTypePainter;
extern NSString *const kGMSPlaceTypePark;
extern NSString *const kGMSPlaceTypeParking;
extern NSString *const kGMSPlaceTypePetStore;
extern NSString *const kGMSPlaceTypePharmacy;
extern NSString *const kGMSPlaceTypePhysiotherapist;
extern NSString *const kGMSPlaceTypePlumber;
extern NSString *const kGMSPlaceTypePrimarySchool;
extern NSString *const kGMSPlaceTypePolice;
extern NSString *const kGMSPlaceTypePostOffice;
extern NSString *const kGMSPlaceTypeRealEstateAgency;
extern NSString *const kGMSPlaceTypeRestaurant;
extern NSString *const kGMSPlaceTypeRoofingContractor;
extern NSString *const kGMSPlaceTypeRvPark;
extern NSString *const kGMSPlaceTypeSchool;
extern NSString *const kGMSPlaceTypeSecondarySchool;
extern NSString *const kGMSPlaceTypeShoeStore;
extern NSString *const kGMSPlaceTypeShoppingMall;
extern NSString *const kGMSPlaceTypeSpa;
extern NSString *const kGMSPlaceTypeStadium;
extern NSString *const kGMSPlaceTypeStorage;
extern NSString *const kGMSPlaceTypeStore;
extern NSString *const kGMSPlaceTypeSubwayStation;
extern NSString *const kGMSPlaceTypeSupermarket;
extern NSString *const kGMSPlaceTypeSynagogue;
extern NSString *const kGMSPlaceTypeTaxiStand;
extern NSString *const kGMSPlaceTypeTrainStation;
extern NSString *const kGMSPlaceTypeTravelAgency;
extern NSString *const kGMSPlaceTypeTransitStation;
extern NSString *const kGMSPlaceTypeTouristAttraction;
extern NSString *const kGMSPlaceTypeUniversity;
extern NSString *const kGMSPlaceTypeVeterinaryCare;
extern NSString *const kGMSPlaceTypeZoo;

/**
 * The constants for Table 2 additional types returned by the Places service. Complete list can be
 * found at https://developers.google.com/maps/documentation/places/ios-sdk/supported_types.
 * Note: The types below are not supported in the type filter of a place search.
 */
extern NSString *const kGMSPlaceTypeAdministrativeAreaLevel1;
extern NSString *const kGMSPlaceTypeAdministrativeAreaLevel2;
extern NSString *const kGMSPlaceTypeAdministrativeAreaLevel3;
extern NSString *const kGMSPlaceTypeAdministrativeAreaLevel4;
extern NSString *const kGMSPlaceTypeAdministrativeAreaLevel5;
extern NSString *const kGMSPlaceTypeColloquialArea;
extern NSString *const kGMSPlaceTypeCountry;
extern NSString *const kGMSPlaceTypeEstablishment;
extern NSString *const kGMSPlaceTypeFinance;
extern NSString *const kGMSPlaceTypeFloor;
extern NSString *const kGMSPlaceTypeFood;
extern NSString *const kGMSPlaceTypeGeneralContractor;
extern NSString *const kGMSPlaceTypeGeocode;
extern NSString *const kGMSPlaceTypeHealth;
extern NSString *const kGMSPlaceTypeIntersection;
extern NSString *const kGMSPlaceTypeLocality;
extern NSString *const kGMSPlaceTypeNaturalFeature;
extern NSString *const kGMSPlaceTypeNeighborhood;
extern NSString *const kGMSPlaceTypePlaceOfWorship;
extern NSString *const kGMSPlaceTypePointOfInterest;
extern NSString *const kGMSPlaceTypePolitical;
extern NSString *const kGMSPlaceTypePostBox;
extern NSString *const kGMSPlaceTypePostalCode;
extern NSString *const kGMSPlaceTypePostalCodePrefix;
extern NSString *const kGMSPlaceTypePostalCodeSuffix;
extern NSString *const kGMSPlaceTypePostalTown;
extern NSString *const kGMSPlaceTypePremise;
extern NSString *const kGMSPlaceTypeRoom;
extern NSString *const kGMSPlaceTypeRoute;
extern NSString *const kGMSPlaceTypeStreetAddress;
extern NSString *const kGMSPlaceTypeStreetNumber;
extern NSString *const kGMSPlaceTypeSublocality;
extern NSString *const kGMSPlaceTypeSublocalityLevel1;
extern NSString *const kGMSPlaceTypeSublocalityLevel2;
extern NSString *const kGMSPlaceTypeSublocalityLevel3;
extern NSString *const kGMSPlaceTypeSublocalityLevel4;
extern NSString *const kGMSPlaceTypeSublocalityLevel5;
extern NSString *const kGMSPlaceTypeSubpremise;
extern NSString *const kGMSPlaceTypeTownSquare;

/**
 * The constants for the Table 3 types for the API. Complete list can be found at
 * https://developers.google.com/maps/documentation/places/ios-sdk/supported_types
 * NOTE: Geocode and Establishment are found in table 2.
 */
extern NSString *const kGMSPlaceTypeCollectionAddress;
extern NSString *const kGMSPlaceTypeCollectionRegion;
extern NSString *const kGMSPlaceTypeCollectionCity;

/**@}*/
