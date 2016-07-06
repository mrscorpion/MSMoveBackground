//
//  MoveView.m
//  MSMoveView
//
//  Created by mrscorpion on 16/3/22.
//  Copyright © 2016年 mrscorpion. All rights reserved.
//

#import "MSMoveView.h"

static const CGFloat AnimationDuration = 10.0f;
@interface MSMoveView ()
@property (nonatomic, strong) UIImageView  *imageView;
@property (nonatomic, assign) CGRect startFrame;// 起始frame值
@property (nonatomic, assign) CGRect endFrame;// 结束frame值
@property (nonatomic, assign) MoveDirectionType direction;// 起始移动的方向(默认值向右)
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, assign) NSInteger animationDuration;

@end

@implementation MSMoveView

-(void)setupDirection:(MoveDirectionType)direction image:(UIImage *)image{
    [self setupDirection:direction image:image animationDuration:AnimationDuration];
}

-(void)setupDirection:(MoveDirectionType)direction image:(UIImage *)image animationDuration:(NSInteger)duration{
    if (image == nil) {
        return;
    }
    self.direction=direction;
    self.animationDuration=duration;
    self.image=image;
    // 获取图片高度
    CGFloat height         = self.frame.size.height;
    CGSize imageSize       = self.image.size;
    CGFloat imageViewWidth = height / imageSize.height * imageSize.width;
    self.imageView       = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, imageViewWidth, height)];
    self.imageView.image = self.image;
    
    self.startFrame = self.imageView.frame;
    self.endFrame   = CGRectMake(self.frame.size.width - self.imageView.frame.size.width, 0, imageViewWidth, height);
    self.imageView.contentMode=UIViewContentModeScaleAspectFill;
    
    [self addSubview:self.imageView];
}

- (void)startAnimation {
    if (self.direction != MoveDirectionLeft && self.direction != MoveDirectionRight) {
        self.direction = MoveDirectionRight;
    }
    if (self.direction == MoveDirectionRight) {
        self.imageView.frame = self.startFrame;
    } else {
        self.imageView.frame = self.endFrame;
    }
    [self commitAnimation];
}

- (void)commitAnimation {
    
    if (self.direction == MoveDirectionRight) {
        [UIView animateWithDuration:self.animationDuration
                         animations:^{
                             self.imageView.frame = self.endFrame;
                         } completion:^(BOOL finished) {
                             [UIView animateWithDuration:self.animationDuration
                                              animations:^{
                                                  self.imageView.frame = self.startFrame;
                                              } completion:^(BOOL finished) {
                                                  [self commitAnimation];
                                              }];
                         }];
    } else {
        [UIView animateWithDuration:self.animationDuration
                         animations:^{
                             self.imageView.frame = self.startFrame;
                         } completion:^(BOOL finished) {
                             [UIView animateWithDuration:self.animationDuration
                                              animations:^{
                                                  self.imageView.frame = self.endFrame;
                                              } completion:^(BOOL finished) {
                                                  [self commitAnimation];
                                              }];
                         }];
    }
}

@end
