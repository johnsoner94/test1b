//
//  PlayingCard.m
//  Practice1
//
//  Created by Emily Johnson on 2/17/14.
//  Copyright (c) 2014 Emily Johnson. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard
@synthesize suit=_suit;

- (void) setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

+ (NSArray *)rankStrings
{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

- (void)setRank:(NSUInteger)rank
{
    if (rank <= [PlayingCard maxRank])
    {
        _rank = rank;
    }
}

- (NSString *)contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

- (NSString *) getSuit
{
    
    return _suit ? _suit :@"?";
    
}

+ (NSUInteger)maxRank
{
    return [[self rankStrings] count] - 1;
}

+ (NSArray *)validSuits
{
    return @[@"♥︎", @"♣︎", @"♦︎", @"♠︎"];
}


@end
