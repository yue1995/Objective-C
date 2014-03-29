//
//  PlayingCard.h
//  Matchismo2
//
//  Created by Misaka on 14-3-18.
//  Copyright (c) 2014年 nathanyue. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card
@property(nonatomic,strong) NSString *suit;
@property(nonatomic)NSUInteger rank;
+ (NSArray *) validSuits;
+ (NSArray *) rankStrings;
+ (NSUInteger) maxRank;
@end
