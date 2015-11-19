//
//  PlayingCard.h
//  Matchismo
//
//  Created by xy on 11/17/15.
//  Copyright © 2015 YangRoom. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString* suit;
@property (nonatomic) NSInteger rank;

+(NSArray *)ValidSuits;
+(NSInteger)MaxRank;

@end
