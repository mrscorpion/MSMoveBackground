//
//  ViewController.m
//  MSBackgroundMove
//
//  Created by mrscorpion on 16/7/6.
//  Copyright © 2016年 mrscorpion. All rights reserved.
//

#import "ViewController.h"
#import "MSMoveView.h"

@interface ViewController ()
@end

@implementation ViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setup];
}
#pragma mark - setup
-(void)setup{
    // 背景移动的图
    MSMoveView *moveView         = [[MSMoveView alloc] initWithFrame:self.view.bounds];
    [moveView setupDirection:MoveDirectionRight image:[UIImage imageNamed:@"Slice.png"] animationDuration:15.0f]; //@"backGround"
    [moveView startAnimation];
    [self.view addSubview:moveView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
