//
//  KikanViewController.h
//  Kikan
//
//  Created by Bas van der Hoek on 11/22/12.
//  Copyright (c) 2012 Bas van der Hoek. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KikanTimerView.h"
#import "KikanTimerButton.h"

@interface KikanViewController : UIViewController
@property (weak, nonatomic) IBOutlet KikanTimerButton *button;
@property (weak, nonatomic) IBOutlet KikanTimerView *timer;
@end