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

@property(readwrite,strong,nonatomic) KMShoe * shoe;
@property (readwrite,assign) BOOL isSurrended;

- (void) distributionAt:(KMPerson *)person withFace:(BOOL) face;

- (void) startTurn;

@end
