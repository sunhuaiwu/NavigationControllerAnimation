//
//  AppDelegate.h
//  NavigationControllerAnimation
//
//  Created by caimao on 2019/2/21.
//  Copyright © 2019 sunhw. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CustomNavigationDelegate;
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, strong) CustomNavigationDelegate *navDelegate;

@end

