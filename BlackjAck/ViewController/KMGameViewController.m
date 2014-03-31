//
//  KMGameViewController.m
//  BlackjAck
//
//  Created by MOUNDANGUI Kévin on 31/03/2014.
//  Copyright (c) 2014 MOUNDANGUI Kévin. All rights reserved.
//

#import "KMGameViewController.h"


@interface KMGameViewController ()

@end

@implementation KMGameViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    self.game = [[KMGame alloc] init];
}


- (IBAction)deal:(id)sender {
    
    [self.game newTurn];
    
    self.DealerCardValues.text = [NSString stringWithFormat:@"%i",[self.game.dealer cardTotalValues]];
    self.PlayerCardValues.text = [NSString stringWithFormat:@"%i",[self.game.player cardTotalValues]];
}

- (IBAction)stand:(id)sender {
    
    //quand le joueur finis son tour, le dealer commence le sien.
    [self.game endTurn];
    
    self.DealerCardValues.text = [NSString stringWithFormat:@"%i",[self.game.dealer cardTotalValues]];
    self.PlayerCardValues.text = [NSString stringWithFormat:@"%i",[self.game.player cardTotalValues]];
    
    // mettre à jour la carte caché
}

- (IBAction)hit:(id)sender {
    
    [self.game hit];
    
    self.DealerCardValues.text = [NSString stringWithFormat:@"%i",[self.game.dealer cardTotalValues]];
    self.PlayerCardValues.text = [NSString stringWithFormat:@"%i",[self.game.player cardTotalValues]];
    
}

- (IBAction)doubleDown:(id)sender {
    
    [self.game doubleDown];
    
    self.DealerCardValues.text = [NSString stringWithFormat:@"%i",[self.game.dealer cardTotalValues]];
    self.PlayerCardValues.text = [NSString stringWithFormat:@"%i",[self.game.player cardTotalValues]];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
