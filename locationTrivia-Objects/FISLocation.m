//
//  FISLocation.m
//  locationTrivia-Objects
//
//  Created by Jordan Kiley on 6/15/16.
//  Copyright © 2016 Joe Burgess. All rights reserved.
//

#import "FISLocation.h"

@implementation FISLocation

- (instancetype)init {
    self = [self initWithName:@"" latitude:0 longitude:0];
    return self;
}

- (instancetype)initWithName:(NSString *)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude {
    self = [ super init];
    if (self) {
        _name = name;
        _latitude = latitude ;
        _longitude = longitude ;
        _trivia = [ NSMutableArray new ];
    }
    return self;
}

- (NSString *)stringByTruncatingNameToLength:(NSUInteger)length {
    if (length >= [self.name length] ) {
        self.name = self.name ;
    } else {
        self.name = [ self.name substringToIndex:length ]; }
    return self.name;
}

- (BOOL)hasValidData {
    if ( [self.name isEqualToString:@""] || self.name == nil ) {
        return NO ;
    } else if ( self.latitude < -90 || self.latitude > 90 ){
        return NO;
    } else if (self.longitude <= -180 || self.longitude > 180) {
        return NO;
    } else {
        return YES;}
}

- (FISTrivium *)triviumWithMostLikes {
    if ( [self.trivia count] == 0) {
        return nil;
    } else{
    NSSortDescriptor *mostLikes = [ NSSortDescriptor sortDescriptorWithKey:@"likes" ascending:NO ];
    self.trivia = [ self.trivia sortedArrayUsingDescriptors:@[mostLikes]];

//        NSLog(@"most liked %@", [self.trivia]);
        FISTrivium *trivium = self.trivia[0];
                NSLog(@"self trivia %@", trivium.content );
        return self.trivia[0]; }
}
@end
