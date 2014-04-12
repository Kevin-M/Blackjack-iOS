//
//  KMCard.h
//  BlackjAck
//
//  Created by MOUNDANGUI Kévin on 31/03/2014.
//  Copyright (c) 2014 MOUNDANGUI Kévin. All rights reserved.
//

/*
 Cette classe représente une carte
 Une carte a un nom, une valeur, une famille, un rang
 
 Le sabot (classe shoe), contient un tableau de carte.
 */

#import <Foundation/Foundation.h>

@interface KMCard : NSObject

@property (readwrite, strong, nonatomic) NSString * name;
@property (readwrite, strong, nonatomic) NSString * suit;
@property (readwrite, assign) int rang;
@property (readwrite ,assign) int value;

//le booleen face indique si la face de carte sera montrer ou son dos.
@property (readwrite, assign) BOOL face;

@end
