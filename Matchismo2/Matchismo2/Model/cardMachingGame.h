//
//  cardMachingGame.h
//  Matchismo2
//
//  Created by Misaka on 14-3-18.
//  Copyright (c) 2014年 nathanyue. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "Deck.h"


@interface cardMachingGame : NSObject


-(instancetype)initWithCardCount:(NSUInteger)count
                       usingDeck:(Deck *)deck;

-(void)chooseCardAtIndex:(NSUInteger) index;

-(Card *) cardAtIndex:(NSUInteger) index;

@property(nonatomic,readonly) NSUInteger score;
@property(nonatomic,readonly)NSString *stepLabelText;
@property (nonatomic) NSInteger numberOfCardsToPlayWith;

@end
