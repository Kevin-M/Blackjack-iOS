//
//  KMGameViewController.h
//  BlackjAck
//
//  Created by MOUNDANGUI Kévin on 31/03/2014.
//  Copyright (c) 2014 MOUNDANGUI Kévin. All rights reserved.
//



#import <UIKit/UIKit.h>
#import "KMGame.h"
#import "KMPerson.h"
#import "KMHandSpaceView.h"

@interface KMGameViewController : UIViewController<UIAlertViewDelegate>

@property (readwrite, strong, nonatomic) KMGame * game;

@property (weak, nonatomic) IBOutlet UILabel *DealerCardValues;
@property (weak, nonatomic) IBOutlet UILabel *PlayerCardValues;

@property (weak, nonatomic) IBOutlet UILabel *labelResult;

@property (weak, nonatomic) IBOutlet UIButton *buttonDeal;
@property (weak, nonatomic) IBOutlet UIButton *buttonStand;
@property (weak, nonatomic) IBOutlet UIButton *buttonDouble;
@property (weak, nonatomic) IBOutlet UIButton *buttonHit;
@property (weak, nonatomic) IBOutlet UILabel *labelBet;
@property (weak, nonatomic) IBOutlet UISlider *sliderBet;
@property (weak, nonatomic) IBOutlet UILabel *wallet;

- (IBAction)changeBetValue:(id)sender;

- (IBAction)deal:(id)sender;

- (IBAction)stand:(id)sender;

- (IBAction)hit:(id)sender;

- (IBAction)doubleDown:(id)sender;

@end
