//
//  KikanTimerView.m
//  Kikan
//
//  Created by Bas van der Hoek on 11/22/12.
//  Copyright (c) 2012 Bas van der Hoek. All rights reserved.
//

#import "KikanTimerView.h"

@implementation KikanTimerView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();

    CGContextSetFillColor(ctx, CGColorGetComponents([[UIColor blueColor] CGColor]));
    CGContextFillRect(ctx, self.bounds);

    CGContextSetFillColor(ctx, CGColorGetComponents([[UIColor redColor] CGColor]));
    CGPoint center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);

    float startAngle = (float) (M_PI * 0.5);
    float endAngle = (float) (M_PI * 1.0);

    CGPoint point = CGPointMake(center.x + (30 * cosf(startAngle)), center.y + (30 * sinf(startAngle)));
    CGContextMoveToPoint(ctx, point.x, point.y);

    CGContextAddArc(ctx, center.x, center.y, 50.0, startAngle, endAngle, 0);
    CGContextAddArc(ctx, center.x, center.y, 30.0, endAngle, startAngle, 1);
    CGContextFillPath(ctx);
}
@end