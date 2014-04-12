//
//  KMDealer.m
//  BlackjAck
//
//  Created by MOUNDANGUI Kévin on 31/03/2014.
//  Copyright (c) 2014 MOUNDANGUI Kévin. All rights reserved.
//

#import "KMDealer.h"

@implementation KMDealer

- (id) init
{
    self = [super init];
    if (self) {
        // init
        self.shoe = [[KMShoe alloc] init];
        [self.shoe shoe];
    }
    
    return self;
}

// return la valeur de la première carte du croupier
- (int) firstCardValue
{
    if (self.cards) {
        
        KMCard * c =  self.cards[0];
        return  c.value;
    }
    
    return 0;
}

- (void) distributionAt:(KMPerson *)person withFace:(BOOL) face
{
    if(person)
    {
        KMCard * card = [self.shoe takeCard];
        card.face = face;
        [person.cards addObject:card];
    }
}

// Cette fonction gère les actions du croupier lors de son tour de jeu
- (void) startTurn
{
    // si la distribution est terminer
    
    if ([self cardTotalValues]>= 17) {
        return;
    }
    else
    {
        while ([self cardTotalValues]<17) {
            [self distributionAt:self withFace:YES];
            [self checkAs];
        }
    }
    if([self cardTotalValues] > 21)
    {
        self.isSurrended = YES;
        return;
    }
}




@end
