//
//  ViewController.m
//  Matchismo
//
//  Created by xy on 11/17/15.
//  Copyright © 2015 YangRoom. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)touchCardButton:(UIButton *)sender {
    
    [sender setBackgroundImage: [UIImage imageNamed:@"cardback.jpg"] forState:UIControlStateNormal];
    [sender setTitle:@"" forState:UIControlStateNormal];

}


@end
