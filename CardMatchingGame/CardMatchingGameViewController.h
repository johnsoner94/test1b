//
//  CardMatchingGameViewController.h
//  CardMatchingGame
//
//  Created by Emily Johnson on 2/27/14.
//  Copyright (c) 2014 Emily Johnson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CardMatchingGameViewController : UIViewController

@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cards;
@property (weak, nonatomic) IBOutlet UILabel *score;
@property (nonatomic) NSUInteger flipCount;
- (IBAction)flipCard:(id)sender;



@end
