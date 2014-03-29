//
//  Card.m
//  Matchismo2
//
//  Created by Misaka on 14-3-17.
//  Copyright (c) 2014年 nathanyue. All rights reserved.
//

#import "Card.h"

@implementation Card

- (int) match:(NSArray *)otherObject{
    
    int score = 0;
    
    for (Card *card in otherObject) {
        if ([card.contents isEqualToString:self.contents]) {
            score = 1;
        }
    }
    
    return score;
}

@end
