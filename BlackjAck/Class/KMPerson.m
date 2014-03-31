//
//  KMPerson.m
//  BlackjAck
//
//  Created by MOUNDANGUI Kévin on 31/03/2014.
//  Copyright (c) 2014 MOUNDANGUI Kévin. All rights reserved.
//

#import "KMPerson.h"

@implementation KMPerson



- (id) init
{
    self = [super init];
    if (self) {
        
        //init
        self.cards = [[NSMutableArray alloc] init];
    }
    return self;
}


- (int) cardTotalValues
{
    int total = 0;
    
    for (KMCard *c  in self.cards) {
        total +=c.value;
    }

    return total;
}

// Cette méthode permettra de vérifier les deux premières cartes du joueur
- (void) checkCards
{
    if (self.cards.count == 2 )
    {
        KMCard * cOne = self.cards[0];
        KMCard * cTwo = self.cards[1];
        if (cOne.value == 11 && cTwo.value == 11) {
            cTwo.value = 1;
        }
        if (cOne.value == cTwo.value)
        {
                 // demander pour un split.
        }
        
    }

}

@end