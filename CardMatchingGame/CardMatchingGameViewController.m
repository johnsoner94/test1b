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
    
    [self game];
    
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
    // call this to update the user interface (disable cards that are matched, turn over cards that are not, set the score Label)
    NSInteger currentScore = [_cardGame match:(PlayingCard *)self.cardGame->cardOne toMatch: (PlayingCard *)self.cardGame->cardTwo];
    
   if (currentScore>0)
   {
       NSInteger indexOne = [_deckOfCards indexOfObject:self.cardGame->cardOne];
       UIButton *buttonOne = (UIButton *)[self.view viewWithTag:indexOne];
       buttonOne.enabled = NO;
       
       NSInteger indexTwo = [_deckOfCards indexOfObject:self.cardGame->cardTwo];
       UIButton *buttonTwo = (UIButton *)[self.view viewWithTag:indexTwo];
       buttonTwo.enabled = NO;
   }
   else
   {
       
       // make the card not deselect the card
       self.cardGame->cardOne.chosen = NO;
       self.cardGame->cardTwo.chosen = NO;
       
       // turn card over
       [self backgroundImageForCard:self.cardGame->cardOne];
       [self backgroundImageForCard:self.cardGame->cardTwo];
   }
    
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
    UIButton *button = (UIButton *)sender;
    NSInteger index = [button tag];
    PlayingCard *currentCard = [[self game] cardAtIndex:index];
    [currentCard chosen];
    [currentCard select:self];
    [self backgroundImageForCard:currentCard];
    if (self.cardGame->cardOne == nil)
    {
        self.cardGame->cardOne = currentCard;
        [button setTitle:self.cardGame->cardOne.contents forState:UIControlStateSelected];
        [_cardView setNeedsDisplay];
    }
    else if (self.cardGame->cardOne != nil && self.cardGame->cardTwo == nil)
    {
        self.cardGame->cardTwo = currentCard;
        [button setTitle:self.cardGame->cardTwo.contents forState:UIControlStateSelected];
        [_cardView setNeedsDisplay];
    }
    
    // then updates the user interface
    [self updateUI];
}

@end