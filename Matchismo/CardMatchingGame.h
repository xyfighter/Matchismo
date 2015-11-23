//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by xy on 11/22/15.
//  Copyright © 2015 YangRoom. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"

@interface CardMatchingGame : NSObject

- (instancetype) initWithCardCount:(NSInteger) count
                         usingDeck:(Deck*) deck;

- (void) chooseCardAtIndex: (NSInteger) index;
-(Card*) cardAtIndex: (NSInteger) index;

@property (nonatomic, readonly) NSInteger score;


@end

static const int MISMATCH_PENALTY = 2;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 1;