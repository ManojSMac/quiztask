//
//  CustomTransitionAnimator.h
//  AnimationDemo
//
//  Created by Shenll-Mac-04 on 07/04/18.
//  Copyright © 2018 Shenll-Mac-04. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class CustomTransitionAnimator;

/**
 You need to adopt the ZoomTransitionAnimating protocol in source view controller and destination
 view controller to make transition animations.
 
 The animator get the image position from a view controller implemented this protocol.
 */
@protocol CustomTransitionAnimating <NSObject>

@required

/**
 Before the animation occurs, return the UIImageView of transition source view controller.
 
 You should create a new UIImageView object again, so this UIImageView is moving.
 
 @return source view controller's UIImageView before transition.
 */
- (nonnull UIImageView *)transitionSourceImageView;

/**
 Return background color in source view controller.
 
 This color will be used for fade in animation.
 we recommend the background color of source view controller.
 
 @return source view controller's bacground color
 */
- (nonnull UIColor *)transitionSourceBackgroundColor;

/**
 Returns the UIImageView’s rectangle in a destination view controller.
 
 @return destination view controller's frame for UIImageView
 */
- (CGRect)transitionDestinationImageViewFrame;

@end


/**
 Delegate handler of viewController which implements transitioning protocol
 */
@protocol CustomTransitionDelegate <NSObject>
@optional

- (void)zoomTransitionAnimator:(nonnull CustomTransitionAnimator *)animator
         didCompleteTransition:(BOOL)didComplete
      animatingSourceImageView:(nonnull UIImageView *)imageView;

@end


/**
 Animator object that implements UIViewControllerAnimatedTransitioning
 
 You need to return this object in transition delegate method
 */
@interface CustomTransitionAnimator : NSObject <UIViewControllerAnimatedTransitioning>

/**
 Init component with custom animation durations.
 */
- (nonnull CustomTransitionAnimator *)initWithAnimationDurationForward:(NSTimeInterval)forward
                                                       forwardComplete:(NSTimeInterval)forwardComplete
                                                              backward:(NSTimeInterval)backward
                                                      backwardComplete:(NSTimeInterval)backwardComplete;

/**
 Changes default animation duration. Primarily here for subclassing.
 */
- (void)setDefaultAnimationDuration;

/**
 A Boolean value that determines whether transition animation is going forward.
 */
@property (nonatomic) BOOL goingForward;

/**
 The animator's delegate for transition in source view controller.
 
 You need to set this property and implement the ZoomTransitionAnimating in source view controller.
 */
@property (nonatomic, weak, nullable) id <CustomTransitionAnimating, CustomTransitionDelegate> sourceTransition;

/**
 The animator's delegate for transition in destination view controller.
 
 You need to set this property and implement the ZoomTransitionAnimating in destination view controller.
 */
@property (nonatomic, weak, nullable) id <CustomTransitionAnimating, CustomTransitionDelegate> destinationTransition;

@end
