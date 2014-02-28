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

@property (readonly) NSInteger score;

- (Card *)getCardUsingIndex:(NSUInteger)index;
- (id)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck;
- (void)chooseCardAtIndex:(NSUInteger)index;

@end
