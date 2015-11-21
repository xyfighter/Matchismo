//
//  Deck.m
//  Matchismo
//
//  Created by xy on 11/17/15.
//  Copyright © 2015 YangRoom. All rights reserved.
//

#import "Deck.h"
@interface Deck()

@property (strong, nonatomic) NSMutableArray* cards;

@end

@implementation Deck

-(NSMutableArray* )cards
{
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    
    return _cards;
}

- (void) addCard:(Card *)card atTop:(BOOL)atTop{
    if (atTop) {
        [self.cards insertObject:card atIndex:(0)];
    }
    else{
        [self.cards addObject:card];
    }
}

-(void) addCard:(Card *)card
{
    [self addCard:card atTop:NO];
}

-(Card*) drawRandomCard{
    Card* card = nil;
    NSLog(@"%lu\n",(unsigned long)[self.cards count]);
    if ([self.cards count]) {
        unsigned int index = arc4random()% [self.cards count];
         card = self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    return card;
    
}
@end
