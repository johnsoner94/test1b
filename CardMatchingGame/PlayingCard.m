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
@synthesize rank = _rank;
- (NSString *)contents
{
    /*NSArray *rankStrings = [PlayingCard rankStrings];
     return [rankStrings[self.rank] stringByAppendingString:self.suit];*/
    return [NSString stringWithFormat:@"%@%@",[self rankAsStrings],[self suit]];
}

+ (NSUInteger)maxRank
{
    return 13;
}

- (void) setSuit:(NSString *)suit
{
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

+ (NSArray *)validSuits
{
    return @[@"♥️", @"♣️", @"♦️", @"♠️"];
}

+ (NSArray *)rankStrings
{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

- (NSString *)rankAsStrings
{
    NSUInteger val = self.rank;
    switch (val)
    {
        case 0:
        {
            return @"?";
            break;
        }
        case 1:
        {
            return @"1";
            break;
        }
        case 2:
        {
            return @"2";
            break;
        }
        case 3:
        {
            return @"3";
            break;
        }
        case 4:
        {
            return @"4";
            break;
        }
        case 5:
        {
            return @"5";
            break;
        }
        case 6:
        {
            return @"6";
            break;
        }
        case 7:
        {
            return @"7";
            break;
        }
        case 8:
        {
            return @"8";
            break;
        }
        case 9:
        {
            return @"9";
            break;
        }
        case 10:
        {
            return @"10";
            break;
        }
        case 11:
        {
            return @"J";
            break;
        }
        case 12:
        {
            return @"Q";
            break;
        }
        case 13:
        {
            return @"K";
            break;
        }
        default: {
            return @"?";
        }
    }
}


- (void)setRank:(NSUInteger)rank
{
    if (_rank <= [PlayingCard maxRank])
    {
        _rank = rank;
    }
}


- (int)match:(NSArray *)otherCards
{
    int score = 0;
    for (Card *c  in otherCards)
    {
        
        if ([c.suit isEqualToString:self.suit])
        {
            score = 4;
            self.matched = YES;
        }
        else
        {
            if (c.rank == self.rank)
            {
                score = 1;
                self.matched = YES;
            }
            self.matched = NO;
        }
    
    }
    return score;
}


@end
