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

- (void) distributionAt:(KMPerson *)person withFace:(BOOL) face
{
    if(person)
    {
        KMCard * card = [self.shoe takeCard];
        card.face = face;
        [person.cards addObject:card];
    }
}


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
        }
    }
    if([self cardTotalValues] > 21)
    {
        self.isSurrended = YES;
        return;
    }

}




@end
