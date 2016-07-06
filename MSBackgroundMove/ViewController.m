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
@property (nonatomic, strong) MSMoveView *moveView;
@end

@implementation ViewController
- (void)viewWillDisappear:(BOOL)animated
{
    [self.moveView stopAnimation];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setup];
}
#pragma mark - setup
- (void)setup{
    // 背景移动的图
    MSMoveView *moveView = [[MSMoveView alloc] initWithFrame:self.view.bounds];
    self.moveView = moveView;
    [moveView setupDirection:MoveDirectionRight image:[UIImage imageNamed:@"backGround"] animationDuration:15.0f];
    [moveView startAnimation];
    [self.view addSubview:moveView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
