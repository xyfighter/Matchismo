//
//  Card.m
//  Matchismo
//
//  Created by xy on 11/17/15.
//  Copyright © 2015 YangRoom. All rights reserved.
//

#import "Card.h"

@implementation Card

- (int) match:(NSArray *)otherCards{
    int score = 0;
    
    for (Card* card in otherCards) {
        if ([self.contents isEqualToString:card.contents]) {
            score = 1;
        }
    }
    
    return score;
}

@end
