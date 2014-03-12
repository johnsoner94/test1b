//
//  Deck.m
//  Practice1
//
//  Created by Emily Johnson on 2/15/14.
//  Copyright (c) 2014 Emily Johnson. All rights reserved.
//

#import "Deck.h"
#import "Card.h"
#import "PlayingCard.h"

@interface Deck()
@property (strong, nonatomic) NSMutableArray *cards;

@end


@implementation Deck
//@synthesize cards=_cards;

- (NSMutableArray *)cards
{
    if (!_cards)
    {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

-(id)init
{
    self = [super init];
    if (self)
    {
        // set up deck
        NSMutableArray *deck = [[NSMutableArray alloc] init];
        // Loop throught the valid suits and ranks and create the deck
        for (NSString *suit in [PlayingCard validSuits])
        {
            for (NSUInteger i =1; i<[PlayingCard maxRank] ; i++)
            {
                PlayingCard *card = [[PlayingCard alloc] init];
                card.rank = i;
                card.suit = suit;
                [deck addObject:[self.cards objectAtIndex:i]];
            }
        }
    }
    return self;

//        // set up deck
//        NSMutableArray *deck = [[NSMutableArray alloc] init];
//        // Loop throught the valid suits and ranks and create the deck
//        for (NSUInteger i=0; i<[self.cards count]; i++) {
//            if ([[[self.cards objectAtIndex:i] validSuits] indexOfObject:[[self.cards objectAtIndex:i] suit]] != NSNotFound && ![[[self.cards objectAtIndex:i] rankAsString] isEqualToString:@"?"]) {
//                [deck addObject:[self.cards objectAtIndex:i]];
//            }
//        }
//    }
//    return self;
}

- (Card *)getCard:(NSUInteger)index
{
    return [_cards objectAtIndex: index];
}



- (void)addCard:(PlayingCard *)aCard atTop: (BOOL) atTop

{
    if (atTop) {
        [self.cards insertObject:aCard atIndex:0];
    }
    else
    {
        [self.cards addObject:aCard];
    }
}

- (void)addCard:(PlayingCard *)aCard
{
    [self addCard:aCard atTop:NO];
}

- (PlayingCard *)drawRandomCard
{
    randomCard = nil;
    if ([self.cards count]) {
        unsigned index = arc4random()  % [self.cards count];
        randomCard = [self.cards objectAtIndex:index];
        [self.cards removeObject:randomCard];
    }
    
    
    return randomCard;
}



@end
