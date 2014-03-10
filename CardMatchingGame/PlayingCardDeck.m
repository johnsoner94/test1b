//
//  PlayingCardDeck.m
//  Practice1
//
//  Created by Emily Johnson on 2/17/14.
//  Copyright (c) 2014 Emily Johnson. All rights reserved.
//

#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck
- (id)init
{
    self = [super init];
    if (self)
    {
        for (NSString *suit in [PlayingCard validSuits])
        {
            for (NSUInteger i =1; i<[PlayingCard maxRank] ; i++)
            {
                PlayingCard *card = [[PlayingCard alloc] init];
                card.rank = i;
                card.suit = suit;
                [self addCard:card atTop:YES];
            }
        }
    }
    return self;
}

@end
