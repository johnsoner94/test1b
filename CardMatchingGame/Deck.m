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
@synthesize cards=_cards;

- (Card *) drawRandomCard
{
    Card *randomCard = nil;
    if ([self.cards count]) {
        unsigned index = arc4random()  % [self.cards count];
        randomCard = [self.cards objectAtIndex:index];
        [self.cards removeObject:randomCard];
    }
    
    
    return randomCard;
}

- (Card *)getCard:(NSUInteger)index
{
    return [_cards objectAtIndex: index];
}



- (void) addCard:(Card *)aCard atTop: (BOOL) atTop

{
    if (atTop) {
        [self.cards insertObject:aCard atIndex:0];
    }
    else
    {
        [self.cards addObject:aCard];
    }
}

- (void) addCard: (Card *)aCard
{
    [self addCard:aCard atTop:NO];
}

- (NSMutableArray *)cards
{
    if (!_cards)
    {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}



@end
