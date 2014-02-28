//
//  PlayingCardView.h
//  SuperCard
//
//  Created by Emily Johnson on 2/19/14.
//  Copyright (c) 2014 Emily Johnson. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PlayingCardView : UIView
{
    IBOutlet UIView *playingCardView;
}

@property (nonatomic) NSUInteger rank;
@property (nonatomic, strong) NSString *suit;
@property (nonatomic) BOOL faceUp;

- (void)setup;

@end
