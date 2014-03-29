//
//  dropBehavior.h
//  Dropit
//
//  Created by Misaka on 14-3-27.
//  Copyright (c) 2014年 nathanyue. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface dropBehavior : UIDynamicBehavior
- (void)addItem: (id <UIDynamicItem>)item;
- (void)removeItem: (id <UIDynamicItem>)item;
@end
