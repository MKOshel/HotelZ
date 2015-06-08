//
//  AppDelegate.h
//  HotelZonne
//
//  Created by Oshel on 6/8/15.
//  Copyright (c) 2015 Oshel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TutorialViewController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController* navController;
@property (strong, nonatomic) UITabBarController* tabController;
@property (strong, nonatomic) TutorialViewController* tutorialVC;

@end

