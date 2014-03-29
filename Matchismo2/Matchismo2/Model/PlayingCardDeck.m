//
//  PlayingCardDeck.m
//  Matchismo2
//
//  Created by Misaka on 14-3-18.
//  Copyright (c) 2014年 nathanyue. All rights reserved.
//

#import "PlayingCardDeck.h"

@implementation PlayingCardDeck
-(id)init{
    self = [super init];
    
    if (self) {
        for (NSString *suit in [PlayingCard validSuits]) {
            for (unsigned int rank = 1; rank <= [PlayingCard maxRank] ; rank++) {
                PlayingCard *card = [[PlayingCard alloc]init];
                card.suit = suit;
                card.rank = rank;
                [self addCard:card];
            }
        }
    }
    return self;
}



@end
