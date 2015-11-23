//
//  ViewController.m
//  Matchismo
//
//  Created by xy on 11/17/15.
//  Copyright © 2015 YangRoom. All rights reserved.
//

#import "ViewController.h"
#import "PlayingCard.h"
#import "PlayingDeck.h"
#import "CardMatchingGame.h"

@interface ViewController ()
@property (nonatomic) NSInteger count;
@property (strong, nonatomic) Deck* deck;
@property (strong, nonatomic) CardMatchingGame* game;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@end

@implementation ViewController

-(CardMatchingGame *)game{
    if (!_game) {
        _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count]
                                                  usingDeck:[self createPlayingDeck]];
    }
    return _game;
}
-(Deck* ) deck{
    if (_deck == nil) {
        _deck = [self createPlayingDeck];
    }
    return _deck;
}

-( Deck* ) createPlayingDeck
{
    return [[PlayingDeck alloc]init];
}


- (IBAction)touchCardButton:(UIButton *)sender {
    
    int chosenButtonIndex = (int)[self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:chosenButtonIndex];
    
    [self UpdateUI];
}

-(void) UpdateUI{
    
    for (UIButton *cardButton in self.cardButtons) {
        int cardButtonIndex = (int)[self.cardButtons indexOfObject:cardButton];
        Card* card = [self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroundForCard:card] forState:UIControlStateNormal];
        cardButton.enabled = !card.isMatched;
        self.scoreLabel.text = [NSString stringWithFormat:@"Score: %d", (int)self.game.score];
    }
}

-(NSString *) titleForCard:(Card *) card
{
    return card.isChosen? card.contents:@"";
}
-(UIImage *) backgroundForCard:(Card *) card
{
    return [UIImage imageNamed:card.isChosen?@"cardfront":@"cardback"];
}

@end
