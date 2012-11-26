//
//  KikanViewController.m
//  Kikan
//
//  Created by Bas van der Hoek on 11/22/12.
//  Copyright (c) 2012 Bas van der Hoek. All rights reserved.
//

#import "KikanViewController.h"

@interface KikanViewController () {
    NSDate *start;
    NSTimer *repeats;
}

@end

@implementation KikanViewController

@synthesize timer;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.timer.lap = 3;
    self.timer.elapsed = 0;
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)timerButtonClicked:(id)sender {
    NSLog(@"Clicked");
    repeats = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(tock:) userInfo:nil repeats:YES];
    start = [NSDate date];
}

- (void)tock:(id)tock {
    NSLog(@"tock");
    NSTimeInterval timeInterval = [[NSDate date] timeIntervalSinceDate:start];
    if (self.timer.lap - timeInterval < 0) {
        [repeats invalidate];
    }
    self.timer.elapsed = (float) timeInterval;
    [self.timer setNeedsDisplay];
}

- (void)viewDidUnload {
    [self setButton:nil];
    [self setTimer:nil];
    [super viewDidUnload];
}
@end
