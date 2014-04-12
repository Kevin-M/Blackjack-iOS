//
//  KMHandSpaceView.h
//  BlackjAck
//
//  Created by MOUNDANGUI Kévin on 31/03/2014.
//  Copyright (c) 2014 MOUNDANGUI Kévin. All rights reserved.
//

/*
 Cette classe représente l'espace de jeu d'un joueur
 
 */
#import <UIKit/UIKit.h>
#import "KMCardView.h"

@interface KMHandSpaceView : UIView
{
    KMCardView * c;

}

// cards est une collection de cardView
@property (readwrite,strong,nonatomic) NSMutableArray * cards;


- (void) addCardWithName:(NSString*) name;
- (void) updateWithArray:(NSArray*) array;
-(void) removeCards;

@end
