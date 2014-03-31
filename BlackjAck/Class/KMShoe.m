//
//  KMShoe.m
//  BlackjAck
//
//  Created by MOUNDANGUI Kévin on 31/03/2014.
//  Copyright (c) 2014 MOUNDANGUI Kévin. All rights reserved.
//

#import "KMShoe.h"

@implementation KMShoe

- (void) shoe
{
    
    self.index = 0;
    NSArray * arraySuit = [NSArray arrayWithObjects:@"Hearts",
                           @"Diamonds",
                           @"Clubs",
                           @"Spades",
                           nil];
    /*
     NSArray * arrayRang = [NSArray arrayWithObjects:[NSNumber numberWithInt:1],
     [NSNumber numberWithInt:2],
     [NSNumber numberWithInt:3],
     [NSNumber numberWithInt:4],
     [NSNumber numberWithInt:5],
     [NSNumber numberWithInt:6],
     [NSNumber numberWithInt:7],
     [NSNumber numberWithInt:8],
     [NSNumber numberWithInt:9],
     [NSNumber numberWithInt:10],
     [NSNumber numberWithInt:11],
     [NSNumber numberWithInt:12],
     [NSNumber numberWithInt:13],
     nil];
     */
    self.arrayCards = [[NSMutableArray alloc]init];
    
    for (int deck = 0; deck < 6; deck++) {
        for (int rang = 1; rang <= 13; rang++) {
            for (NSString *suit in  arraySuit) {
                
                // créer un carte et la mettre dans le tableau
                KMCard * card = [[KMCard alloc] init];
                card.suit = suit;
                card.rang = rang;
                card.name = [NSString stringWithFormat:@"%i%@",rang,suit];
                [self setCardValue:card];
                [self.arrayCards addObject:card];
                // NSLog(@"La carte est : %i, famille :%@, valeur %i ",card.rang,card.suit ,card.value);
            }
        }
    }
    [self shuffle];
}

-(void) getCards
{
    for (KMCard * card in  self.arrayCards) {
        NSLog(@"La carte est :%@, %i, famille :%@, valeur %i ",card.name,card.rang,card.suit ,card.value);
    }
    
}

- (void) setCardValue: (KMCard*) card
{
    if (card.rang >= 10 ) {
        
        card.value = 10;
    }
    else if (card.rang == 1)
    {
        card.value = 11;
    }
    else
    {
        card.value = card.rang;
    }
}


- (KMCard*) takeCard
{
    if(self.index+1==208)
    {
        [self shuffle];
    }
    KMCard* card = self.arrayCards[self.index];
    NSLog(@"La carte est :%@, %i, famille :%@, valeur %i ",card.name,card.rang,card.suit ,card.value);
    self.index ++;
    return card;
}

- (void) shuffle
{
    // mélanger les cartes
    self.index = 0;
    KMCard * tmp;
    int i = 0;
    int j = 0;
    int s = 0;
    while (s<4096)
    {
        
        i = (int)(arc4random() % 311);
        j = (int)(arc4random() % 311);
        
        tmp =  self.arrayCards[i];
        self.arrayCards[i] = self.arrayCards[j];
        self.arrayCards[j] = tmp;
        
        s++;
    }
}

@end
