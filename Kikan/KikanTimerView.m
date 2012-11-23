//
//  KikanTimerView.m
//  Kikan
//
//  Created by Bas van der Hoek on 11/22/12.
//  Copyright (c) 2012 Bas van der Hoek. All rights reserved.
//

#import "KikanTimerView.h"

static float const outerRadius = 50.0;

static float const innerRadius = 30.0;

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

    CGPoint center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    CGRect outerBounds = CGRectMake(center.x - outerRadius, center.y - outerRadius, outerRadius * 2, outerRadius * 2);
    CGContextSetFillColor(ctx, CGColorGetComponents([[UIColor redColor] CGColor]));
    CGContextFillEllipseInRect(ctx, outerBounds);

    CGRect innerBounds = CGRectMake(center.x - innerRadius, center.y - innerRadius, innerRadius * 2, innerRadius * 2);
    CGContextSetFillColor(ctx, CGColorGetComponents([[UIColor blueColor] CGColor]));
    CGContextFillEllipseInRect(ctx, innerBounds);

    float startAngle = (float) (M_PI * 0.5);
    float endAngle = (float) (M_PI * 1.0);

    CGPoint point = CGPointMake(center.x + (innerRadius * cosf(startAngle)), center.y + (innerRadius * sinf(startAngle)));
    CGContextMoveToPoint(ctx, point.x, point.y);
    CGContextAddArc(ctx, center.x, center.y, outerRadius, startAngle, endAngle, 0);
    CGContextAddArc(ctx, center.x, center.y, innerRadius, endAngle, startAngle, 1);

    CGContextSetFillColor(ctx, CGColorGetComponents([[UIColor orangeColor] CGColor]));
    CGContextDrawPath(ctx, kCGPathFillStroke);
}
@end