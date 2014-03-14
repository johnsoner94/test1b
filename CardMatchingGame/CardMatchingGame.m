//
//  CardMatchingGame.m
//  CardMatchingGame
//
//  Created by Emily Johnson on 2/27/14.
//  Copyright (c) 2014 Emily Johnson. All rights reserved.
//

#import "CardMatchingGame.h"
#import "PlayingCardDeck.h"

@interface CardMatchingGame()

@property (readwrite) NSInteger score;
@property (nonatomic, strong, readwrite) NSMutableArray *cards;

// Can I make it so that it only calls cards? What is the point of using deck?


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

- (id)initWithCardCount:(NSUInteger)count usingDeck:(PlayingCardDeck *)deck
{
    self = [super init];
    if (self)
    {
        [self cards];
        // setup, populate the array of cards. self.cards with random cards
        for (NSUInteger i = 1; i<16; i++)
        {
            PlayingCard *aCard = deck.drawRandomCard;
            [_cards addObject:aCard];
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
    for (PlayingCard *p in _cards)
    {
        if (p.chosen)
        {
            if (![_cards indexOfObject:p] == index)
            {
                PlayingCard *indexCard = [_cards objectAtIndex:index];
                NSMutableArray *tempArray = [[NSMutableArray alloc]init];
                [tempArray addObject:p];
                [tempArray addObject:indexCard];
                _score+=[self match:tempArray];
            }
        }
    }
    
    PlayingCard *card = [self cardAtIndex:index];
    if (card.chosen) {
        card.chosen = NO;
    }
    else
    {
        card.chosen = YES;
        _score -= 1;
    }
}


//- (NSMutableArray *)areCardsChosen
//{
//    NSMutableArray *tempArray = [[NSMutableArray alloc] init];
//    
//    // search through the cards and find:
//    // which ones are chosen
//    for (NSUInteger i = 0; i<_cards.count; i++)
//    {
//        if ([[_cards objectAtIndex:i] chosen] == YES)
//        {
//            [tempArray addObject:[_cards objectAtIndex:i]];
//        }
//        if ([[_cards objectAtIndex:i] matched] == YES)
//        {
//            if ([tempArray containsObject:[_cards objectAtIndex:i]])
//            {
//                [tempArray removeObject:[_cards objectAtIndex:i]];
//            }
//        }
//    }
//    
//    return tempArray;
//}

//- (NSMutableArray *)areCardsMatching
//{
//    NSMutableArray *tempArray = nil;
//    // search through the cards and find:
//    // which ones are matched
//    for (NSUInteger i = 0; i>_cards.count; i++)
//    {
//        if ([[_cards objectAtIndex:i] matched] == YES)
//        {
//            [tempArray addObject:[_cards objectAtIndex:i]];
//        }
//    }
//    
//    
//    return tempArray;
//}


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
    //_score = currentScore + _score;
    
    firstCard.matched = YES;
    secondCard.matched = YES;
    
    return currentScore;
    
}





@end
