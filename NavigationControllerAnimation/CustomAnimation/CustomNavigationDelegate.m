//
//  CustomNavigationDelegate.m
//  NavigationControllerAnimation
//
//  Created by caimao on 2019/2/21.
//  Copyright © 2019 sunhw. All rights reserved.
//

#import "CustomNavigationDelegate.h"
#import "CustomPopAnimation.h"
#import "CustomPushAnimation.h"

@interface CustomNavigationDelegate()
@property (nonatomic, strong) CustomPopAnimation *popAnimation;
@property (nonatomic, strong) CustomPushAnimation *pushAnimation;
@property (nonatomic, strong) UIPercentDrivenInteractiveTransition *interactionController;
@property (nonatomic, strong) UINavigationController *customNavigationController;
@end

@implementation CustomNavigationDelegate

- (instancetype)initWithNavigationController:(UINavigationController *)nav {
    if (self = [super init]) {
        self.customNavigationController = nav;
        
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
        [self.customNavigationController.view addGestureRecognizer:pan];
        
        self.pushAnimation = [[CustomPushAnimation alloc] init];
        self.popAnimation = [[CustomPopAnimation alloc] init];
    }
    return self;
}

- (void)pan:(UIPanGestureRecognizer *)panGesture {
    UIView *view = self.customNavigationController.view;
    if (panGesture.state == UIGestureRecognizerStateBegan) {
        CGPoint location = [panGesture locationInView:view];
        if (location.x < CGRectGetMidX(view.bounds) && self.customNavigationController.viewControllers.count > 1) {
            self.interactionController = [[UIPercentDrivenInteractiveTransition alloc] init];
            [self.customNavigationController popViewControllerAnimated:YES];
        }
    }else if (panGesture.state == UIGestureRecognizerStateChanged) {
        CGPoint translation = [panGesture translationInView:view];
        double percent = fabs(translation.x / CGRectGetWidth(view.bounds));
        [self.interactionController updateInteractiveTransition:percent];
    }else if (panGesture.state == UIGestureRecognizerStateEnded) {
        if ([panGesture velocityInView:view].x > 0) {
            [self.interactionController finishInteractiveTransition];
        }else {
            [self.interactionController cancelInteractiveTransition];
        }
        self.interactionController = nil;
    }
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC {
    if (operation == UINavigationControllerOperationPush) {
        return self.pushAnimation;
    }
    if (operation == UINavigationControllerOperationPop) {
        return self.popAnimation;
    }
    return nil;
}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {
    return self.interactionController == nil ? nil : self.interactionController;
}

@end
