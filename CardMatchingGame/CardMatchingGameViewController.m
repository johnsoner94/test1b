//
//  CardMatchingGameViewController.m
//  CardMatchingGame
//
//  Created by Emily Johnson on 2/27/14.
//  Copyright (c) 2014 Emily Johnson. All rights reserved.
//

#import "CardMatchingGameViewController.h"
#import "CardMatchingGame.h"
#import "Deck.h"


@interface CardMatchingGameViewController ()
@property (nonatomic) IBOutlet CardMatchingGame *cardGame;
@property (strong, nonatomic) IBOutlet UIView *cardView;
@property (nonatomic) NSMutableArray *deckOfCards;


@end

@implementation CardMatchingGameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
//    Do any additional setup after loading the view, typically from a nib.
    
    self.cardGame= [[CardMatchingGame alloc] initWithCardCount:16 usingDeck:[[Deck alloc] init]];
    
    NSString *currentTotalScoreStr = [NSString stringWithFormat:@"%d", self.cardGame.score];
    [self.score setText:currentTotalScoreStr];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CardMatchingGame *)game
{
    // this is just a lazy instantation of the card game model
    if (_cardGame == nil) {
        _cardGame = [[CardMatchingGame alloc] init];
    }
    return _cardGame;
}

- (Deck *)deck
{
    return self.deck;
}

- (Deck *)createDeck
{
    // creates the deck and then returns it
    Deck *deck = [[Deck alloc] init];
    return deck;
}

- (void)updateUI
{
    // the cards that have been chosen need to have their background changed and their title set
    NSMutableArray *chosenCards = [self.cardGame areCardsChosen];
    
    if (chosenCards.count == 1) {
        
        PlayingCard *cardOne = [chosenCards objectAtIndex:0];
        
        NSInteger indexOne = [_deckOfCards indexOfObject:cardOne];
        indexOne+=100;
        
        UIButton *buttonOne = (UIButton *)[self.view viewWithTag:indexOne];
                            // I want this to call a button using it's tag
        [buttonOne setBackgroundImage:[self backgroundImageForCard:cardOne] forState:UIControlStateNormal];
        [buttonOne setTitle:cardOne.contents forState:UIControlStateNormal];
    }
    
    else if (chosenCards.count == 2)
    {
        //PlayingCard *cardOne = [chosenCards objectAtIndex:0];
        PlayingCard *cardTwo = [chosenCards objectAtIndex:1];
        
//        NSInteger indexOne = [_deckOfCards indexOfObject:cardOne]+100;
//        UIButton *buttonOne = (UIButton *)[self.view viewWithTag:indexOne];
//        [buttonOne setBackgroundImage:[self backgroundImageForCard:cardOne] forState:UIControlStateSelected];
//        [buttonOne setTitle:cardOne.contents forState:UIControlStateNormal];
        
        NSInteger indexTwo = [_deckOfCards indexOfObject:cardTwo];
        indexTwo+=100;
        UIButton *buttonTwo = (UIButton *)[self.view viewWithTag:indexTwo];
        [buttonTwo setBackgroundImage:[self backgroundImageForCard: cardTwo] forState:UIControlStateNormal];
        [buttonTwo setTitle:cardTwo.contents forState:UIControlStateNormal];
        
        //the cards that have been matched need to be disabled
        NSMutableArray *matchedCards = [self.cardGame areCardsChosen];
        PlayingCard *matchOne = [matchedCards objectAtIndex:0];
        PlayingCard *matchTwo = [matchedCards objectAtIndex:1];
        
        NSInteger matchNumOne = [_deckOfCards indexOfObject:matchOne];
        matchNumOne+=100;
        UIButton *matchButtonOne = (UIButton *)[self.view viewWithTag:matchNumOne];
        matchButtonOne.enabled = NO;
        [matchButtonOne setBackgroundImage:[self backgroundImageForCard:matchOne] forState:UIControlStateNormal];
        
        NSInteger matchNumTwo = [_deckOfCards indexOfObject:matchTwo];
        matchNumTwo+=100;
        UIButton *matchButtonTwo = (UIButton *)[self.view viewWithTag:matchNumTwo];
        matchButtonTwo.enabled = NO;
        [matchButtonOne setBackgroundImage:[self backgroundImageForCard:matchTwo] forState:UIControlStateNormal];
    }
    
    
    //set the score Label
    NSString *currentTotalScoreStr = [NSString stringWithFormat:@"%d", self.cardGame.score];
    [self.score setText:currentTotalScoreStr];
    [_cardView setNeedsDisplay];
}


- (UIImage *)backgroundImageForCard:(Card *)card
{
    // returns the background image for a card.
    if (card.chosen == YES) {
        return [UIImage imageNamed:@"blank.png"];
    }
    return [UIImage imageNamed:@"muhback.png"];
}

- (NSString *)titleForCard:(Card *)card
{
    return card.contents;
}

- (IBAction)flipCard:(UIButton *)sender
{
    // tells the game to choose the selected card
    
    [self.cardGame chooseCardAtIndex:[self.cards indexOfObject:sender]];
    [self updateUI];
    
}

@end
