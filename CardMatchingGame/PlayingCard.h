//
//  PlayingCard.h
//  Practice1
//
//  Created by Emily Johnson on 2/17/14.
//  Copyright (c) 2014 Emily Johnson. All rights reserved.
//
#import "Card.h"

#import <Foundation/Foundation.h>

@interface PlayingCard : Card {
}
@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;
- (NSString *)rankAsStrings;

@end
