//
//  Deck.h
//  Matchismo
//
//  Created by xy on 11/17/15.
//  Copyright © 2015 YangRoom. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card*)card atTop:(BOOL) atTop;
- (void)addCard:(Card *)card;

- (Card*)drawRandomCard;


@end
