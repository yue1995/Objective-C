//
//  ViewController.m
//  Imaginarium
//
//  Created by Misaka on 14-3-31.
//  Copyright (c) 2014年 yue1995. All rights reserved.
//

#import "ViewController.h"
#import "imageViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.destinationViewController isKindOfClass:[imageViewController class]]) {
        imageViewController *ivc = (imageViewController *)segue.destinationViewController;
        ivc.imageURL = [NSURL URLWithString:[NSString stringWithFormat:@"http://images.apple.com/cn/your-verse/home/images/hero.jpg"]];
        ivc.title = segue.identifier;
    }
}



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
