//
//  KikanTimerView.m
//  Kikan
//
//  Created by Bas van der Hoek on 11/22/12.
//  Copyright (c) 2012 Bas van der Hoek. All rights reserved.
//

#import "KikanTimerView.h"

@implementation KikanTimerView

@synthesize lap;
@synthesize elapsed;

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    CGContextRef ctx = UIGraphicsGetCurrentContext();

    float outerRadius = (self.bounds.size.height / 2) - 1;
    float innerRadius = outerRadius * 0.6f;

    CGContextSetFillColorWithColor(ctx, [[UIColor whiteColor] CGColor]);
    CGContextFillRect(ctx, self.bounds);

    CGPoint center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height / 2);
    CGRect outerBounds = CGRectMake(center.x - outerRadius, center.y - outerRadius, outerRadius * 2, outerRadius * 2);
    CGContextSetFillColorWithColor(ctx, [[UIColor redColor] CGColor]);
    CGContextFillEllipseInRect(ctx, outerBounds);

    CGRect innerBounds = CGRectMake(center.x - innerRadius, center.y - innerRadius, innerRadius * 2, innerRadius * 2);
    CGContextSetFillColorWithColor(ctx, [[UIColor whiteColor] CGColor]);
    CGContextFillEllipseInRect(ctx, innerBounds);

    double slice = self.elapsed / self.lap;
    float startAngle = (float) (M_PI * 1.5);
    float endAngle = (float) (M_PI * (1.5 + (1.99999 * slice)));

    CGPoint point = CGPointMake(center.x + (innerRadius * cosf(startAngle)), center.y + (innerRadius * sinf(startAngle)));
    CGContextMoveToPoint(ctx, point.x, point.y);
    CGContextAddArc(ctx, center.x, center.y, outerRadius, startAngle, endAngle, 0);
    CGContextAddArc(ctx, center.x, center.y, innerRadius, endAngle, startAngle, 1);

    CGContextSetFillColorWithColor(ctx, [[UIColor orangeColor] CGColor]);
    CGContextDrawPath(ctx, kCGPathFillStroke);

    [self drawTime:center];
}

- (void)drawTime:(CGPoint)center {
    int minutes = (int) (self.elapsed / 60);
    int seconds = (int) self.elapsed % 60;

    NSString *now = [NSString stringWithFormat:@"%02d:%02d", minutes, seconds];
    CGSize size = [now sizeWithFont:[UIFont fontWithName:@"Helvetica" size:48]];
    [now drawAtPoint:CGPointMake(center.x - (size.width / 2), center.y - (size.height / 2)) withFont:[UIFont fontWithName:@"Helvetica" size:48]];
}
@end