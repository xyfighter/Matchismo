//
//  PlayingDeck.m
//  Matchismo
//
//  Created by xy on 11/17/15.
//  Copyright © 2015 YangRoom. All rights reserved.
//

#import "PlayingDeck.h"
#import "PlayingCard.h"

@implementation PlayingDeck

-(instancetype) init
{
    self = [super init];
    if(self){
        for(NSString* suit in [PlayingCard ValidSuits])
            for (NSInteger rank = 1; rank <= [PlayingCard MaxRank]; rank++) {
                PlayingCard *newCard = [[PlayingCard alloc] init];
                newCard.suit = suit;
                newCard.rank = rank;
                [self addCard: newCard];
                
            }
        
    }
    
    return self;
}

@end
