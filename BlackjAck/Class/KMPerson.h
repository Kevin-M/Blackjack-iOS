//
//  KMPerson.h
//  BlackjAck
//
//  Created by MOUNDANGUI Kévin on 31/03/2014.
//  Copyright (c) 2014 MOUNDANGUI Kévin. All rights reserved.
//

/*
    Cette classe est la classe de base du joueur et du croupier
    Elle contient un tableau de carte qui représente les cartes de la personne
 
 
 */

#import <Foundation/Foundation.h>
#import "KMCard.h"

@interface KMPerson : NSObject

@property (readwrite, strong, nonatomic) NSMutableArray * cards;

// Cette variable permet de dire si la valeur de lot de cartes de la personne à dépasser 21
@property (readwrite,assign) BOOL isSurrended;

- (id) init;
- (int) cardTotalValues;
- (void) checkAs;


@end
