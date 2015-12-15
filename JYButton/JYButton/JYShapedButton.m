//
//  JYButton.m
//  JYButton
//
//  Created by Jason Yuen on 15/12/15.
//  Copyright © 2015年 Jason Yuen. All rights reserved.
//

#import "JYShapedButton.h"

@implementation JYShapedButton


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//绘制按钮时添加path遮罩
- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    CAShapeLayer *shapLayer = [CAShapeLayer layer];
    shapLayer.path = self.path.CGPath;
    self.layer.mask = shapLayer;
}

//覆盖方法，点击时判断点是否在path内，YES则响应，NO则不响应
- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event
{
    BOOL res = [super pointInside:point withEvent:event];
    if (res)
    {
        if ([self.path containsPoint:point])
        {
            return YES;
        }
        return NO;
    }
    return NO;
}


@end
