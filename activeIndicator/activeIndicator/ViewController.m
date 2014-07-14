//
//  ViewController.m
//  activeIndicator
//
//  Created by 鎮守府打字員 on 14-7-14.
//  Copyright (c) 2014年 yue1995. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.myUIProgressView.progress = 0.0;
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startToMove:(id)sender {
    if (self.UIActivityIndicatorView.isAnimating) {
        [self.UIActivityIndicatorView stopAnimating];
    } else {
        [self.UIActivityIndicatorView startAnimating];
    }
}

- (IBAction)downloadProgress:(id)sender {
    self.myTimer = [NSTimer scheduledTimerWithTimeInterval:0.3
                                                    target:self
                                                  selector:@selector(download)
                                                  userInfo:nil
                                                   repeats:YES];
}

- (void)download{
    self.myUIProgressView.progress += 0.1;
    if (self.myUIProgressView.progress == 1.0) {
        [self.myTimer invalidate];
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"download completed"
                                                       message:@""
                                                      delegate:nil
                                             cancelButtonTitle:@"ok"
                                             otherButtonTitles:nil];
        [alert show];

    }
}
@end
