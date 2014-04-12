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
        self.newTurn = NO;
        self.resultat = [[NSString alloc] init];
    }
    
    return self;
    
}

- (void) newGame
{
    /*
     1) remise à zero des cartes des joueurs
     
     2) Distribution des cartes aux joueurs
     
     3)
     
     
     */
    if (self.newTurn == NO && self.gameOver == NO ) {
        
        self.newTurn = YES;
        self.resultat = @"";
        
        self.player.blackjack = NO;
        
        self.dealer.isSurrended = NO;
        self.player.isSurrended = NO;
        
        [self.dealer.cards removeAllObjects];
        [self.player.cards removeAllObjects];
        
        while (self.player.cards.count<2) {
            [self.dealer distributionAt:self.player withFace:YES];
            
            //NSLog(@"count %lu",(unsigned long)self.player.cards.count);
        }
        
        // vérifier la valeur des cartes
        [self.player checkAs];
        
        [self.dealer distributionAt:self.dealer withFace:YES];
        [self.dealer distributionAt:self.dealer withFace:NO];
        
        
        self.dealer.cardvalue = [self.dealer firstCardValue];
        
        // vérifier la valeur des cartes.
        //[self.dealer checkCards];
        
        
        // le split se fera ici.
        
        // vérifier blackjack
        if([self.player cardTotalValues]== 21)
        {
            // il y a blackjack
            self.player.blackjack = YES;
            [self endTurn];
        }
    }
    
}

// le joueur pioche une carte

- (void) hit
{
    if (self.newTurn == YES)
    {
        [self.dealer distributionAt:self.player withFace:YES];
        [self.player checkAs];
        NSLog(@"La valeur de votre lot : %i", [self.player cardTotalValues]);
        
        if ([self.player cardTotalValues]>21) {
            [self endTurn];
        }
    }
}

// Le joueur pioche une carte et fini son tour de jeu
- (void) doubleDown
{
    // double la mise du joueur
    // pioche qu'un seul fois
    // end turn
    
    if (self.self.newTurn == YES)
    {
        [self.player doubleBet];
        [self.dealer distributionAt:self.player withFace:YES];
        NSLog(@"La valeur de votre lot : %i", [self.player cardTotalValues]);
        
        [self endTurn];
    }
}

// gestion des jetons

// gestion du résultat du tour de jeux
- (void) endTurn
{
    if (self.newTurn == YES && self.gameOver== NO)
    {
        self.newTurn = NO;
        
        NSLog(@"Valeur lot Joueur : %i", [self.player cardTotalValues]);
        
        NSLog(@"Valeur lot Dealer : %i",  [self.dealer cardTotalValues]);
        
            
        if ([self.player cardTotalValues] > 21)
        {
            self.player.isSurrended = YES;
            self.resultat = @"Le croupier a gagné";
            [self.player loseBet];
            
            NSLog(@"Le croupier a gagné");
        }else if(self.player.blackjack == YES)// à modifier sinon si le joueur à un blackjack, si le croupier n'a pas de blackjack, le joueur gagne, sinon il y a une égalité
        {
            if([self.dealer firstCardValue] == 11)
            {
                // assurance
                
            }
            else
            {
                self.resultat = @"Blackjack !! Vous avez gagné";
                [self.player winBet];
                NSLog(@"Vous avez gagné");
            }
        }
        else
        {
            [self.dealer startTurn];
            self.dealer.cardvalue = [self.dealer cardTotalValues];
            
            if (self.dealer.isSurrended == YES)  {
                
                self.resultat = @"Vous avez gagné";
                [self.player winBet];
                NSLog(@"Vous avez gagné");
            }
            else if ([self.dealer cardTotalValues] < [self.player cardTotalValues])
            {
                // le joueur a gagné.
                self.resultat = @"Vous avez gagné";
                [self.player winBet];
                NSLog(@"Vous avez gagné");
            }
            else if ([self.dealer cardTotalValues] > [self.player cardTotalValues])
            {
                // le dealer a gagné.
                self.resultat = @"Le croupier a gagné";
                [self.player loseBet];
                NSLog(@"Le croupier a gagné");
            }
            else if ([self.dealer cardTotalValues] == [self.player cardTotalValues])
            {
                // il y a égalité
                self.resultat = @"Il y a égalité";
                [self.player drawBet];
                NSLog(@"Il y a égalité");
            }
        }
        // if le joueur a perdu le jeu
        if (self.player.loseGame == YES) {
            self.gameOver = YES;
        }
    }
}


@end
