//
//  RootViewController.m
//  NavigationControllerAnimation
//
//  Created by caimao on 2019/2/21.
//  Copyright © 2019 sunhw. All rights reserved.
//

#import "RootViewController.h"
#import "NextViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 200, 100, 45);
    [button setTitle:@"PUSH" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.view addSubview:button];
    [button addTarget:self action:@selector(pushToNext) forControlEvents:UIControlEventTouchUpInside];
}

- (void)pushToNext {
    NextViewController *next = [[NextViewController alloc] init];
    [self.navigationController pushViewController:next animated:YES];
}

@end
