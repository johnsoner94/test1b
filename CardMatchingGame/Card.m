//
//  Card.m
//  Practice1
//
//  Created by Emily Johnson on 2/15/14.
//  Copyright (c) 2014 Emily Johnson. All rights reserved.
//

/* This is where you implement your methods you declared in the header file
 You will need to syntheize the suit (why?)
 */


#import "Card.h"

@implementation Card
@synthesize suit = _suit;

- (int)match:(NSArray *)otherCards {
    if ([otherCards containsObject:self.contents])
    {
        self.matched = YES;
        return 1;
    }
    return 0;
}

- (NSString *)rankAsString
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



- (void) setSuit:(NSString *)aSuit
{
    if ([[Card validSuits] containsObject:aSuit]) {
        _suit = aSuit;
    }
}

- (NSString *)suit {
    NSString *theSuit;
    theSuit = _suit;
    return theSuit;
}

+ (NSArray *)validSuits {
    NSArray *valid;
    valid = @[@"♥️", @"♣️", @"♦️", @"♠️"];
    return valid;
}

- (NSString *)contents {
    return [NSString stringWithFormat:@"%@%@",[self rankAsString],[self suit]];
}

@end

