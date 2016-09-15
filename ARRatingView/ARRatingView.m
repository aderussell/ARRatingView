//
//  ARRatingView.m
//
//  Created by Adrian Russell on 15/08/2015.
//  Copyright (c) 2015 Adrian Russell. All rights reserved.
//
//  This software is provided 'as-is', without any express or implied
//  warranty. In no event will the authors be held liable for any damages
//  arising from the use of this software. Permission is granted to anyone to
//  use this software for any purpose, including commercial applications, and to
//  alter it and redistribute it freely, subject to the following restrictions:
//
//  1. The origin of this software must not be misrepresented; you must not
//     claim that you wrote the original software. If you use this software
//     in a product, an acknowledgment in the product documentation would be
//     appreciated but is not required.
//  2. Altered source versions must be plainly marked as such, and must not be
//     misrepresented as being the original software.
//  3. This notice may not be removed or altered from any source
//     distribution.
//

#import "ARRatingView.h"

@implementation ARRatingView
{
    CGPathRef _starPath;
}


#pragma mark - Setters

- (void)setRating:(CGFloat)rating
{
    if (self.rating != rating) {
        _rating = rating;
        [self setNeedsDisplay];
        [self sendActionsForControlEvents:UIControlEventValueChanged];
    }
}


- (void)setRatingBackgroundColor:(UIColor * __nullable)ratingBackgroundColor
{
    _ratingBackgroundColor = ratingBackgroundColor;
    if (ratingBackgroundColor == nil) {
        _ratingBackgroundColor = [UIColor lightGrayColor];
    }
    [self setNeedsDisplay];
}

- (void)setRatingForegroundColor:(UIColor * __nullable)ratingForegroundColor
{
    _ratingForegroundColor = ratingForegroundColor;
    if (ratingForegroundColor == nil) {
        _ratingForegroundColor = [UIColor orangeColor];
    }
    [self setNeedsDisplay];
}



#pragma mark - Drawing

- (void)drawRect:(CGRect)rect
{
    UIColor *backgroundColor = self.ratingBackgroundColor;
    UIColor *foregoundColor  = self.ratingForegroundColor;
    
    CGFloat starHeight = rect.size.height;
    
    _starPath = [self createStarPathWithHeight:starHeight];
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    for (NSUInteger i = 0; i < 5; i++) {
        
        CGContextSaveGState(ctx);
        
        CGAffineTransform translation = CGAffineTransformMakeTranslation(0 + (i * starHeight * 1.2), 0);
        
        CGPathRef path = CGPathCreateMutableCopyByTransformingPath(_starPath, &translation);
        
        CGContextAddPath(ctx, path);
        CGContextClip(ctx);
        
        CGRect backgroundRect = CGRectMake(0 + (i * starHeight * 1.2), 0, starHeight, starHeight);
        
        [backgroundColor setFill];
        UIRectFill(backgroundRect);
        
        CGRect foregroundRect;
        if (self.rating >= i+1) {
            foregroundRect = backgroundRect;
            
            [foregoundColor setFill];
            UIRectFill(foregroundRect);
            
        } else if (self.rating >= i) {
            
            CGFloat ratio = MAX(0, (self.rating - (i)) * starHeight);
            
            foregroundRect = CGRectMake(0 + (i * starHeight * 1.2), 0, ratio, starHeight);
            
            [foregoundColor setFill];
            UIRectFill(foregroundRect);
        }
        
        CGContextRestoreGState(ctx);
        
        CGPathRelease(path);
    }
    
    CGPathRelease(_starPath);
    _starPath = nil;
}

- (CGSize)intrinsicContentSize
{
    return CGSizeMake(128, 22);
}

- (CGSize)sizeThatFits:(CGSize)size
{
    return [self intrinsicContentSize];
}


- (CGPathRef)createStarPath
{
    CGMutablePathRef path = CGPathCreateMutable();
    
    CGPathMoveToPoint(path, NULL, 0.5, 0.7857142857);
    CGPathAddLineToPoint(path, NULL, 0.7938571429, 0.9045);
    CGPathAddLineToPoint(path, NULL, 0.7717142857, 0.5882857143);
    CGPathAddLineToPoint(path, NULL, 0.9755, 0.3455);
    CGPathAddLineToPoint(path, NULL, 0.6679285714, 0.2688571429);
    CGPathAddLineToPoint(path, NULL, 0.5, 0);
    CGPathAddLineToPoint(path, NULL, 0.3320714286, 0.2688571429);
    CGPathAddLineToPoint(path, NULL, 0.0245, 0.3262142857);
    CGPathAddLineToPoint(path, NULL, 0.2282857143, 0.5882857143);
    CGPathAddLineToPoint(path, NULL, 0.2061428571, 0.9045);
    CGPathCloseSubpath(path);
    
    
    return path;
}

- (CGPathRef)createStarPathWithHeight:(CGFloat)height
{
    CGPathRef path = [self createStarPath];
    
    CGAffineTransform transform = CGAffineTransformMakeScale(height, height);
    
    CGPathRef resizedPath = CGPathCreateCopyByTransformingPath(path, &transform);
    
    CGPathRelease(path);
    
    return resizedPath;
}



- (void)prepareForInterfaceBuilder
{
    self.rating = 3.21;
}

// TODO!!! prevent autolayout resizing the view




#pragma mark - Touch Handling

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    
    CGPoint position = [touch locationInView:self];
    
    NSUInteger starPosition = floor((position.x / self.bounds.size.width) * 5);
    
    starPosition +=1;
    
    starPosition = MAX(0, MIN(starPosition, 5));
    
    self.rating = starPosition;
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    
    CGPoint position = [touch locationInView:self];
    
    NSUInteger starPosition = floor((position.x / self.bounds.size.width) * 5);
    
    starPosition += 1;
    
    starPosition = MAX(0, MIN(starPosition, 5));
    
    self.rating = starPosition;
}

@end
