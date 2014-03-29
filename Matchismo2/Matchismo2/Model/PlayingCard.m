//
//  PlayingCard.m
//  Matchismo2
//
//  Created by Misaka on 14-3-18.
//  Copyright (c) 2014年 nathanyue. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

@synthesize suit = _suit;

+ (NSArray *) validSuits{
    return @[@"♥️",@"♠️",@"♣️",@"♦️"];
}

+ (NSArray *) rankStrings{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+ (NSUInteger) maxRank{
    return [[self rankStrings] count] - 1;
}

- (NSString *) suit{
    return _suit? _suit: @"?";
}

- (void)setSuit:(NSString *)suit{
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}

- (void)setRank:(NSUInteger)rank{
    if (rank <= [PlayingCard maxRank]) {
        _rank =rank;
    }
}

- (NSString *)contents{
    NSArray *rankStrings = [PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

- (int) match:(NSArray *)otherCards{
    
    int score = 0;
    
    for(PlayingCard *otherCard in otherCards){
        if (otherCard.rank == self.rank) {
            score += 4;
        } else if ([otherCard.suit isEqualToString:self.suit]){
            score += 1;
        }

    }
    return score;
}
@end
