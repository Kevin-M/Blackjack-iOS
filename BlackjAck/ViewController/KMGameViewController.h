//
//  KMGameViewController.h
//  BlackjAck
//
//  Created by MOUNDANGUI Kévin on 31/03/2014.
//  Copyright (c) 2014 MOUNDANGUI Kévin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KMGame.h"
#import "KMShoe.h"

@interface KMGameViewController : UIViewController

@property (readwrite, strong, nonatomic) KMGame * game;
@property (weak, nonatomic) IBOutlet UILabel *DealerCardValues;

@property (weak, nonatomic) IBOutlet UILabel *PlayerCardValues;

- (IBAction)deal:(id)sender;

- (IBAction)stand:(id)sender;

- (IBAction)hit:(id)sender;

- (IBAction)doubleDown:(id)sender;
@end
