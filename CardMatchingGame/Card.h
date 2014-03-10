//
//  Card.h
//  Practice1
//
//  Created by Emily Johnson on 2/15/14.
//  Copyright (c) 2014 Emily Johnson. All rights reserved.
//

#import <UIKit/UIKit.h>
@import Foundation;

@interface Card : NSObject

@property (nonatomic) NSString *contents;
@property (nonatomic) BOOL matched;
@property (nonatomic) BOOL chosen;
@property (nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

//this shall be a class method
/*
 + (NSArray *)validSuits;
 */

- (int)match:(NSArray *)aCard;

@end
