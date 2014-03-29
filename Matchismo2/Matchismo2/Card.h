//
//  Card.h
//  Matchismo2
//
//  Created by Misaka on 14-3-17.
//  Copyright (c) 2014年 nathanyue. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Card : NSObject
@property (nonatomic,strong) NSString *contents;
@property (nonatomic,getter = isChosen) BOOL chosen;
@property (nonatomic,getter = isMatched) BOOL matched;

- (int) match:(NSArray *)otherObject;
@end
