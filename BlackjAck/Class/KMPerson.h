//
//  KMPerson.h
//  BlackjAck
//
//  Created by MOUNDANGUI Kévin on 31/03/2014.
//  Copyright (c) 2014 MOUNDANGUI Kévin. All rights reserved.
//


#import <Foundation/Foundation.h>
#import "KMCard.h"

@interface KMPerson : NSObject

@property (readwrite, strong, nonatomic) NSMutableArray * cards;


- (id) init;
- (int) cardTotalValues;

// Cette méthode permettra de vérifier les deux premières cartes du joueur
- (void) checkCards;

@end
