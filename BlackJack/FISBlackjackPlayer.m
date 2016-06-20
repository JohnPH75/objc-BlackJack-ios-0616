//
//  FISFISBlackjackPlayer.m
//  BlackJack
//
//  Created by John Hussain on 6/17/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

#import "FISBlackjackPlayer.h"

@implementation FISBlackjackPlayer

- (instancetype)init{
    
    self = [self initWithName:@""];
    
    return self;
}


- (instancetype)initWithName:(NSString *)name{

    
    self = [super init];
    
    if (self) {
        
        _name = name;
        
        _cardsInHand = [[NSMutableArray alloc] init];
        
        _handscore = 0;
        
        _aceInHand = NO;
        
        _blackjack = NO;
        
        _busted = NO;
        
        _stayed = NO;
        
        _wins = 0;
        
        _losses = 0;
    }
    
    return self;
}

- (void)resetForNewGame{
    
    [self.cardsInHand removeAllObjects];
    
    self.handscore = 0;
    
    self.aceInHand = NO;
    
    self.blackjack = NO;
    
    self.busted = NO;
    
    self.stayed = NO;

}

- (void)acceptCard:(FISCard *)card{
    
    [self.cardsInHand addObject:card];
    
    //handScore
    NSUInteger score = 0;
    
    for (FISCard *card in self.cardsInHand) {
        
        score += card.cardValue;
        
        if ([card.rank isEqualToString:@"A"]) {
            
            self.aceInHand = YES;
        }
    }
    
    if (self.aceInHand && score <= 11) {
        
        score += 10;
    }
    
    self.handscore = score;
    
    //blackjack
    if (self.cardsInHand.count == 2 && self.handscore == 21) {
    
        self.blackjack = YES;
    }
    
    //busted
    if (self.handscore > 21) {
        
        self.busted = YES;
    }

}

- (BOOL)shouldHit{
    
    if (self.handscore > 17) {
        
        self.stayed = YES;
        
        return NO;
    }
    
    return YES;
}

- (NSString*) description{
    
    NSMutableString *gameInfo = [[NSMutableString alloc]initWithString:@"FISBlackjackPlayer:"];
    
    [gameInfo appendFormat:@"\n  name: %@", self.name];
    
    [gameInfo appendString:@"\n  cards:"];
    
    for (FISCard *card in self.cardsInHand) {
        
        [gameInfo appendFormat:@" %@", card.description];
    }
    
    [gameInfo appendFormat:@"\n  handscore: %lu", self.handscore];
    
    [gameInfo appendFormat:@"\n  ace in hand: %d", self.aceInHand];
    
    [gameInfo appendFormat:@"\n  stayed: %d", self.stayed];
    
    [gameInfo appendFormat:@"\n  blackjack: %d", self.blackjack];
    
    [gameInfo appendFormat:@"\n  busted: %d", self.busted];
    
    [gameInfo appendFormat:@"\n  wins: %lu", self.wins];
    
    [gameInfo appendFormat:@"\n  losses: %lu", self.losses];
    
    //NSLog(@"%@", gameInfo);
    return gameInfo;

}

@end