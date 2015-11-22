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

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *countLabel;
@property (nonatomic) NSInteger count;
@property (strong, nonatomic) Deck* deck;

@end

@implementation ViewController

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

-(void) setCount:(NSInteger)count
{
    _count = count;
    self.countLabel.text = [NSString stringWithFormat:@"count: %ld", (long)count];
}
- (IBAction)touchCardButton:(UIButton *)sender {
    
    if ([sender.currentTitle length]) {
        [sender setBackgroundImage: [UIImage imageNamed:@"cardback.jpg"] forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
        self.count++;

    }
    else
    {
        Card * card = [self.deck drawRandomCard];
        if (card) {
            [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"]
                          forState:UIControlStateNormal];
            [sender setTitle:card.contents forState:UIControlStateNormal];
            self.count++;

        }
    }
    

}


@end
