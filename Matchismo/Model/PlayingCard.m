//
//  PlayingCard.m
//  Matchismo
//
//  Created by xy on 11/17/15.
//  Copyright © 2015 YangRoom. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

-(NSString* )contents
{
    NSArray* ranks = [PlayingCard RankStrings];
    return [ranks[self.rank] stringByAppendingString:self.suit];
}

@synthesize suit = _suit;

-(NSString* )suit
{
    return _suit? _suit:@"?";
}
-(void) setSuit:(NSString *)suit{
    if ([[PlayingCard ValidSuits] containsObject:suit]) {
        _suit = suit;
    }
}

-(void) setRank:(NSInteger)rank{
    if (rank <= [PlayingCard MaxRank]) {
        _rank = rank;
    }
}

-(int) match:(NSArray *)otherCards
{
    int score = 0;
    
    if ([otherCards count] == 1) {
        PlayingCard *otherCard = [otherCards firstObject];
        if (self.rank == otherCard.rank) {
            score = 4;
        }
        else if([self.suit isEqualToString:otherCard.suit]){
            score = 1;
        }
    }
    return score;
}

+(NSArray *) RankStrings{
    return @[@"?",@"A",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}

+(NSArray *)ValidSuits{
    return @[@"♠️",@"♣️",@"♥️",@"♦️"];
}

+(NSInteger) MaxRank{
    return [[PlayingCard RankStrings] count];
}
@end
