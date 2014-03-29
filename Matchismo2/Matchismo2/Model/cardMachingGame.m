//
//  cardMachingGame.m
//  Matchismo2
//
//  Created by Misaka on 14-3-18.
//  Copyright (c) 2014年 nathanyue. All rights reserved.
//

#import "cardMachingGame.h"

@interface cardMachingGame ()
@property(nonatomic,readwrite) NSUInteger score;
@property(nonatomic,strong) NSMutableArray *cards;
@property(nonatomic,readwrite)NSString *stepLabelText;
@property(nonatomic)NSMutableArray *selected;

@end

@implementation cardMachingGame
static const int MISMATCH_PENALTY = 2;
static const int MATCH_BOUNS = 4;
static const int COST_TO_CHOOSE = 1;
-(instancetype)initWithCardCount:(NSUInteger)count
                       usingDeck:(Deck *)deck{
    
    self = [super init];
    
    if (self) {
        for (int i  = 0; i < count; i++) {
            Card *card = [deck randomDrawCard];
            if (card) {
                [self.cards addObject:card];
            } else {
                self = nil;
                break;
            }
        }
        self.numberOfCardsToPlayWith = 2;
    }
    return self;
}

-(void)chooseCardAtIndex:(NSUInteger) index{
    
    Card *card = [self cardAtIndex:index];
    if (self.numberOfCardsToPlayWith == 2) {
        if (!card.isMatched) {
            if (card.isChosen) {
                card.chosen = NO;
                self.stepLabelText =@"";
            } else{
                
                self.score -= COST_TO_CHOOSE;
                self.stepLabelText = card.contents;
                for (Card *otherCard in self.cards) {
                    if (otherCard.isChosen && !otherCard.isMatched) {
                        int matchScore = [card match:@[otherCard]];
                        if (matchScore) {
                            self.score += matchScore * MATCH_BOUNS;
                            otherCard.matched = YES;
                            card.matched = YES;
                            self.stepLabelText =[NSString stringWithFormat:@"Matched %@%@ for %d points"
                                                 ,card.contents
                                                 ,otherCard .contents
                                                 ,matchScore * MATCH_BOUNS];
                        } else {
                            self.score -= MISMATCH_PENALTY;
                            self.stepLabelText =[NSString stringWithFormat:@"%@%@don't match! %d points penalty"
                                                 ,card.contents
                                                 ,otherCard .contents
                                                 ,MISMATCH_PENALTY];
                            otherCard.chosen = NO;
                        }
                    }
                }
                card.chosen = YES;
            }
        }
    } else {
        if (!card.isMatched) {
            if (card.isChosen) {
                card.chosen = NO;
                self.stepLabelText = @"";
            } else {
                
                NSMutableArray *currentChosenCards = [[NSMutableArray alloc] init];
                NSMutableString *statusCurrentChosenCards = [[NSMutableString alloc] init];
                for (Card *otherCard in self.cards) {
                    if (otherCard.isChosen && !otherCard.isMatched) {
                        [currentChosenCards addObject:otherCard];
                        [statusCurrentChosenCards appendFormat:@"%@ ", otherCard.contents];
                    }
                }
                
                if ([currentChosenCards count] == self.numberOfCardsToPlayWith-1) {
                    int matchScore = [card match:currentChosenCards];
                    if (matchScore) {
                        self.score += matchScore * MATCH_BOUNS;
                        for (Card *otherCard in currentChosenCards) {
                            otherCard.matched = YES;
                        }
                        card.matched = YES;
                        self.stepLabelText = [[NSString stringWithFormat:@"Scored: %d. Match found for: %@ ", matchScore * MATCH_BOUNS, card.contents] stringByAppendingString:statusCurrentChosenCards];
                    } else {
                        self.score -= MISMATCH_PENALTY;
                        for (Card *otherCard in currentChosenCards) {
                            otherCard.chosen = NO;
                        }
                        self.stepLabelText = [[NSString stringWithFormat:@"Penalty: %d. No match found for: %@ ", MISMATCH_PENALTY, card.contents] stringByAppendingString:statusCurrentChosenCards];
                    }
                }
                
                self.score -= COST_TO_CHOOSE;
                card.chosen = YES;
            }
        }

    }
}
- (Card *)cardAtIndex:(NSUInteger)index {
    return (index < [self.cards count])? self.cards[index] : nil;
}


-(NSMutableArray *) cards{
    if (!_cards) _cards = [[NSMutableArray alloc]init];
    return _cards;
}
-(NSMutableArray *) selected{
    if (!_selected) _selected = [[NSMutableArray alloc]init];
    return _selected;
}
@end
