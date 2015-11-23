//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by xy on 11/22/15.
//  Copyright © 2015 YangRoom. All rights reserved.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic, readwrite) NSInteger score;
@property (nonatomic, strong) NSMutableArray *cards;

@end

@implementation CardMatchingGame

-(NSMutableArray* ) cards
{
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    return _cards;
}

-(instancetype) initWithCardCount:(NSInteger)count usingDeck:(Deck *)deck
{
    self = [super init];
    if (self) {
        for (int _ = 0; _ < count; _++) {
            Card *card = [deck drawRandomCard];
            if (card) {
                [self.cards addObject:card];
            }
            else
            {
                self = nil;
                break;
            }
        }
    }
    return self;
}



-(Card*) cardAtIndex:(NSInteger)index
{
    return (index < [self.cards count])? self.cards[index]:nil;
}

-(void) chooseCardAtIndex:(NSInteger)index
{

    Card* card = [self cardAtIndex:index];
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        }
        else{
            for (Card* otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    int matchScore = [card match:@[otherCard]];
                    if (matchScore) {
                        self.score = self.score + matchScore*MATCH_BONUS;
                        card.mathched = YES;
                        otherCard.mathched = YES;
                    }
                    else{
                        self.score -= MISMATCH_PENALTY;
                        otherCard.chosen = NO;
                    }
                    break;
                }
            }
            
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
}
@end
