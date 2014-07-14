//
//  ViewController.h
//  scrollViewSample2
//
//  Created by 鎮守府打字員 on 14-7-13.
//  Copyright (c) 2014年 yue1995. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>
{
    BOOL keyboardVisible;   //键盘出现标识
}
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end
