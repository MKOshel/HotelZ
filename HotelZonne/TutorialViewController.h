//
//  TutorialViewController.h
//  BabyRevenge
//
//  Created by dragos on 5/26/14.
//  Copyright (c) 2014 Mobile Kinetics. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface TutorialViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *imageView;
@property (strong, nonatomic) IBOutlet UIPageControl *pageControl;
@property (strong, nonatomic) IBOutlet UIButton *buttonRegister;
@property (strong, nonatomic) IBOutlet UIButton *buttonLogin;
@property (strong, nonatomic) IBOutlet UILabel *label_tut;
@property (strong, nonatomic) IBOutlet UILabel *labelWelcome;

@end
