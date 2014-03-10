//
//  Deck.h
//  Practice1
//
//  Created by Emily Johnson on 2/15/14.
//  Copyright (c) 2014 Emily Johnson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlayingCard.h"

@interface Deck : NSObject
{
    PlayingCard *randomCard;
}


- (PlayingCard *)drawRandomCard;


- (void) addCard:(PlayingCard *)aCard atTop: (BOOL) atTop;




@end
