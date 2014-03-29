//
//  MatchismoViewController.m
//  Matchismo2
//
//  Created by Misaka on 14-3-17.
//  Copyright (c) 2014年 nathanyue. All rights reserved.
//

#import "MatchismoViewController.h"
#import "PlayingCardDeck.h"
#import "cardMachingGame.h"

@interface MatchismoViewController ()

@property (nonatomic,strong) Deck *deck;
@property (nonatomic,strong) cardMachingGame *game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *stepLabel;
@property (weak, nonatomic) IBOutlet UISegmentedControl *modeSelection;

- (IBAction)reTry:(id)sender;

@end

@implementation MatchismoViewController

-(cardMachingGame *) game {
    if (!_game)
        _game = [[cardMachingGame alloc] initWithCardCount:[self.cardButtons count]
                                                         usingDeck:[self createDeck]];
    return _game;
}

- (IBAction)touchCardButton:(UIButton *)sender {
    
    int chosenButtonIndex = [self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    [self updateUI];
}

-(Deck *) deck{
    if (!_deck) _deck = [self createDeck];
        return _deck;
}

-(Deck *) createDeck{
    return [[PlayingCardDeck alloc]init];

}

- (void) updateUI{
    for (UIButton *cardButton in self.cardButtons) {
        
        int cardButtonIndex  = [self.cardButtons indexOfObject:cardButton];
        Card *card = [self.game cardAtIndex:cardButtonIndex];
        
        [cardButton setTitle:[self titleForCard:card]
                    forState:UIControlStateNormal];
        
        [cardButton setBackgroundImage:[self backgroundImageForCard:card]
                              forState:UIControlStateNormal];
        
        cardButton.enabled = !card.isMatched;
        
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
        self.stepLabel.text = [self.game stepLabelText];
        
        if (self.modeSelection.enabled) self.modeSelection.enabled = NO;

    }
}

- (NSString *) titleForCard:(Card *) card {
    return card.isChosen ? card.contents : @"";
}

- (UIImage *) backgroundImageForCard: (Card *) card {
    return [UIImage imageNamed:card.isChosen? @"cardfront" : @"cardback"];
}


- (IBAction)reTry:(id)sender {
    
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                             delegate:self
                                                    cancelButtonTitle:@"Cancel"
                                               destructiveButtonTitle:nil
                                                    otherButtonTitles:@"Retry", nil];
    [actionSheet showInView:self.view];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex == 0) {
        _game = [[cardMachingGame alloc] initWithCardCount:[self.cardButtons count]
                                                 usingDeck:[self createDeck]];
        [self updateUI];
        self.modeSelection.enabled = YES;
    }
    
}

- (IBAction)chooseMatchMode:(UISegmentedControl *)sender
{
    if (sender.selectedSegmentIndex == 1) {
        // 2-card match mode
        self.game.numberOfCardsToPlayWith = 3;
    } else {
        // 3-card match mode
        self.game.numberOfCardsToPlayWith = 2;
    }
}
@end
