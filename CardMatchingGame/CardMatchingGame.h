//
//  CardMatchingGame.h
//  CardMatchingGame
//
//  Created by Emily Johnson on 2/27/14.
//  Copyright (c) 2014 Emily Johnson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface CardMatchingGame : NSObject
{
    @public PlayingCard *cardOne;
    @public PlayingCard *cardTwo;
}

@property (readonly) NSInteger score;

- (PlayingCard *)cardAtIndex:(NSUInteger)index;
- (id)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck;
- (void)chooseCardWithTag:(NSUInteger)tag;
- (void)chooseCardAtIndex:(NSUInteger)index;
- (NSInteger)match:(PlayingCard *)firstCard toMatch: (PlayingCard *)secondCard;

@end
