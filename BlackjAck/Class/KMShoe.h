//
//  KMShoe.h
//  BlackjAck
//
//  Created by MOUNDANGUI Kévin on 31/03/2014.
//  Copyright (c) 2014 MOUNDANGUI Kévin. All rights reserved.
//

/*
 Cette classe représente le sabot du jeu.
 Il contient un tableau de carte.
 
 
 */

#import <Foundation/Foundation.h>
#import "KMCard.h"

@interface KMShoe : NSObject

@property (readwrite, strong,nonatomic) NSMutableArray * arrayCards;
@property (readwrite, assign) int index;


- (void) shoe;
- (KMCard*) takeCard;
-(void) getCards;

@end
