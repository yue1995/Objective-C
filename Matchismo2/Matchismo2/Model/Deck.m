//
//  Deck.m
//  Matchismo2
//
//  Created by Misaka on 14-3-18.
//  Copyright (c) 2014年 nathanyue. All rights reserved.
//

#import "Deck.h"

@interface Deck ()
@property (nonatomic,readwrite) NSMutableArray *cards;
@end

@implementation Deck

-(NSMutableArray *)cards{
    if (!_cards) _cards = [[NSMutableArray alloc]init];
    return _cards;
}

- (void) addCard:(Card *)card atTOP:(BOOL)atTop{
    if (atTop) {
        [self.cards insertObject:card atIndex:0];
    } else {
        [self.cards addObject:card];
    }
    
}

-(void) addCard:(Card *)card{
    [self addCard:card atTOP:NO];
}

-(Card *) randomDrawCard{
    Card *randomCard = nil;
    if ([self.cards count]) {
        unsigned index = arc4random()%[self.cards count];
        randomCard = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    return randomCard;
}

@end
