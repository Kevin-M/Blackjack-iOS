//
//  KMGameViewController.m
//  BlackjAck
//
//  Created by MOUNDANGUI Kévin on 31/03/2014.
//  Copyright (c) 2014 MOUNDANGUI Kévin. All rights reserved.
//

#import "KMGameViewController.h"
/*
 Cette l'interface, il faut rajouter les contraintes de chaque view.
 
 
 */

@interface KMGameViewController ()
{
    
    KMCard * c;
    BOOL hit;
    NSArray * arrayView;
}

@property (strong, nonatomic) IBOutlet KMHandSpaceView *dealerSpace;
@property (strong, nonatomic) IBOutlet KMHandSpaceView *playerSpace;

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
    
    self.dealerSpace = [self.dealerSpace initWithFrame:CGRectMake(self.dealerSpace.bounds.origin.x, self.dealerSpace.bounds.origin.y, 220, 150)];
    
    self.playerSpace = [self.playerSpace initWithFrame:CGRectMake(self.playerSpace.bounds.origin.x, self.playerSpace.bounds.origin.y, 220, 150)];
    
    arrayView = [[NSArray alloc] initWithObjects:self.sliderBet,
                 self.buttonStand,
                 self.buttonHit,
                 self.buttonDouble,
                 self.buttonDeal,
                 self.labelResult,
                 nil];
    
    self.labelResult.text = @"";
    
    // initialisation du porte monaie
    self.game.player.wallet = 200;
    self.wallet.text = [NSString stringWithFormat:@"%i", self.game.player.wallet];
    
    self.game.player.bet = self.sliderBet.minimumValue;
    self.labelBet.text = [NSString stringWithFormat:@"%i", self.game.player.bet];
    
    [self displayDealButton];
    
    
    // [self.dealerSpace setBounds:CGRectMake(self.dealerSpace.bounds.origin.x, self.dealerSpace.bounds.origin.y, 220, 150)];
}

- (IBAction)deal:(id)sender {
    if (self.game.gameOver == NO) {
        
        
        [self.dealerSpace removeCards];
        [self.playerSpace removeCards];
        
        // remet l'affichage du résultat à zero
        self.labelResult.text = @"";
        
        [self.game.player startBet];
        self.wallet.text = [NSString stringWithFormat:@"%i",self.game.player.wallet];
        
        // Commencer un nouveau jeu
        [self.game newGame];
        hit = NO;
        
        for (c in self.game.dealer.cards) {
            if (c.face == YES) {
                [self.dealerSpace addCardWithName:c.name];
            }
            else
                [self.dealerSpace addCardWithName:@"cardBack"];
            
            NSLog(@"%@",c.name);
            
        }
        
        for (c in self.game.player.cards) {
            
            [self.playerSpace addCardWithName:c.name];
            NSLog(@"%@",c.name);
            
        }
        
        
        if (self.game.player.blackjack == YES) {
            // problème d'affichage de la dernière carte, elle est dans le tableau de nom, animation se déclenche mais elle n'est pas afficher.
            //[self updateWithPlayer:self.game.dealer withSpace:self.dealerSpace];
            
            [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(result) userInfo:nil repeats:NO];
        }
        else
        {
            [self displayCardValues];
            [self hideDealButton];
        }
    }
}

- (IBAction)stand:(id)sender {
    
    //quand le joueur finis son tour, le dealer commence le sien.
    [self.game endTurn];
    
    [self updateWithPlayer:self.game.dealer withSpace:self.dealerSpace];
    
    [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(result) userInfo:nil repeats:NO];
    
}

// le joueur choisi de piocher une carte
- (IBAction)hit:(id)sender {
    
    [self.game hit];
    hit = YES;
    [self updateWithPlayer:self.game.player withSpace:self.playerSpace];
    [self displayCardValues];
    
    //modif
    // Ce timer permet de finaliser l'animation avant de montrer le résultat
    
    if (self.game.player.isSurrended == YES) {
        [self updateWithPlayer:self.game.dealer withSpace:self.dealerSpace];
        [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(result) userInfo:nil repeats:NO];
    }
}

- (void) result
{
    [self displayCardValues];
    
    if (self.game.player.wallet < 200)
        self.sliderBet.maximumValue = self.game.player.wallet;
    else
        self.sliderBet.maximumValue = 200;
    
    self.sliderBet.value = self.sliderBet.minimumValue;
    
    self.game.player.bet = self.sliderBet.value;
    self.labelBet.text = [NSString stringWithFormat:@"%i", self.game.player.bet];
    
    // Afficher le resultat du match
    self.labelResult.text = self.game.resultat;
    
    // Afficher la valeur actuel du porte monnaie
    self.wallet.text = [NSString stringWithFormat:@"%i",self.game.player.wallet];
    
    [self displayDealButton];
    
    // Si le joueur a perdu uialert avec new game
    if(self.game.gameOver == YES)
    {
        [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(newGame) userInfo:nil repeats:NO];
        
    }
}


