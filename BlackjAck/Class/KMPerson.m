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

// Cette fonction permet de connaitre la valeur total de son lot de carte
- (int) cardTotalValues
{
    int total = 0;
    
    for (KMCard *c  in self.cards) {
        total +=c.value;
    }
    return total;
}


// faire une méthode qui détermine la valeur du as en fonction de la valeur du lot de carte

/*
 Algo :
 si la (totalité du lot + 11) <= 21, alors la valeur du as est 11
 sinon l'as vaut 1
 */
- (void) checkAs
{
    KMCard * lastObject = self.cards.lastObject;
    
    // on vérifie que dernier objet soit un AS
    if (lastObject.value == 11)
    {
        if([self cardTotalValues]<= 21) lastObject.value = 11;
        else lastObject.value = 1;
    }
}


@end