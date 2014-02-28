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

@property (strong, nonatomic) NSString *contents;
@property (nonatomic) BOOL matched;
@property (nonatomic) BOOL chosen;

- (int)match:(Card *)aCard;

@end
