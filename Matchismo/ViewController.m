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

@end

@implementation ViewController

-(void) setCount:(NSInteger)count
{
    _count = count;
    self.countLabel.text = [NSString stringWithFormat:@"count: %ld", (long)count];
}
- (IBAction)touchCardButton:(UIButton *)sender {
    
    if ([sender.currentTitle length]) {
        [sender setBackgroundImage: [UIImage imageNamed:@"cardback.jpg"] forState:UIControlStateNormal];
        [sender setTitle:@"" forState:UIControlStateNormal];
    }
    else
    {
        PlayingDeck * deck = [[PlayingDeck alloc]init];
        Card * card = [deck drawRandomCard];
        [sender setBackgroundImage:[UIImage imageNamed:@"cardfront"]
                          forState:UIControlStateNormal];
        [sender setTitle:[card contents] forState:UIControlStateNormal];
    }
    
    self.count++;

}


@end
