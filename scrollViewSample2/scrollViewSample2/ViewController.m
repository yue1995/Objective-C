//
//  ViewController.m
//  scrollViewSample2
//
//  Created by 鎮守府打字員 on 14-7-13.
//  Copyright (c) 2014年 yue1995. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    keyboardVisible = NO;
    self.scrollView.contentSize = CGSizeMake(320, 600);
    self.textField.delegate = self;
}

-(void) viewWillAppear:(BOOL)animated {
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector (keyBoardDidShow:)
												 name: UIKeyboardDidShowNotification
                                               object:nil];
	[[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector (keyboardDidHide:)
                                                 name: UIKeyboardDidHideNotification
                                               object:nil];
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (void) keyBoardDidShow :(NSNotification *) notif{
    if (keyboardVisible){
        return;
    }
    NSDictionary* info = [notif userInfo];
    NSValue* aValue = [info objectForKey:UIKeyboardFrameEndUserInfoKey];
    CGSize keyBoardSize = [aValue CGRectValue].size;
    
    CGRect viewFrame = [self.scrollView frame];
    viewFrame.size.height -= (keyBoardSize.height);
    self.scrollView.frame = viewFrame;
    
    CGRect textFieldRect = [self.textField frame];
    [self.scrollView scrollRectToVisible:textFieldRect animated:YES];
    
    keyboardVisible = YES;
}

-(void) keyboardDidHide: (NSNotification *)notif {
    
    NSDictionary* info = [notif userInfo];
	NSValue* aValue = [info objectForKey:UIKeyboardFrameEndUserInfoKey];
	CGSize keyboardSize = [aValue CGRectValue].size;
	
    CGRect viewFrame = self.scrollView.frame;
	viewFrame.size.height += keyboardSize.height;
	self.scrollView.frame = viewFrame;
	
	if (!keyboardVisible) {
		return;
	}
    
	keyboardVisible = NO;
	
}

-(void) viewWillDisappear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name: UIKeyboardDidShowNotification
                                                  object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name: UIKeyboardDidHideNotification
                                                  object:nil];
    
    [super viewWillDisappear:animated];
}
@end
