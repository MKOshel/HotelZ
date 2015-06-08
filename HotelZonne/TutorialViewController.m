//
//  TutorialViewController.m
//  BabyRevenge
//
//  Created by dragos on 5/26/14.
//  Copyright (c) 2014 Mobile Kinetics. All rights reserved.
//

#import "TutorialViewController.h"
//#import "RegisterVC.h"
//#import "LoginVC.h"
#import "AppDelegate.h"

#define TURQUOISE [UIColor whiteColor]

@interface TutorialViewController ()
{
    UISwipeGestureRecognizer* leftSwipe;
    UISwipeGestureRecognizer* rightSwipe;
    NSArray* tutImages;
    NSArray* tutImages5;
    NSArray* tutStrings;
}
@end

@implementation TutorialViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        
        tutImages5 = [[NSArray alloc]initWithObjects:[UIImage imageNamed:@"walk1.jpg"],
                     [UIImage imageNamed:@"walk2.jpg"],
                     [UIImage imageNamed:@"walk3.jpg"],nil];
        
        tutStrings = [[NSArray alloc]initWithObjects:@"Welcome to Zonne Hotel",@"We hope you enjoy your stay",@"Sign in to get started", nil];
    }
    return self;
}



-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupGestures];
    
    [self customizeView];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBarHidden = YES;
    
}

-(void)customizeView
{
//    [[UILabel appearanceWhenContainedIn:[self class], nil] setFont:[UIFont fontWithName:@"CCSamaritanTall" size:25.0]];
    
    [_buttonRegister.titleLabel setFont:[UIFont fontWithName:@"Arial" size:15.0]];
    [_buttonLogin.titleLabel setFont:[UIFont fontWithName:@"Arial" size:15.0]];
    
    _buttonLogin.layer.masksToBounds = YES;
    _buttonLogin.layer.borderColor = TURQUOISE.CGColor;
    _buttonLogin.layer.borderWidth = 1.5;
    _buttonLogin.layer.cornerRadius = 5.0;
    [_buttonLogin setTitleColor:TURQUOISE forState:UIControlStateNormal];
    
    _buttonRegister.layer.masksToBounds = YES;
    _buttonRegister.layer.borderColor = TURQUOISE.CGColor;
    _buttonRegister.layer.borderWidth = 1.5;
    _buttonRegister.layer.cornerRadius = 5.0;
        [_buttonRegister.titleLabel setTextColor:TURQUOISE];
    [_buttonRegister setTitleColor:TURQUOISE forState:UIControlStateNormal];
    
    [_label_tut setTextColor:TURQUOISE];
    [_labelWelcome setTextColor:TURQUOISE];
    
    _labelWelcome.font = [UIFont fontWithName:@"Helvetica 55 Roman" size:23.0];
    _label_tut.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:21.0];
    
}


-(void)animateImageViewWithAnimationSubType:(NSString*)subType
{
    UIImage* toImage;
    

    toImage = [tutImages5 objectAtIndex:_pageControl.currentPage];

    
    [UIView transitionWithView:_imageView
                      duration:0.2
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
                        CATransition *animation = [CATransition animation];
                        animation.type = kCATransitionMoveIn;
                        animation.subtype = subType;
                        animation.duration = 0.2;
                        _imageView.image = toImage;
                        [_imageView.layer addAnimation:animation forKey:nil];
                    } completion:nil];
    
    [UIView transitionWithView:_label_tut
                      duration:0.3
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
                        _label_tut.text = ([tutStrings objectAtIndex:_pageControl.currentPage]);
                    }
                    completion:nil];
}



-(void)setupGestures
{
    leftSwipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(leftSwipeAction)];
    leftSwipe.direction = UISwipeGestureRecognizerDirectionLeft;
    leftSwipe.numberOfTouchesRequired = 1;
    
    rightSwipe = [[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(rightSwipeAction)];
    rightSwipe.direction = UISwipeGestureRecognizerDirectionRight;
    rightSwipe.numberOfTouchesRequired = 1;
    
    [self.view addGestureRecognizer:leftSwipe];
    [self.view addGestureRecognizer:rightSwipe];
}


-(void)leftSwipeAction
{
    [_labelWelcome setHidden:YES];
    if (_pageControl.currentPage == 2) {
        return;
    }
    _pageControl.currentPage++;
    
    [self animateImageViewWithAnimationSubType:kCATransitionFromRight];
}


-(void)rightSwipeAction
{
    if (_pageControl.currentPage == 0) {
        [_labelWelcome setHidden:NO];
        return;
    }
    if (_pageControl.currentPage == 1) {
        [_labelWelcome setHidden:NO];
    }
    
    _pageControl.currentPage--;

    [self animateImageViewWithAnimationSubType:kCATransitionFromLeft];
}

- (IBAction)registerAction:(UIButton *)sender {
  
    //RegisterVC* registerVC = [[RegisterVC alloc]initWithNibName:@"RegisterVC" bundle:nil];
    
   // [self.navigationController pushViewController:registerVC animated:YES];
}
- (IBAction)loginAction:(UIButton *)sender
{
    AppDelegate* delegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    delegate.window.rootViewController = delegate.tabController;
    
   // LoginVC* loginVC = [[LoginVC alloc]initWithNibName:@"LoginVC" bundle:nil];
    
   // [self.navigationController pushViewController:loginVC animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
