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
//@property (nonatomic) NSMutableArray *deckOfCards;

@end

@implementation CardMatchingGameViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
//    Do any additional setup after loading the view, typically from a nib.
    [self createDeck];
    
    self.cardGame= [[CardMatchingGame alloc] initWithCardCount:16 usingDeck:deck];
    
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

- (PlayingCardDeck *)createDeck
{
    // creates the deck and then returns it
    deck = [[PlayingCardDeck alloc] init];
    return deck;
}

- (void)updateUI
{
    
    for (NSInteger i=0; i<_cards.count; i++) {
        
        PlayingCard *tempCard = [_cardGame cardAtIndex:i];
        UIButton *tempButton = [_cards objectAtIndex:i];
        
        if (tempCard.chosen == YES) {
            if (tempCard.matched == YES) {
                [tempButton setEnabled:NO];
                // The card should already be face up.
            }
            [tempButton setBackgroundImage:[self backgroundImageForCard:tempCard] forState:UIControlStateNormal];
            [tempButton setTitle:tempCard.contents forState:UIControlStateNormal];
        }
        else
        {
            [tempButton setBackgroundImage:[self backgroundImageForCard:tempCard] forState:UIControlStateNormal];
            [tempButton setTitle:nil forState:UIControlStateNormal];
            [tempButton setEnabled:YES];
        }
    }
    
    
    for (NSInteger i=0; i<_cards.count; i++)
    {
        PlayingCard *tempCard = [_cardGame cardAtIndex:i];
        UIButton *tempButton = [_cards objectAtIndex:i];
        
        if (tempCard.chosen == YES)
        {
            if (tempCard.matched == YES)
            {
                [tempButton setEnabled:NO];
                // The card should already be face up.
            }
        }
    }
    
    
    // if the card is not matched and not chosen it is => faced down and enabled
    // if the card is matched  then it is => face up and disabled
    // if the card is not matched and chosen it is => face up and enabled
    
    // the cards that have been chosen need to have their background changed and their title set

    
    
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
