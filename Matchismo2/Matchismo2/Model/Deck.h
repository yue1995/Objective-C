//
//  Deck.h
//  Matchismo2
//
//  Created by Misaka on 14-3-18.
//  Copyright (c) 2014年 nathanyue. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

-(void) addCard:(Card *)card atTOP:(BOOL) atTop;
-(void) addCard:(Card *)card;

-(Card *) randomDrawCard;
@end
