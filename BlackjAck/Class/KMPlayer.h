//
//  KMPlayer.h
//  BlackjAck
//
//  Created by MOUNDANGUI Kévin on 31/03/2014.
//  Copyright (c) 2014 MOUNDANGUI Kévin. All rights reserved.
//

#import "KMPerson.h"

@interface KMPlayer : KMPerson

@property (readwrite, assign) BOOL blackjack;
@property (readwrite, assign) BOOL loseGame;
@property (readwrite, assign) int wallet;
@property (readwrite, assign) int bet;

// Cette méthode permettra de vérifier les deux premières cartes du joueur
- (void) checkCards;

// méthode concernant la mise
// Cette méthode permet au joueur de miser une somme
- (void) startBet;

// Si le joueur gagne la partie
- (void) winBet;

// Si le joueur perd la partie
- (void) loseBet;

// Si il y a une égalité
- (void) drawBet;

@end
