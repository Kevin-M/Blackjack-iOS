//
//  KMCard.h
//  BlackjAck
//
//  Created by MOUNDANGUI Kévin on 31/03/2014.
//  Copyright (c) 2014 MOUNDANGUI Kévin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KMCard : NSObject

@property (readwrite, strong, nonatomic) NSString * name;
@property (readwrite, strong, nonatomic) NSString * suit;
@property (readwrite, assign) int rang;
@property (readwrite ,assign) int value;
@property (readwrite, assign) BOOL face;

@end
