//
//  ViewController.h
//  activeIndicator
//
//  Created by 鎮守府打字員 on 14-7-14.
//  Copyright (c) 2014年 yue1995. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (strong, nonatomic) NSTimer *myTimer;
@property (weak, nonatomic) IBOutlet UIProgressView *myUIProgressView;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *UIActivityIndicatorView;
- (IBAction)startToMove:(id)sender;
- (IBAction)downloadProgress:(id)sender;
@end
