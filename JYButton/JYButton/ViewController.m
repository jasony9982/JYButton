//
//  ViewController.m
//  JYButton
//
//  Created by Jason Yuen on 15/12/15.
//  Copyright © 2015年 Jason Yuen. All rights reserved.
//

#import "JYShapedButton.h"
#import "ViewController.h"

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {

  //标签1
  UILabel *labelNormal =
      [[UILabel alloc] initWithFrame:CGRectMake(10, 30, SCREEN_WIDTH - 10, 20)];
  labelNormal.text = @"普"
                     @"通按钮点击边框外也响应事件，响应区域仍为矩形";
  labelNormal.font = [UIFont fontWithName:@"Arial" size:14.0f];
  [self.view addSubview:labelNormal];

  //普通按钮
  UIButton *btnNromal = [UIButton buttonWithType:UIButtonTypeCustom];
  btnNromal.frame = CGRectMake(50, 70, 200, 100);
  CAShapeLayer *shapLayer = [CAShapeLayer layer];
  shapLayer.path = [[self getPath] CGPath];
  btnNromal.layer.mask = shapLayer;
  [btnNromal setTitle:@"普通按钮" forState:UIControlStateNormal];
  [btnNromal addTarget:self
                action:@selector(btnAction:)
      forControlEvents:UIControlEventTouchUpInside];
  btnNromal.backgroundColor = [UIColor greenColor];
  [self.view addSubview:btnNromal];

  //标签2
  UILabel *labelShaped = [[UILabel alloc]
      initWithFrame:CGRectMake(10, 200, SCREEN_WIDTH - 10, 20)];
  labelShaped.text = @"下面的按钮只在形状内响应，非矩形";
  labelShaped.font = [UIFont fontWithName:@"Arial" size:14.0f];
  [self.view addSubview:labelShaped];


  //随意
  JYShapedButton *btn = [JYShapedButton buttonWithType:UIButtonTypeCustom];
  btn.frame = CGRectMake(10, 240, 200, 100);
  btn.path = [self getPath];
  [btn setTitle:@"JYBtn" forState:UIControlStateNormal];
  [btn addTarget:self
                action:@selector(btnAction:)
      forControlEvents:UIControlEventTouchUpInside];
  btn.backgroundColor = [UIColor greenColor];
  [self.view addSubview:btn];
}

#pragma mark - btn点击事件
- (void)btnAction:(JYShapedButton *)sender {
  sender.backgroundColor =
      [UIColor colorWithRed:(arc4random() % 255 + 1) / 255.0
                      green:(arc4random() % 255 + 1) / 255.0
                       blue:(arc4random() % 255 + 1) / 255.0
                      alpha:1.0];
}

#pragma mark -  获取遮罩path
- (UIBezierPath *)getPath {

    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0, 100)];
    [path addLineToPoint:CGPointMake(20, 0)];
    [path addLineToPoint:CGPointMake(45, 50)];
    [path addLineToPoint:CGPointMake(70, 0)];
    [path addLineToPoint:CGPointMake(150, 30)];
    [path addLineToPoint:CGPointMake(175, 0)];
    [path addLineToPoint:CGPointMake(200, 100)];
    [path closePath];
    return path;

}

@end
