//
//  KMPlayer.m
//  BlackjAck
//
//  Created by MOUNDANGUI Kévin on 31/03/2014.
//  Copyright (c) 2014 MOUNDANGUI Kévin. All rights reserved.
//

#import "KMPlayer.h"

@implementation KMPlayer



// Cette méthode permettra de vérifier les deux premières cartes du joueur
- (void) checkCards
{
    if (self.cards.count == 2 )
    {
        KMCard * cOne = self.cards[0];
        KMCard * cTwo = self.cards[1];
        
        // Si les 2 cartes sont identiques
        if (cOne.rang == cTwo.rang) {
            
            
            // split
            
        }
    }
}

// Cette fonction permet au joueur de miser une somme
- (void) startBet
{
    if (self.bet > self.wallet)
        return;
    self.wallet -= self.bet;
}

// Cette méthode est utilisé si le joueur gagne la partie
- (void) winBet
{
    if(self.blackjack == YES)
    {
        // le joueur remporte 1,5 * la mise.
        self.wallet += (1.5 * self.bet) + self.bet;
    }
    else
    {
        // le joueur remporte 1 fois la mise + la mise
         self.wallet += (1 * self.bet) + self.bet;
    }
}

//Cette méthode est utilisé si le joueur perd la partie
- (void) loseBet
{
    if (2 > self.wallet) self.loseGame = YES;
    //else self.wallet -= self.bet;
}

// Cette méthode est utilisé il y a une égalité entre le joueur et le croupier
- (void) drawBet
{
    // si il y a égalité le joueur récupère sa mise
    self.wallet += self.bet;
}

@end
