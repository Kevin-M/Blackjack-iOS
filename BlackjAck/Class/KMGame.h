//
//  KMGame.h
//  BlackjAck
//
//  Created by MOUNDANGUI Kévin on 31/03/2014.
//  Copyright (c) 2014 MOUNDANGUI Kévin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "KMPlayer.h"
#import "KMDealer.h"

@interface KMGame : NSObject
{
    BOOL newTurn;

}

@property (readwrite, strong, nonatomic) KMDealer * dealer;
@property (readwrite, strong, nonatomic) KMPlayer * player;

- (void) newTurn;
- (void) endTurn;

- (void) hit;
- (void) doubleDown;

@end
