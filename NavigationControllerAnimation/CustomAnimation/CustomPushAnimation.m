//
//  CustomPushAnimation.m
//  NavigationControllerAnimation
//
//  Created by caimao on 2019/2/21.
//  Copyright © 2019 sunhw. All rights reserved.
//

#import "CustomPushAnimation.h"

@implementation CustomPushAnimation

- (NSTimeInterval)transitionDuration:(id<UIViewControllerContextTransitioning>)transitionContext {
    //动画时间
    return 0.3;
}

- (void)animateTransition:(id<UIViewControllerContextTransitioning>)transitionContext {
    //从fromViewController Push到 toViewController
    UIViewController *fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController *toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    //自定义动画
    [transitionContext.containerView addSubview:toViewController.view];
    toViewController.view.y = ScreenHeight;
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        fromViewController.view.transform = CGAffineTransformMakeScale(0.9, 0.9);
        toViewController.view.y = 0;
    }completion:^(BOOL finished) {
        [transitionContext completeTransition:!transitionContext.transitionWasCancelled];
    }];
    
}

@end
