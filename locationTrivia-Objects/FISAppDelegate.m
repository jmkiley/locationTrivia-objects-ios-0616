//  FISAppDelegate.m

#import "FISAppDelegate.h"


@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    return YES;
}

- (NSArray *)allLocationNames {
    
    NSArray *arrayOfNames = [ self.locations valueForKey:@"name"];
    return arrayOfNames;
}

- (FISLocation *)locationNamed:(NSString *)name {
    for (FISLocation *location in self.locations)
    { if ([[ location valueForKey:@"name"] isEqualToString:name]) {
        return location;
    }
    }
    return nil;
}

- (NSArray *)locationsNearLatitude:(CGFloat)latitude longitude:(CGFloat)longitude margin:(CGFloat)margin {
    NSPredicate *checkLocationsLongitude = [ NSPredicate predicateWithFormat:@"longitude BETWEEN %@", @[@(longitude-margin), @(longitude+margin)]];
    NSPredicate *checkLocationsLatitude = [ NSPredicate predicateWithFormat:@"latitude BETWEEN %@", @[@(latitude-margin), @(latitude+margin)]];
    NSArray *locationsFiltered = [ [self.locations filteredArrayUsingPredicate:checkLocationsLatitude] filteredArrayUsingPredicate:checkLocationsLongitude];
    return locationsFiltered;
}
@end