// Le double down -> le joueur tire une carte et fini son tour de jeu
- (IBAction)doubleDown:(id)sender {
    
    if (hit == NO) {
        
        
        [self.game doubleDown];
        
        self.wallet.text = [NSString stringWithFormat:@"%i",self.game.player.wallet];
        self.labelBet.text = [NSString stringWithFormat:@"%i", self.game.player.bet];
        
        [self updateWithPlayer:self.game.player withSpace:self.playerSpace];
        
        [self updateWithPlayer:self.game.dealer withSpace:self.dealerSpace];
        
        [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(result) userInfo:nil repeats:NO];
    }
}

- (void) newGame
{
    UIAlertView* alert = [[UIAlertView alloc] initWithTitle:@"Game Over"
                                                    message:@"Vous n'avez pas assez de jetons pour continuer"
                                                   delegate:self
                                          cancelButtonTitle:@"New Game"
                                          otherButtonTitles:nil, nil];
    [alert setAlertViewStyle:UIAlertViewStyleDefault];
    [alert show];
    
}

- (void) displayCardValues
{
    
    self.DealerCardValues.text = [NSString stringWithFormat:@"%i",self.game.dealer.cardvalue];
    self.PlayerCardValues.text = [NSString stringWithFormat:@"%i",[self.game.player cardTotalValues]];
    NSLog(@"LA valuereer");
}


- (void) updateWithPlayer:(KMPerson*) person withSpace:(KMHandSpaceView*) handSpaceView
{
    NSMutableArray * array = [[NSMutableArray alloc]init];
    
    for (c in person.cards) {
        
        [array addObject:c.name];
        NSLog(@"%@",c.name);
    }
    
    [handSpaceView updateWithArray:array];
    
}

- (void) displayDealButton
{
    for(UIView * v in arrayView)
    {
        [UIView transitionWithView:v
                          duration:0.4
                           options:UIViewAnimationOptionTransitionCrossDissolve
                        animations:NULL
                        completion:NULL];
        
    }
    
    [self.labelResult setHidden:NO];
    [self.buttonDouble setHidden:YES];
    [self.buttonHit setHidden:YES];
    [self.buttonStand setHidden:YES];
    [self.sliderBet setHidden:NO];
    [self.buttonDeal setHidden:NO];
    
}

-(void) hideDealButton
{
    for(UIView * v in arrayView)
    {
        [UIView transitionWithView:v
                          duration:0.4
                           options:UIViewAnimationOptionTransitionCrossDissolve
                        animations:NULL
                        completion:NULL];
        
    }
    [self.labelResult setHidden:NO];
    [self.buttonDouble setHidden:NO];
    [self.buttonHit setHidden:NO];
    [self.buttonStand setHidden:NO];
    [self.sliderBet setHidden:YES];
    [self.buttonDeal setHidden:YES];
}


- (IBAction)changeBetValue:(id)sender {
    
    self.game.player.bet = self.sliderBet.value;
    self.labelBet.text = [NSString stringWithFormat:@"%i", self.game.player.bet];
    //self.wallet.text = [NSString stringWithFormat:@"%i", (self.game.player.wallet - self.game.player.bet)];
}

// gestion des choix de l'alerteview
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *title = [alertView buttonTitleAtIndex:buttonIndex];
    
    if([title isEqualToString:@"New Game"])
    {
        NSLog(@"Nouveau jeu");
        self.game.gameOver = NO;
        self.game.player.loseGame = NO;
        [self.dealerSpace removeCards];
        [self.playerSpace removeCards];
        self.labelResult.text = @"";
        self.DealerCardValues.text =@"0";
        self.PlayerCardValues.text = @"0";
        
        self.game.player.wallet = 200;
        self.sliderBet.minimumValue = 2;
        
        self.wallet.text = [NSString stringWithFormat:@"%i", self.game.player.wallet];
        
        self.sliderBet.value = self.sliderBet.minimumValue;
        self.sliderBet.maximumValue = self.game.player.wallet;
        self.game.player.bet = self.sliderBet.value;
        self.labelBet.text = [NSString stringWithFormat:@"%i", self.game.player.bet];
        
    }
    else if([title isEqualToString:@"Button 2"])
    {
        NSLog(@"Button 2 was selected.");
    }
    else if([title isEqualToString:@"Button 3"])
    {
        NSLog(@"Button 3 was selected.");
    }
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
