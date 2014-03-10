//
//  PlayingCardView.m
//  SuperCard
//
//  Created by Emily Johnson on 2/19/14.
//  Copyright (c) 2014 Emily Johnson. All rights reserved.
//

#import "PlayingCardView.h"
#import "PlayingCard.h"

@implementation PlayingCardView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}



- (void) setFaceUp:(BOOL)faceUp
{
    _faceUp = faceUp;
    [self setNeedsDisplay];
}



- (void)setup
{
    self.opaque = NO;
    self.contentMode = UIViewContentModeRedraw;
    
}

- (void)awakeFromNib
{
    [self setup];
}

- (CGFloat)cornerScaleFactor
{
    return self.bounds.size.height/CORNER_FONT_STANDARD_HEIGHT;
}

- (CGFloat)cornerRadius
{
    return CORNER_RADIUS * [self cornerScaleFactor];
}

- (CGFloat)cornerOffset
{
    return [self cornerRadius] / 3.0;
}

- (void)drawCorners:(PlayingCard *) aCard
{
    // You first need to initilize the instance variable
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    
    // Then set the variable equal to the desired property **Alignment was the property**
    paragraphStyle.alignment = NSTextAlignmentCenter;
    
    // Instead of allocating and initilizing it, set it equal using the method immediately
    UIFont *cornerFont = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
    cornerFont = [cornerFont fontWithSize:cornerFont.pointSize * [self cornerScaleFactor]];
    
    NSString *cornerString = [NSString stringWithFormat:@"%@\n%@", [aCard rankAsStrings], self.suit];
    NSAttributedString *cornerText = [[NSAttributedString alloc]initWithString:cornerString attributes:@{NSFontAttributeName: cornerFont, NSParagraphStyleAttributeName: paragraphStyle}];
    
    CGRect textBounds;
    textBounds.size = cornerText.size;
    textBounds.origin = CGPointMake([self cornerOffset], [self cornerOffset]);
    
    
    [cornerText drawInRect:textBounds];
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(ctx, self.bounds.size.width, self.bounds.size.height);
    CGContextRotateCTM(ctx, M_PI);
    
    [cornerText drawInRect:textBounds];
}


const double CORNER_FONT_STANDARD_HEIGHT = 180.0;
const double CORNER_RADIUS = 12.0;



// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
/*- (void)drawRect:(CGRect)rect
{
    
}*/


@end
