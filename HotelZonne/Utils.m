//
//  Utils.m
//  HotelZonne
//
//  Created by dragos on 6/9/15.
//  Copyright (c) 2015 Oshel. All rights reserved.
//

#import "Utils.h"

@implementation Utils

+(void)addMotionEffectOnView:(UIView *)view
{
    UIInterpolatingMotionEffect* verticalMotion;
    UIInterpolatingMotionEffect* horizontalMotion;
    
    verticalMotion = [[UIInterpolatingMotionEffect alloc]initWithKeyPath:@"center.y" type:UIInterpolatingMotionEffectTypeTiltAlongVerticalAxis];
    verticalMotion.minimumRelativeValue = @(-5);
    verticalMotion.maximumRelativeValue = @(5);
    horizontalMotion = [[UIInterpolatingMotionEffect alloc]initWithKeyPath:@"center.x" type:UIInterpolatingMotionEffectTypeTiltAlongHorizontalAxis];
    horizontalMotion.minimumRelativeValue = @(-25);
    horizontalMotion.maximumRelativeValue = @(25);
    UIMotionEffectGroup *group = [UIMotionEffectGroup new];
    group.motionEffects = @[horizontalMotion, verticalMotion];
    
    [view addMotionEffect:group];
}


+(void)addBlurrEffectToView:(UIView *)view frame:(CGRect)frame
{
    UIVisualEffectView* blurrView = [[UIVisualEffectView alloc]initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleLight]];
    [blurrView setFrame:frame];
    [view addSubview:blurrView];
}
@end
