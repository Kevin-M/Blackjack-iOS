//
//  KMGame.m
//  BlackjAck
//
//  Created by MOUNDANGUI Kévin on 31/03/2014.
//  Copyright (c) 2014 MOUNDANGUI Kévin. All rights reserved.
//

#import "KMGame.h"

@implementation KMGame

- (id) init
{
    self = [super init];
    if (self) {
        
        // init
        self.dealer = [[KMDealer alloc] init];
        self.player = [[KMPlayer alloc] init];
    }
    
    return self;
    
}

- (void) newTurn
{
    /*
     1) remise à zero des cartes de joueurs
     
     2) Distribution des cartes aux joueurs
     
     3)
     
     
     */
    newTurn = YES;
    [self.dealer.cards removeAllObjects];
    [self.player.cards removeAllObjects];
    self.dealer.isSurrended = NO;
    
    while (self.player.cards.count<2) {
        [self.dealer distributionAt:self.player withFace:YES];
        NSLog(@"count %lu",(unsigned long)self.player.cards.count);
    }
    
    // vérifier la valeur des cartes.
    [self.player checkCards];
    
    [self.dealer distributionAt:self.dealer withFace:YES];
    [self.dealer distributionAt:self.dealer withFace:NO];
    
    // vérifier la valeur des cartes.
    [self.dealer checkCards];
    
    
    // le split se fera ici.
    
}


- (void) hit
{
    if (newTurn == YES)
    {
        
        [self.dealer distributionAt:self.player withFace:YES];
        NSLog(@"La valeur de votre lot : %i", [self.player cardTotalValues]);
        
        if ([self.player cardTotalValues]>21) {
            [self endTurn];
        }
        
    }
}

- (void) doubleDown
{
    // double sa mise
    // pioche qu'un seul fois
    // end turn
    
    if (newTurn == YES)
    {
        [self.dealer distributionAt:self.player withFace:YES];
        NSLog(@"La valeur de votre lot : %i", [self.player cardTotalValues]);
        [self endTurn];
    }
}

// gestion des jetons

- (void) endTurn
{
    if (newTurn == YES)
    {
        newTurn = NO;
        [self.dealer startTurn];
        
        NSLog(@"Valeur lot Joueur : %i", [self.player cardTotalValues]);
        
        NSLog(@"Valeur lot Dealer : %i",  [self.dealer cardTotalValues]);
        if (self.dealer.isSurrended == YES)  {
            NSLog(@"Vous avez gagné");
        }
        else if ([self.player cardTotalValues] > 21)
        {
            NSLog(@"Le croupier a gagné");
        }
        else if ([self.dealer cardTotalValues] < [self.player cardTotalValues])
        {
            // le joueur a gagné.
            NSLog(@"Vous avez gagné!!");
        }
        else if ([self.dealer cardTotalValues] > [self.player cardTotalValues])
        {
            // le dealer a gagné.
            NSLog(@"Le croupier a gagné");
        }
        else if ([self.dealer cardTotalValues] == [self.player cardTotalValues])
        {
            // il y a égalité
            NSLog(@"Il y a égalité");
        }
        
    }
    
}


@end
