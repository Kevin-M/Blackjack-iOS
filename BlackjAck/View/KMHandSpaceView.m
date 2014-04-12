//
//  KMHandSpaceView.m
//  BlackjAck
//
//  Created by MOUNDANGUI Kévin on 31/03/2014.
//  Copyright (c) 2014 MOUNDANGUI Kévin. All rights reserved.
//

#import "KMHandSpaceView.h"

@implementation KMHandSpaceView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        self.cards = [[NSMutableArray alloc] init];
    }
    return self;
}

// Cette fonction permet d'ajouter une carte dans l'espace du joueur.
-(void) addCardWithName:(NSString *)name
{
    KMCardView *cardView = [[KMCardView alloc] initWithFrame:CGRectMake((320/2), -130, 80, self.bounds.size.height)];
    [cardView.imageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",name]]];
    KMCardView * lastObject  = self.cards.lastObject;
    
    // point de départ de la carte
   // [cardView setFrame:CGRectMake((320/2), -130, 80, self.bounds.size.height)];
    
    if (self.cards.count == 0) {
        
        [UIView animateWithDuration:0.3
                              delay:0
                            options:UIViewAnimationOptionTransitionFlipFromTop
                         animations:^{
                             // poit d'arriver de la carte
                             [cardView setFrame:CGRectMake(0, 0, 80, self.bounds.size.height)];
                             
                         } completion:^(BOOL finished) {
                             NSLog(@"animation done");
                         }];
        
    }
    else if (self.cards.count % 5 == 0)
    {
        [UIView animateWithDuration:0.3
                              delay:0.1
                            options:UIViewAnimationOptionTransitionFlipFromTop
                         animations:^{
                             // poit d'arriver de la carte
                             [cardView setFrame:CGRectMake(0, lastObject.center.y/2, 80, self.bounds.size.height)];
                             
                         } completion:^(BOOL finished) {
                             NSLog(@"animation done");
                         }];
    }
    else
    {
        [UIView animateWithDuration:0.3
                              delay:0.1
                            options:UIViewAnimationOptionTransitionFlipFromRight
                         animations:^{
                             
                             [cardView setFrame:CGRectMake(lastObject.center.x, 0, 80, self.bounds.size.height)];
                             
                         } completion:^(BOOL finished) {
                             NSLog(@"animation done");
                         }];
        
    }
    
    //cardView.backgroundColor = [UIColor brownColor];
    
    
    [self.cards addObject:cardView];
    
    [self addSubview:cardView];
}

// Cette fonction permet de mettre à jour l'espace de jeu d'un joueur c'est à dire ajouter une carte en fonction du lot de carte d'un joueur
- (void) updateWithArray: (NSArray*) array
{
    // on cherche le nombre de carte diff
    int diff = (int)(array.count - self.cards.count);
    // array inchangé
   /* if (diff == 0) {
        while (diff < 2)
        {
            // bug quand on cherche les cardView alors qu'il sont inexistant (hit, doubleDown)
            c = self.cards[diff];
            [c.imageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",array[diff]]]];
            diff++;
        }
    }// array vide
    else */if (diff == (int)array.count)
    {
        diff = 0;
        while (diff != (int)array.count)
        {
            [self addCardWithName:array[diff]];
            
            diff++;
        }
    }
    else // ajout de carte
    {
        diff = 0;
        while (diff != (int)array.count)
        {
            if (diff<self.cards.count)
            {
                // on récupère la cardView
                c = self.cards[diff];
                // on modifie le l'image de la carte
                [c.imageView setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%@.png",array[diff]]]];
            }
            else
            {
                [self addCardWithName:array[diff]];
            }
            
            diff++;
        }
    }
}

-(void) removeCards
{
    // supprimer les cartes avec des animations
    
    for (c in self.cards) {
        
        
        [UIView animateWithDuration:0.1
                              delay:0
                            options:UIViewAnimationOptionTransitionFlipFromTop
                         animations:^{
                             
                             
                             [c setFrame:CGRectMake(-200, 0, 90, self.bounds.size.height)];
                             
                         } completion:^(BOOL finished) {
                             [c removeCardView];
                         }];
    }
    // supprimer les cartes de la super view
    [self.cards removeAllObjects];
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
