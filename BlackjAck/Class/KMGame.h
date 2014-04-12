//
//  KMGame.h
//  BlackjAck
//
//  Created by MOUNDANGUI Kévin on 31/03/2014.
//  Copyright (c) 2014 MOUNDANGUI Kévin. All rights reserved.
//


/*
 Cette classe gère le jeu en lui même
 
 */
#import <Foundation/Foundation.h>
#import "KMPlayer.h"
#import "KMDealer.h"

@interface KMGame : NSObject


@property (readwrite, strong, nonatomic) KMDealer * dealer;
@property (readwrite, strong, nonatomic) KMPlayer * player;
@property (readwrite, assign) BOOL newTurn;
@property (readwrite, assign) BOOL gameOver;
@property (readwrite, strong, nonatomic) NSString * resultat;

- (void) newGame;
- (void) endTurn;

- (void) hit;
- (void) doubleDown;

@end
