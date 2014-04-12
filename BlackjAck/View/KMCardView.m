//
//  KMCardView.m
//  BlackjAck
//
//  Created by MOUNDANGUI Kévin on 29/03/2014.
//  Copyright (c) 2014 MOUNDANGUI Kévin. All rights reserved.
//

#import "KMCardView.h"

@implementation KMCardView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //UIImage * image= [UIImage imageNamed:@"1Diamonds.png"];
        
//        CGSize size = CGSizeMake(100, 130);
//        UIGraphicsBeginImageContext(size);
//        [image drawInRect:CGRectMake(0,0,size.width,size.height)];
//        
//        UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
//        UIGraphicsEndImageContext();
        
        self.imageView = [[UIImageView alloc]initWithFrame:self.bounds];
        
        [self addSubview:self.imageView];
        // Initialization code
    }
    return self;
}


- (id)initWithName: (NSString*) name
{
    self = [super init];
    if (self) {
        
        UIImage * image= [UIImage imageNamed:[NSString stringWithFormat:@"%@.png",name]];
        
        CGSize size = CGSizeMake(100, 130);
        UIGraphicsBeginImageContext(size);
        [image drawInRect:CGRectMake(0,0,size.width,size.height)];
        UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        
        self.imageView = [[UIImageView alloc]initWithImage:newImage];
        
        [self addSubview:self.imageView];
        // Initialization code
    }
    return self;
}

- (void) removeCardView
{
    [self.imageView removeFromSuperview];
    [self removeFromSuperview];
 

}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
