//
//  Card.m
//  Practice1
//
//  Created by Emily Johnson on 2/15/14.
//  Copyright (c) 2014 Emily Johnson. All rights reserved.
//

#import "Card.h"


@implementation Card


- (int)match:(Card *)aCard
{
 if ([aCard.contents isEqualToString:self.contents])
    {
        return 1;
    }
    return 0;
}

@end
