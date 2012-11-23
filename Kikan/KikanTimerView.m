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

    CGContextSetStrokeColor(ctx, CGColorGetComponents([[UIColor redColor] CGColor]));
    CGContextSetLineWidth(ctx, 1.0);
    CGPoint center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    CGContextMoveToPoint(ctx, center.x, center.y);
    CGPoint point = CGPointMake(center.x + (50 * cos(M_PI* 0.5)), center.y + (50 * sin(M_PI* 0.5)));
    CGContextAddLineToPoint(ctx, point.x, point.y);
//	CGContextAddArc(ctx, self.frame.size.width / 2, self.frame.size.height / 2, self.frame.size.height / 2, M_PI, M_PI * 2, 1);
//	CGContextAddEllipseInRect(ctx, rect);
    CGContextStrokePath(ctx);
}
@end
