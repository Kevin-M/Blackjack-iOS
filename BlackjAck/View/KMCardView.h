//
//  KMCardView.h
//  BlackjAck
//
//  Created by MOUNDANGUI Kévin on 29/03/2014.
//  Copyright (c) 2014 MOUNDANGUI Kévin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KMCardView : UIView

@property (readwrite, strong, nonatomic) UIImageView * imageView;


- (id)initWithName: (NSString*) name;
- (void) removeCardView;

@end
