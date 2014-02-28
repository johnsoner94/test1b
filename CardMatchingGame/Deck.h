//
//  Deck.h
//  Practice1
//
//  Created by Emily Johnson on 2/15/14.
//  Copyright (c) 2014 Emily Johnson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject
/*{
    NSMutableArray *cards;
}*/

- (Card *) drawRandomCard;


- (void) addCard:(Card *)aCard atTop: (BOOL) atTop;

- (void) addCard: (Card *)aCard;

- (NSMutableArray *)cards;



@end
