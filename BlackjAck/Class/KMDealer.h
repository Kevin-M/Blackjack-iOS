//
//  KMDealer.h
//  BlackjAck
//
//  Created by MOUNDANGUI Kévin on 31/03/2014.
//  Copyright (c) 2014 MOUNDANGUI Kévin. All rights reserved.
//

#import "KMPerson.h"
#import "KMShoe.h"

@interface KMDealer : KMPerson

// le croupier gère le sabot
@property(readwrite,strong,nonatomic) KMShoe * shoe;
@property (readwrite, assign) int cardvalue;

// le croupier distribue les carte
- (void) distributionAt:(KMPerson *)person withFace:(BOOL) face;
- (int) firstCardValue;
- (void) startTurn;

@end
