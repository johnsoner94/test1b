//
//  CardMatchingGame.m
//  CardMatchingGame
//
//  Created by Emily Johnson on 2/27/14.
//  Copyright (c) 2014 Emily Johnson. All rights reserved.
//

#import "CardMatchingGame.h"
#import "Deck.h"
#import "Card.h"

@interface CardMatchingGame()

@property (readwrite) NSInteger score;

@end

@implementation CardMatchingGame



- (id)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super init];
    if (self)
    {
        Card *aCard = deck.drawRandomCard;
        [deck addCard: aCard];
    }
    return self;
    
}

// I haven't figured out how to access the private array in the Deck class yet, which is nessasary for this code.
- (void)chooseCardAtIndex:(NSUInteger)index
{
    
}

- (Card *)getCardUsingIndex:(NSUInteger)index
{
    Card *theCard;
    return theCard; //[[Deck cards]objectAtIndex:index];
}

@end
