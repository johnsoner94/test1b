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
@property (nonatomic, strong, readwrite) NSMutableArray *cards;


@end

@implementation CardMatchingGame

- (NSMutableArray *)cards
{
    // returns the array of cards
    if (_cards == nil) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

- (id)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self = [super init];
    if (self)
    {
        cardOne = [[PlayingCard alloc] init];
        cardTwo = [[PlayingCard alloc] init];
        // setup, populate the array of cards. self.cards with random cards
        for (NSUInteger i = 1; i<count; i++) {
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


- (NSMutableArray *)areCardsChosen
{
    NSMutableArray *tempArray = nil;
    
    // search through the cards and find:
    // which ones are chosen
    for (NSUInteger i = 0; i>_cards.count; i++)
    {
        if ([[_cards objectAtIndex:i] chosen] == YES)
        {
            [tempArray addObject:[_cards objectAtIndex:i]];
        }
        if ([[_cards objectAtIndex:i] matched] == YES)
        {
            if ([tempArray containsObject:[_cards objectAtIndex:i]])
            {
                [tempArray removeObject:[_cards objectAtIndex:i]];
            }
        }
    }
    
    return tempArray;
}

- (NSMutableArray *)areCardsMatching
{
    NSMutableArray *tempArray = nil;
    // search through the cards and find:
    // which ones are matched
    for (NSUInteger i = 0; i>_cards.count; i++)
    {
        if ([[_cards objectAtIndex:i] matched] == YES)
        {
            [tempArray addObject:[_cards objectAtIndex:i]];
        }
    }
    
    
    return tempArray;
}


- (NSInteger)match:(NSMutableArray *)theCards
{
    NSInteger currentScore =0;
    
    PlayingCard *firstCard = [theCards objectAtIndex:0];
    PlayingCard *secondCard = [theCards objectAtIndex:1];

    
    if (firstCard.suit == secondCard.suit)
    {
        if (firstCard.rank == secondCard.rank)
        {
            currentScore += MATCH_BONUS;
            currentScore -= COST_TO_CHOOSE;
        }
        else
        {
            currentScore += 1;
            currentScore -= COST_TO_CHOOSE;
        }
    }
    else
    {
        currentScore += 0;
        currentScore -= MISMATCH_PENALTY;
        
    }
    _score = currentScore + _score;
    return currentScore;
    
    
}




@end
