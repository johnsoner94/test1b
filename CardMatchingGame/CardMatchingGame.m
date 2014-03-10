//
//  CardMatchingGame.m
//  CardMatchingGame
//
//  Created by Emily Johnson on 2/27/14.
//  Copyright (c) 2014 Emily Johnson. All rights reserved.
//

#import "CardMatchingGame.h"
#import "Deck.h"

@interface CardMatchingGame()

@property (readwrite) NSInteger score;


@end

@implementation CardMatchingGame

- (NSMutableArray *)cards
{
    // returns the array of cards
    return self.cards;
}

- (id)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super init];
    if (self)
    {
        cardOne = [[PlayingCard alloc] init];
        cardTwo = [[PlayingCard alloc] init];
        // setup, populate the array of cards. self.cards with random cards
        for (NSUInteger i = 0; i<15; i++) {
            PlayingCard *aCard = deck.drawRandomCard;
            [deck addCard:aCard atTop:YES];
        }
        
    }
    return self;
    
}



- (PlayingCard *)cardAtIndex:(NSUInteger)index
{
    return (index < [self.cards count]? [self.cards objectAtIndex:index]: nil);
}

#define MISMATCH_PENALTY 2
#define COST_TO_CHOOSE 1
#define MATCH_BONUS 4

- (void)chooseCardWithTag:(NSUInteger)tag
{
    // if you use tags you can implement the choice here
    [self cardAtIndex:tag];
    
}

- (void)chooseCardAtIndex:(NSUInteger)index
{
    // if you use an index you can use this routine to implement the choice
    PlayingCard *card = [self cardAtIndex:index];
    card.chosen = YES;
    
}

- (NSInteger)match:(PlayingCard *)firstCard toMatch: (PlayingCard *)secondCard
{
    NSInteger currentScore =0;
    
    if (firstCard.suit == secondCard.suit)
    {
        if (firstCard.rank == secondCard.rank)
        {
            currentScore = 4;
        }
        currentScore = 1;
    }
    else
        currentScore = 0;
    _score = currentScore + _score;
    return currentScore;
    
    
}




@end
