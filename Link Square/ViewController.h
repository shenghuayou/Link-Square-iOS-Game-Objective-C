//
//  ViewController.h
//  Link Square
//
//  Created by HUAGE on 5/25/15.
//  Copyright (c) 2015 youshenghua. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ViewController : UIViewController
{

    CAShapeLayer *shapeLayer;
    NSMutableArray *buttonArray;
    UIView * Line;
    
    
    IBOutlet UIButton *Coming;
    IBOutlet UIButton *Easy;
    IBOutlet UIImageView *SettingView;
    IBOutlet UIImageView *LVBG;
    IBOutlet UIButton *OKButton;
    IBOutlet UIImageView *RuleContent;
    IBOutlet UIImageView *L1Setup;
    IBOutlet UIImageView *BG;
    IBOutlet UIButton * Back;
    IBOutlet UIImageView *LevelBG;
    IBOutlet UILabel * Goal;
    IBOutlet UIButton * StartGame;
    IBOutlet UIButton * Setting;
    IBOutlet UIButton * Rule;
    IBOutlet UIButton * L1;
    IBOutlet UIButton * L2;
    IBOutlet UIButton * L3;
    IBOutlet UIButton * L4;
    IBOutlet UIButton * L5;
    IBOutlet UIButton * L6;
    IBOutlet UIButton * L7;
    IBOutlet UIButton * L8;
    IBOutlet UIButton * L9;
    IBOutlet UIButton *N1;
    IBOutlet UIButton *N2;
    IBOutlet UIButton *N3;
    IBOutlet UIButton *N4;
    IBOutlet UIButton *N5;
    IBOutlet UIButton *N6;
    IBOutlet UIButton *N7;
    IBOutlet UIButton *N8;

    IBOutlet UIButton *Tutorial;
    IBOutlet UIButton *Level1;
    IBOutlet UIButton *Level2;
    IBOutlet UIButton *Level3;
    IBOutlet UIButton *Level4;
    IBOutlet UIButton *Level5;
    IBOutlet UIButton *Conitune;
}

-(void)LevelSelect;
-(void)AddButtons;

-(IBAction)LevelChange1:(id)sender;
-(IBAction)LevelChange2:(id)sender;
-(IBAction)LevelChange3:(id)sender;
-(IBAction)LevelChange4:(id)sender;
-(IBAction)LevelChange5:(id)sender;


-(IBAction)Start:(id)sender;
-(IBAction)SettingAction:(id)sender;
-(IBAction)RuleAction:(id)sender;
-(IBAction)BackToMain:(id)sender;


-(IBAction)selectN1:(id)sender;
-(IBAction)selectN2:(id)sender;
-(IBAction)selectN3:(id)sender;
-(IBAction)selectN4:(id)sender;
-(IBAction)selectN5:(id)sender;
-(IBAction)selectN6:(id)sender;
-(IBAction)selectN7:(id)sender;
-(IBAction)selectN8:(id)sender;

-(IBAction)TutorialFunction:(id)sender;
-(IBAction)L1Function:(id)sender;
-(IBAction)L2Function:(id)sender;
-(IBAction)L3Function:(id)sender;
-(IBAction)L4Function:(id)sender;
-(IBAction)L5Function:(id)sender;
-(IBAction)L6Function:(id)sender;
-(IBAction)L7Function:(id)sender;
-(IBAction)L8Function:(id)sender;
-(IBAction)L9Function:(id)sender;
-(IBAction)L10Function:(id)sender;
-(IBAction)L11Function:(id)sender;
-(IBAction)L12Function:(id)sender;
-(IBAction)L13Function:(id)sender;
-(IBAction)L14Function:(id)sender;
-(IBAction)L15Function:(id)sender;
-(IBAction)L16Function:(id)sender;
-(IBAction)L17Function:(id)sender;
-(IBAction)L18Function:(id)sender;
-(IBAction)L19Function:(id)sender;
-(IBAction)L20Function:(id)sender;
-(IBAction)L21Function:(id)sender;
-(IBAction)L22Function:(id)sender;
-(IBAction)L23Function:(id)sender;
-(IBAction)L24Function:(id)sender;
-(IBAction)L25Function:(id)sender;
-(IBAction)L26Function:(id)sender;
-(IBAction)L27Function:(id)sender;
-(IBAction)L28Function:(id)sender;
-(IBAction)L29Function:(id)sender;
-(IBAction)L30Function:(id)sender;
-(IBAction)L31Function:(id)sender;
-(IBAction)L32Function:(id)sender;
-(IBAction)L33Function:(id)sender;
-(IBAction)L34Function:(id)sender;
-(IBAction)L35Function:(id)sender;
-(IBAction)L36Function:(id)sender;
-(IBAction)L37Function:(id)sender;
-(IBAction)L38Function:(id)sender;
-(IBAction)L39Function:(id)sender;
-(IBAction)L40Function:(id)sender;
-(IBAction)L41Function:(id)sender;
-(IBAction)L42Function:(id)sender;
-(IBAction)L43Function:(id)sender;
-(IBAction)L44Function:(id)sender;
-(IBAction)L45Function:(id)sender;



-(void)Level1Setup;
-(void)Level1Setup2;
-(void)Level2Setup;
-(void)Level3Setup;
-(void)Level4Setup;
-(void)MainPage;
-(void)LevelPage;
-(void)CheckLink;




@end

