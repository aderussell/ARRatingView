//
//  ARRatingView.h
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

@import UIKit;

NS_ASSUME_NONNULL_BEGIN

/**
 *  An interactive control that allows for star based ratings to be selected.
 */
IB_DESIGNABLE
@interface ARRatingView : UIControl



/**
 <#Description#>

 @return <#return value description#>
 */
+ (CGPathRef)createDefaultStarPath;


/**
 *  The bezier path to use for the shape of the stars in the control.
 *  The default value for this is the path returned by the `createDefaultStarPath` class method.
 */
@property (nonatomic, strong, null_resettable) UIBezierPath *starPath UI_APPEARANCE_SELECTOR;


/**
 *  The current rating shown in the rating view.
 *  This value will be clamped between 0 and the receivers `starCount`.
 */
@property (nonatomic) CGFloat rating;

/**
 *  The number of stars to be shown on the control.
 *  The minimum number of stars is 1 and values below this will be clamped up to 1.
 *  The default is 5.
 */
@property (nonatomic) IBInspectable NSUInteger starCount;

/**
 *  The color that the background of the stars will be colored.
 *  This will be visible if the foreground coloring isn't over the top.
 *  The default is UIColors defined `lightGreyColor`.
 */
@property (nonatomic, strong, null_resettable) IBInspectable UIColor *ratingBackgroundColor;

/**
 *  The color that the stars will be colored where they are rated.
 */
@property (nonatomic, strong, null_resettable) IBInspectable UIColor *ratingForegroundColor;

@end

NS_ASSUME_NONNULL_END
