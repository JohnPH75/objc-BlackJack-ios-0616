//  FISAppDelegate.m

#import "FISAppDelegate.h"
#import "FISBlackjackPlayer.h"
#import "FISCardDeck.h"
#import "FISCard.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    
    FISBlackjackPlayer *player = [[FISBlackjackPlayer alloc]initWithName:@"John"];
    
    FISCardDeck *newDeck = [[FISCardDeck alloc]init];
    
    [newDeck shuffleRemainingCards];
    
    FISCard *newCard = newDeck.drawNextCard;
    
    [player acceptCard:newCard];
    
    NSLog(@"%@", player);
    
    return YES;
}

@end
