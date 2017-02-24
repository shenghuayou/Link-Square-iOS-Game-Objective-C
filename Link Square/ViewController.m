//
//  ViewController.m
//  Link Square
//
//  Created by HUAGE on 5/25/15.
//  Copyright (c) 2015 youshenghua. All rights reserved.
//

#import "ViewController.h"
int TeachStep=10;
int Level=1;
int OriginValue[8];
int Find[8];
BOOL selected[8];
int number_Links[8];
BOOL Linked[8][8];
NSInteger CurrentLevel=45;
int CheckLevel=1;
int AllLevel=9;
BOOL PassedLevel[30];

@interface ViewController ()


@end

@implementation ViewController


-(void)RuleAction:(id)sender
{
    Rule.hidden=YES;
    Setting.hidden=YES;
    StartGame.hidden=YES;
    RuleContent.hidden=NO;
    OKButton.hidden=NO;
    OKButton.center=CGPointMake(210, 455);
    RuleContent.center=CGPointMake(153, 346);
    StartGame.hidden=YES;
}

-(void)SettingAction:(id)sender
{
    Setting.hidden=YES;
    StartGame.hidden=YES;
    Rule.hidden=YES;
    
    SettingView.hidden=NO;
    SettingView.center=CGPointMake(153, 330);
    Easy.hidden=NO;
    Coming.hidden=NO;
    Easy.center=CGPointMake(155, 278);
    Coming.center=CGPointMake(155, 339);
    
}

-(void)init_all
{
    for(int i=0; i<8;i++)
    {
        OriginValue[i]=0;
        Find[i]=0;
        selected[i]=false;
        number_Links[i]=0;
        for (int j=0; j<8; j++) {
            Linked[i][j]=false;
        }
        
    }
    TeachStep=10;
}



-(void)ValueChange
{
    int N1Value=OriginValue[0];
    int N2Value=OriginValue[1];
    int N3Value=OriginValue[2];
    int N4Value=OriginValue[3];
    int N5Value=OriginValue[4];
    int N6Value=OriginValue[5];
    int N7Value=OriginValue[6];
    int N8Value=OriginValue[7];
    int CheckAnswer=0;

    for (int i=0; i<=number_Links[0]; i++)
    {
        N1Value=N1Value-i;
    }
    
    for (int i=0; i<=number_Links[1]; i++)
    {
        N2Value=N2Value-i;
    }
    
    for (int i=0; i<=number_Links[2]; i++)
    {
        N3Value=N3Value-i;
    }
    
    for (int i=0; i<=number_Links[3]; i++)
    {
        N4Value=N4Value-i;
    }
    
    for (int i=0; i<=number_Links[4]; i++)
    {
        N5Value=N5Value-i;
    }
    
    for (int i=0; i<=number_Links[5]; i++)
    {
        N6Value=N6Value-i;
    }
    
    for (int i=0; i<=number_Links[6]; i++)
    {
        N7Value=N7Value-i;
    }
    
    for (int i=0; i<=number_Links[7]; i++)
    {
        N8Value=N8Value-i;
    }
    
    [N1 setTitle:([NSString stringWithFormat:@"%i", N1Value]) forState:UIControlStateNormal];
    [N2 setTitle:([NSString stringWithFormat:@"%i", N2Value]) forState:UIControlStateNormal];
    [N3 setTitle:([NSString stringWithFormat:@"%i", N3Value]) forState:UIControlStateNormal];
    [N4 setTitle:([NSString stringWithFormat:@"%i", N4Value]) forState:UIControlStateNormal];
    [N5 setTitle:([NSString stringWithFormat:@"%i", N5Value]) forState:UIControlStateNormal];
    [N6 setTitle:([NSString stringWithFormat:@"%i", N6Value]) forState:UIControlStateNormal];
    [N7 setTitle:([NSString stringWithFormat:@"%i", N7Value]) forState:UIControlStateNormal];
    [N8 setTitle:([NSString stringWithFormat:@"%i", N8Value]) forState:UIControlStateNormal];
    
    for (int i=0; i<8; i++) {
        if (Find[i]==N1Value || Find[i]==N2Value || Find[i]==N3Value ||Find[i]==N4Value
            || Find[i]==N5Value ||Find[i]==N6Value ||Find[i]==N7Value||Find[i]==N8Value) {
            CheckAnswer++;
        }
    }
    
//    if(N1Value==Find[0] && N2Value==Find[1] && N3Value==Find[2] && N4Value==Find[3] &&N5Value==Find[4] && N6Value==Find[5] && N7Value==Find[6] && N8Value==Find[7])
    if(CheckAnswer==8)
    {
        Conitune.hidden=NO;
        if(CurrentLevel==CheckLevel)
        {
            CurrentLevel++;
            [[NSUserDefaults standardUserDefaults]setInteger:CurrentLevel forKey:@"Save4"];
        }
    }
    
}

-(void)LinkSquare
{
    for(int q=0; q<8; q++)
    {
        number_Links[q]=0;
    }
    
    for (int i=0; i<8; i++)
    {
        for (int j=0; j<8; j++) {
            if(Linked[i][j]==true)
            {
                number_Links[i]++;
                number_Links[j]++;
            }
        }
    }
    
    for(int k=0; k<8; k++)
    {
        number_Links[k]=number_Links[k]/2;
    }
}

-(void)CheckLink
{
    int number=1;
    int selected_number1=0;
    int selected_number2=0;
    for (int i=0; i<8; i++) {
        if (selected[i]==true && number==1) {
            selected_number1=i;
            number++;
        }
        else if(selected[i]==true && number==2)
        {
            selected_number2=i;
            number++;
        }
    }
    if(number==3)
    {
        if(Linked[selected_number1][selected_number2]==false)
        {
            Linked[selected_number1][selected_number2]=true;
            Linked[selected_number2][selected_number1]=true;
            if (TeachStep==1) {
                Goal.text=@"Tap 4 and 4 to Unlink";
            }
            if (TeachStep==3) {
                Goal.text=@"Second Link Reduce Value by 2";
            }
            TeachStep++;
            
        }
        else if(Linked[selected_number1][selected_number2]==true)
        {
            Linked[selected_number1][selected_number2]=false;
            Linked[selected_number2][selected_number1]=false;
            if (TeachStep==2) {
                Goal.text=@"Link One Number to Any Two";
            }
        }
        selected [selected_number1]=false;
        selected [selected_number2]=false;
        [N1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [N2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [N3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [N4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [N5 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [N6 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [N7 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [N8 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [self DrawLine];
        
        [self LinkSquare];
        [self ValueChange];
    }
}

-(IBAction)selectN1:(id)sender
{
    if (selected[0]==false) {
        [N1 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        selected[0]=true;
    }
    else if(selected[0]==true)
    {
        [N1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        selected[0]=false;
    }
    
    
    [self CheckLink];
}

-(IBAction)selectN2:(id)sender
{
    if (selected[1]==false) {
        [N2 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        selected[1]=true;

    }
    else if(selected[1]==true)
    {
        [N2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        selected[1]=false;
    }
    [self CheckLink];
}

-(IBAction)selectN3:(id)sender
{
    if (selected[2]==false) {
        [N3 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        selected[2]=true;
    }
    else if(selected[2]==true)
    {
        [N3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        selected[2]=false;
    }
    
    [self CheckLink];
}

-(IBAction)selectN4:(id)sender
{
    if (selected[3]==false) {
        [N4 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        selected[3]=true;
    }
    else if(selected[3]==true)
    {
        [N4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        selected[3]=false;
    }
    
    [self CheckLink];
}

-(IBAction)selectN5:(id)sender
{
    if (selected[4]==false) {
        [N5 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        selected[4]=true;
    }
    else if(selected[4]==true)
    {
        [N5 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        selected[4]=false;
    }
    
    [self CheckLink];
}

-(IBAction)selectN6:(id)sender
{
    if (selected[5]==false) {
        [N6 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        selected[5]=true;
    }
    else if(selected[5]==true)
    {
        [N6 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        selected[5]=false;
    }
    
    [self CheckLink];
}

-(IBAction)selectN7:(id)sender
{
    if (selected[6]==false) {
        [N7 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        selected[6]=true;
    }
    else if(selected[6]==true)
    {
        [N7 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        selected[6]=false;
    }
    
    [self CheckLink];
}

-(IBAction)selectN8:(id)sender
{
    if (selected[7]==false) {
        [N8 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        selected[7]=true;
    }
    else if(selected[7]==true)
    {
        [N8 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        selected[7]=false;
    }
    
    [self CheckLink];
}



-(void)Level1Setup
{
    UIImage *image = [UIImage imageNamed: @"L1Setup.png"];
    L1Setup.hidden=NO;
    [L1Setup setImage:image];
    N1.hidden=NO;
    N2.hidden=NO;
    N3.hidden=NO;
    N4.hidden=NO;
    N5.hidden=YES;
    N6.hidden=YES;
    N7.hidden=YES;
    N8.hidden=YES;
    N1.center=CGPointMake(165, 168);
    N2.center=CGPointMake(59, 261);
    N3.center=CGPointMake(264, 261);
    N4.center=CGPointMake(165, 356);
}

-(void)Level1Setup2
{
    UIImage *image = [UIImage imageNamed: @"L1-2Setup.png"];
    L1Setup.hidden=NO;
    [L1Setup setImage:image];
    N1.hidden=NO;
    N2.hidden=NO;
    N3.hidden=NO;
    N4.hidden=NO;
    N5.hidden=NO;
    N6.hidden=YES;
    N7.hidden=YES;
    N8.hidden=YES;
    N1.center=CGPointMake(97, 169);
    N2.center=CGPointMake(220, 169);
    N3.center=CGPointMake(67, 269);
    N4.center=CGPointMake(250, 269);
    N5.center=CGPointMake(154, 333);
}

-(void)Level2Setup
{
    UIImage *image = [UIImage imageNamed: @"L2Setup.png"];
    L1Setup.hidden=NO;
    [L1Setup setImage:image];
    N1.hidden=NO;
    N2.hidden=NO;
    N3.hidden=NO;
    N4.hidden=NO;
    N5.hidden=NO;
    N6.hidden=NO;
    N7.hidden=YES;
    N8.hidden=YES;
    N1.center=CGPointMake(97, 169);
    N2.center=CGPointMake(220, 169);
    N3.center=CGPointMake(45, 261);
    N4.center=CGPointMake(278, 261);
    N5.center=CGPointMake(97, 359);
    N6.center=CGPointMake(220, 359);
}

-(void)Level3Setup
{
    UIImage *image = [UIImage imageNamed: @"L3Setup.png"];
    L1Setup.hidden=NO;
    [L1Setup setImage:image];
    N1.hidden=NO;
    N2.hidden=NO;
    N3.hidden=NO;
    N4.hidden=NO;
    N5.hidden=NO;
    N6.hidden=NO;
    N7.hidden=NO;
    N8.hidden=YES;
    N1.center=CGPointMake(118, 156);
    N2.center=CGPointMake(204, 156);
    N3.center=CGPointMake(45, 231);
    N4.center=CGPointMake(278, 231);
    N5.center=CGPointMake(71, 319);
    N6.center=CGPointMake(250, 319);
    N7.center=CGPointMake(160, 359);
}

-(void)Level4Setup
{
    UIImage *image = [UIImage imageNamed: @"L4Setup.png"];
    L1Setup.hidden=NO;
    [L1Setup setImage:image];
    N1.hidden=NO;
    N2.hidden=NO;
    N3.hidden=NO;
    N4.hidden=NO;
    N5.hidden=NO;
    N6.hidden=NO;
    N7.hidden=NO;
    N8.hidden=NO;
    N1.center=CGPointMake(118, 154);
    N2.center=CGPointMake(204, 154);
    N3.center=CGPointMake(45, 220);
    N4.center=CGPointMake(275, 220);
    N5.center=CGPointMake(45, 298);
    N6.center=CGPointMake(275, 298);
    N7.center=CGPointMake(118, 363);
    N8.center=CGPointMake(204, 363);
}

-(IBAction)BackToMain:(id)sender
{
    [shapeLayer removeFromSuperlayer];
    [self MainPage];
}

-(IBAction)TutorialFunction:(id)sender
{
    [self HidePage];
    [self init_all];
    TeachStep=1;
    Find[0]=1;
    Find[1]=1;
    Find[2]=1;
    Find[3]=1;
    Find[4]=0;
    OriginValue[0]=5;
    OriginValue[1]=5;
    OriginValue[2]=5;
    OriginValue[3]=5;
    [N1 setTitle:([NSString stringWithFormat:@"5"]) forState:UIControlStateNormal];
    [N2 setTitle:([NSString stringWithFormat:@"5"]) forState:UIControlStateNormal];
    [N3 setTitle:([NSString stringWithFormat:@"5"]) forState:UIControlStateNormal];
    [N4 setTitle:([NSString stringWithFormat:@"5"]) forState:UIControlStateNormal];
    
    Goal.text=@"Tap 2 Numbers";
    Goal.hidden=NO;
    [self Level1Setup];
    CheckLevel=0;
}

-(IBAction)L1Function:(id)sender
{
    [self HidePage];
    [self init_all];
    Find[0]=5;
    Find[1]=1;
    Find[2]=2;
    Find[3]=7;
    Find[4]=0;
    OriginValue[0]=6;
    OriginValue[1]=4;
    OriginValue[2]=5;
    OriginValue[3]=8;
    [N1 setTitle:([NSString stringWithFormat:@"6"]) forState:UIControlStateNormal];
    [N2 setTitle:([NSString stringWithFormat:@"4"]) forState:UIControlStateNormal];
    [N3 setTitle:([NSString stringWithFormat:@"5"]) forState:UIControlStateNormal];
    [N4 setTitle:([NSString stringWithFormat:@"8"]) forState:UIControlStateNormal];
    
    Goal.text=@"Find:1-2-5-7";
    Goal.hidden=NO;
    [self Level1Setup];
    CheckLevel=1;
}

-(IBAction)L2Function:(id)sender
{
    [self HidePage];
    [self init_all];
    Find[0]=1;
    Find[1]=2;
    Find[2]=3;
    Find[3]=4;
    Find[4]=0;
    OriginValue[0]=4;
    OriginValue[1]=8;
    OriginValue[2]=9;
    OriginValue[3]=7;
    [N1 setTitle:([NSString stringWithFormat:@"4"]) forState:UIControlStateNormal];
    [N2 setTitle:([NSString stringWithFormat:@"8"]) forState:UIControlStateNormal];
    [N3 setTitle:([NSString stringWithFormat:@"9"]) forState:UIControlStateNormal];
    [N4 setTitle:([NSString stringWithFormat:@"7"]) forState:UIControlStateNormal];
    
    Goal.text=@"Find:1-2-3-4";
    Goal.hidden=NO;
    [self Level1Setup];
    CheckLevel=2;
}


-(IBAction)L3Function:(id)sender
{
    
    [self HidePage];
    [self init_all];
    Find[0]=6;
    Find[1]=2;
    Find[2]=4;
    Find[3]=9;
    OriginValue[0]=12;
    OriginValue[1]=5;
    OriginValue[2]=7;
    OriginValue[3]=10;
    [N1 setTitle:([NSString stringWithFormat:@"12"]) forState:UIControlStateNormal];
    [N2 setTitle:([NSString stringWithFormat:@"5"]) forState:UIControlStateNormal];
    [N3 setTitle:([NSString stringWithFormat:@"7"]) forState:UIControlStateNormal];
    [N4 setTitle:([NSString stringWithFormat:@"10"]) forState:UIControlStateNormal];
    
    Goal.text=@"Find:2-4-6-9";
    Goal.hidden=NO;
    [self Level1Setup];
    CheckLevel=3;
}

-(IBAction)L4Function:(id)sender
{
    [self HidePage];
    [self init_all];
    Find[0]=5;
    Find[1]=4;
    Find[2]=2;
    Find[3]=1;
    Find[4]=3;
    OriginValue[0]=6;
    OriginValue[1]=7;
    OriginValue[2]=5;
    OriginValue[3]=4;
    OriginValue[4]=9;
    [N1 setTitle:([NSString stringWithFormat:@"6"]) forState:UIControlStateNormal];
    [N2 setTitle:([NSString stringWithFormat:@"7"]) forState:UIControlStateNormal];
    [N3 setTitle:([NSString stringWithFormat:@"5"]) forState:UIControlStateNormal];
    [N4 setTitle:([NSString stringWithFormat:@"4"]) forState:UIControlStateNormal];
    [N5 setTitle:([NSString stringWithFormat:@"9"]) forState:UIControlStateNormal];
    
    Goal.text=@"Find:1-2-3-4-5";
    Goal.hidden=NO;
    [self Level1Setup2];
    CheckLevel=4;
}

-(IBAction)L5Function:(id)sender
{
    [self HidePage];
    [self init_all];
    Find[0]=4;
    Find[1]=5;
    Find[2]=6;
    Find[3]=3;
    Find[4]=2;
    OriginValue[0]=5;
    OriginValue[1]=6;
    OriginValue[2]=9;
    OriginValue[3]=4;
    OriginValue[4]=8;
    
    [N1 setTitle:([NSString stringWithFormat:@"%i",OriginValue[0]]) forState:UIControlStateNormal];
    [N2 setTitle:([NSString stringWithFormat:@"%i",OriginValue[1]]) forState:UIControlStateNormal];
    [N3 setTitle:([NSString stringWithFormat:@"%i",OriginValue[2]]) forState:UIControlStateNormal];
    [N4 setTitle:([NSString stringWithFormat:@"%i",OriginValue[3]]) forState:UIControlStateNormal];
    [N5 setTitle:([NSString stringWithFormat:@"%i",OriginValue[4]]) forState:UIControlStateNormal];
    
    Goal.text=@"Find:2-3-4-5-6";
    Goal.hidden=NO;
    [self Level1Setup2];
    CheckLevel=5;
}

-(IBAction)L6Function:(id)sender
{
    [self HidePage];
    [self init_all];
    Find[0]=4;
    Find[1]=7;
    Find[2]=5;
    Find[3]=3;
    Find[4]=6;
    OriginValue[0]=7;
    OriginValue[1]=13;
    OriginValue[2]=8;
    OriginValue[3]=6;
    OriginValue[4]=12;
    
    [N1 setTitle:([NSString stringWithFormat:@"%i",OriginValue[0]]) forState:UIControlStateNormal];
    [N2 setTitle:([NSString stringWithFormat:@"%i",OriginValue[1]]) forState:UIControlStateNormal];
    [N3 setTitle:([NSString stringWithFormat:@"%i",OriginValue[2]]) forState:UIControlStateNormal];
    [N4 setTitle:([NSString stringWithFormat:@"%i",OriginValue[3]]) forState:UIControlStateNormal];
    [N5 setTitle:([NSString stringWithFormat:@"%i",OriginValue[4]]) forState:UIControlStateNormal];
    
    Goal.text=@"Find:3-4-5-6-7";
    Goal.hidden=NO;
    [self Level1Setup2];
    CheckLevel=6;
}

-(IBAction)L7Function:(id)sender
{
    [self HidePage];
    [self init_all];
    Find[0]=7;
    Find[1]=14;
    Find[2]=4;
    Find[3]=11;
    Find[4]=10;
    OriginValue[0]=17;
    OriginValue[1]=20;
    OriginValue[2]=10;
    OriginValue[3]=14;
    OriginValue[4]=13;
    
    [N1 setTitle:([NSString stringWithFormat:@"%i",OriginValue[0]]) forState:UIControlStateNormal];
    [N2 setTitle:([NSString stringWithFormat:@"%i",OriginValue[1]]) forState:UIControlStateNormal];
    [N3 setTitle:([NSString stringWithFormat:@"%i",OriginValue[2]]) forState:UIControlStateNormal];
    [N4 setTitle:([NSString stringWithFormat:@"%i",OriginValue[3]]) forState:UIControlStateNormal];
    [N5 setTitle:([NSString stringWithFormat:@"%i",OriginValue[4]]) forState:UIControlStateNormal];
    
    Goal.text=@"Find:4-7-10-11-14";
    Goal.hidden=NO;
    [self Level1Setup2];
    CheckLevel=7;
}

-(IBAction)L8Function:(id)sender
{
    [self HidePage];
    [self init_all];
    Find[0]=5;
    Find[1]=4;
    Find[2]=7;
    Find[3]=9;
    Find[4]=8;
    OriginValue[0]=11;
    OriginValue[1]=10;
    OriginValue[2]=17;
    OriginValue[3]=15;
    OriginValue[4]=14;
    
    [N1 setTitle:([NSString stringWithFormat:@"%i",OriginValue[0]]) forState:UIControlStateNormal];
    [N2 setTitle:([NSString stringWithFormat:@"%i",OriginValue[1]]) forState:UIControlStateNormal];
    [N3 setTitle:([NSString stringWithFormat:@"%i",OriginValue[2]]) forState:UIControlStateNormal];
    [N4 setTitle:([NSString stringWithFormat:@"%i",OriginValue[3]]) forState:UIControlStateNormal];
    [N5 setTitle:([NSString stringWithFormat:@"%i",OriginValue[4]]) forState:UIControlStateNormal];
    
    Goal.text=@"Find:4-5-7-8-9";
    Goal.hidden=NO;
    [self Level1Setup2];
    CheckLevel=8;
}

-(IBAction)L9Function:(id)sender
{
    [self HidePage];
    [self init_all];
    Find[0]=14;
    Find[1]=7;
    Find[2]=10;
    Find[3]=8;
    Find[4]=4;
    OriginValue[0]=17;
    OriginValue[1]=10;
    OriginValue[2]=13;
    OriginValue[3]=11;
    OriginValue[4]=14;
    
    [N1 setTitle:([NSString stringWithFormat:@"%i",OriginValue[0]]) forState:UIControlStateNormal];
    [N2 setTitle:([NSString stringWithFormat:@"%i",OriginValue[1]]) forState:UIControlStateNormal];
    [N3 setTitle:([NSString stringWithFormat:@"%i",OriginValue[2]]) forState:UIControlStateNormal];
    [N4 setTitle:([NSString stringWithFormat:@"%i",OriginValue[3]]) forState:UIControlStateNormal];
    [N5 setTitle:([NSString stringWithFormat:@"%i",OriginValue[4]]) forState:UIControlStateNormal];
    
    Goal.text=@"Find:4-7-8-10-14";
    Goal.hidden=NO;
    [self Level1Setup2];
    CheckLevel=9;
}

-(IBAction)L10Function:(id)sender
{
    [self HidePage];
    [self init_all];
    Find[0]=1;
    Find[1]=5;
    Find[2]=3;
    Find[3]=7;
    Find[4]=4;
    Find[5]=2;
    OriginValue[0]=7;
    OriginValue[1]=8;
    OriginValue[2]=9;
    OriginValue[3]=10;
    OriginValue[4]=5;
    OriginValue[5]=3;
    
    [N1 setTitle:([NSString stringWithFormat:@"%i",OriginValue[0]]) forState:UIControlStateNormal];
    [N2 setTitle:([NSString stringWithFormat:@"%i",OriginValue[1]]) forState:UIControlStateNormal];
    [N3 setTitle:([NSString stringWithFormat:@"%i",OriginValue[2]]) forState:UIControlStateNormal];
    [N4 setTitle:([NSString stringWithFormat:@"%i",OriginValue[3]]) forState:UIControlStateNormal];
    [N5 setTitle:([NSString stringWithFormat:@"%i",OriginValue[4]]) forState:UIControlStateNormal];
    [N6 setTitle:([NSString stringWithFormat:@"%i",OriginValue[5]]) forState:UIControlStateNormal];
    
    Goal.text=@"Find:1-2-3-4-5-7";
    Goal.hidden=NO;
    [self Level2Setup];
    CheckLevel=10;
}

-(IBAction)L11Function:(id)sender
{
    [self HidePage];
    [self init_all];
    Find[0]=6;
    Find[1]=15;
    Find[2]=9;
    Find[3]=11;
    Find[4]=2;
    Find[5]=3;
    OriginValue[0]=9;
    OriginValue[1]=18;
    OriginValue[2]=10;
    OriginValue[3]=12;
    OriginValue[4]=8;
    OriginValue[5]=4;
    
    [N1 setTitle:([NSString stringWithFormat:@"%i",OriginValue[0]]) forState:UIControlStateNormal];
    [N2 setTitle:([NSString stringWithFormat:@"%i",OriginValue[1]]) forState:UIControlStateNormal];
    [N3 setTitle:([NSString stringWithFormat:@"%i",OriginValue[2]]) forState:UIControlStateNormal];
    [N4 setTitle:([NSString stringWithFormat:@"%i",OriginValue[3]]) forState:UIControlStateNormal];
    [N5 setTitle:([NSString stringWithFormat:@"%i",OriginValue[4]]) forState:UIControlStateNormal];
    [N6 setTitle:([NSString stringWithFormat:@"%i",OriginValue[5]]) forState:UIControlStateNormal];
    
    Goal.text=@"Find:2-3-6-9-11-15";
    Goal.hidden=NO;
    [self Level2Setup];
    CheckLevel=11;
}

-(IBAction)L12Function:(id)sender
{
    [self HidePage];
    [self init_all];
    Find[0]=6;
    Find[1]=8;
    Find[2]=14;
    Find[3]=11;
    Find[4]=15;
    Find[5]=9;
    OriginValue[0]=7;
    OriginValue[1]=11;
    OriginValue[2]=17;
    OriginValue[3]=12;
    OriginValue[4]=16;
    OriginValue[5]=15;
    
    [N1 setTitle:([NSString stringWithFormat:@"%i",OriginValue[0]]) forState:UIControlStateNormal];
    [N2 setTitle:([NSString stringWithFormat:@"%i",OriginValue[1]]) forState:UIControlStateNormal];
    [N3 setTitle:([NSString stringWithFormat:@"%i",OriginValue[2]]) forState:UIControlStateNormal];
    [N4 setTitle:([NSString stringWithFormat:@"%i",OriginValue[3]]) forState:UIControlStateNormal];
    [N5 setTitle:([NSString stringWithFormat:@"%i",OriginValue[4]]) forState:UIControlStateNormal];
    [N6 setTitle:([NSString stringWithFormat:@"%i",OriginValue[5]]) forState:UIControlStateNormal];
    
    Goal.text=@"Find:6-8-9-11-14-15";
    Goal.hidden=NO;
    [self Level2Setup];
    CheckLevel=12;
}
-(IBAction)L13Function:(id)sender
{
    [self HidePage];
    [self init_all];
    Find[0]=4;
    Find[1]=13;
    Find[2]=7;
    Find[3]=9;
    Find[4]=11;
    Find[5]=3;
    OriginValue[0]=7;
    OriginValue[1]=19;
    OriginValue[2]=8;
    OriginValue[3]=10;
    OriginValue[4]=11;
    OriginValue[5]=9;
    
    [N1 setTitle:([NSString stringWithFormat:@"%i",OriginValue[0]]) forState:UIControlStateNormal];
    [N2 setTitle:([NSString stringWithFormat:@"%i",OriginValue[1]]) forState:UIControlStateNormal];
    [N3 setTitle:([NSString stringWithFormat:@"%i",OriginValue[2]]) forState:UIControlStateNormal];
    [N4 setTitle:([NSString stringWithFormat:@"%i",OriginValue[3]]) forState:UIControlStateNormal];
    [N5 setTitle:([NSString stringWithFormat:@"%i",OriginValue[4]]) forState:UIControlStateNormal];
    [N6 setTitle:([NSString stringWithFormat:@"%i",OriginValue[5]]) forState:UIControlStateNormal];
    
    Goal.text=@"Find:3-4-7-9-11-13";
    Goal.hidden=NO;
    [self Level2Setup];
    CheckLevel=13;
}
-(IBAction)L14Function:(id)sender
{
    [self HidePage];
    [self init_all];
    Find[0]=12;
    Find[1]=3;
    Find[2]=16;
    Find[3]=5;
    Find[4]=8;
    Find[5]=1;
    OriginValue[0]=13;
    OriginValue[1]=6;
    OriginValue[2]=17;
    OriginValue[3]=11;
    OriginValue[4]=9;
    OriginValue[5]=4;
    
    [N1 setTitle:([NSString stringWithFormat:@"%i",OriginValue[0]]) forState:UIControlStateNormal];
    [N2 setTitle:([NSString stringWithFormat:@"%i",OriginValue[1]]) forState:UIControlStateNormal];
    [N3 setTitle:([NSString stringWithFormat:@"%i",OriginValue[2]]) forState:UIControlStateNormal];
    [N4 setTitle:([NSString stringWithFormat:@"%i",OriginValue[3]]) forState:UIControlStateNormal];
    [N5 setTitle:([NSString stringWithFormat:@"%i",OriginValue[4]]) forState:UIControlStateNormal];
    [N6 setTitle:([NSString stringWithFormat:@"%i",OriginValue[5]]) forState:UIControlStateNormal];
    
    Goal.text=@"Find:1-3-5-8-12-16";
    Goal.hidden=NO;
    [self Level2Setup];
    CheckLevel=14;
}
-(IBAction)L15Function:(id)sender
{
    [self HidePage];
    [self init_all];
    Find[0]=17;
    Find[1]=11;
    Find[2]=1;
    Find[3]=4;
    Find[4]=13;
    Find[5]=15;
    OriginValue[0]=18;
    OriginValue[1]=17;
    OriginValue[2]=7;
    OriginValue[3]=5;
    OriginValue[4]=14;
    OriginValue[5]=21;
    
    [N1 setTitle:([NSString stringWithFormat:@"%i",OriginValue[0]]) forState:UIControlStateNormal];
    [N2 setTitle:([NSString stringWithFormat:@"%i",OriginValue[1]]) forState:UIControlStateNormal];
    [N3 setTitle:([NSString stringWithFormat:@"%i",OriginValue[2]]) forState:UIControlStateNormal];
    [N4 setTitle:([NSString stringWithFormat:@"%i",OriginValue[3]]) forState:UIControlStateNormal];
    [N5 setTitle:([NSString stringWithFormat:@"%i",OriginValue[4]]) forState:UIControlStateNormal];
    [N6 setTitle:([NSString stringWithFormat:@"%i",OriginValue[5]]) forState:UIControlStateNormal];
    
    Goal.text=@"Find:1-4-11-13-15-17";
    Goal.hidden=NO;
    [self Level2Setup];
    CheckLevel=15;
}
-(IBAction)L16Function:(id)sender
{
    [self HidePage];
    [self init_all];
    Find[0]=13;
    Find[1]=9;
    Find[2]=22;
    Find[3]=5;
    Find[4]=18;
    Find[5]=15;
    OriginValue[0]=19;
    OriginValue[1]=15;
    OriginValue[2]=25;
    OriginValue[3]=6;
    OriginValue[4]=21;
    OriginValue[5]=16;
    
    [N1 setTitle:([NSString stringWithFormat:@"%i",OriginValue[0]]) forState:UIControlStateNormal];
    [N2 setTitle:([NSString stringWithFormat:@"%i",OriginValue[1]]) forState:UIControlStateNormal];
    [N3 setTitle:([NSString stringWithFormat:@"%i",OriginValue[2]]) forState:UIControlStateNormal];
    [N4 setTitle:([NSString stringWithFormat:@"%i",OriginValue[3]]) forState:UIControlStateNormal];
    [N5 setTitle:([NSString stringWithFormat:@"%i",OriginValue[4]]) forState:UIControlStateNormal];
    [N6 setTitle:([NSString stringWithFormat:@"%i",OriginValue[5]]) forState:UIControlStateNormal];
    
    Goal.text=@"Find:5-9-13-15-18-22";
    Goal.hidden=NO;
    [self Level2Setup];
    CheckLevel=16;
}
-(IBAction)L17Function:(id)sender
{
    [self HidePage];
    [self init_all];
    Find[0]=12;
    Find[1]=9;
    Find[2]=6;
    Find[3]=7;
    Find[4]=5;
    Find[5]=8;
    OriginValue[0]=18;
    OriginValue[1]=15;
    OriginValue[2]=16;
    OriginValue[3]=17;
    OriginValue[4]=8;
    OriginValue[5]=11;
    
    [N1 setTitle:([NSString stringWithFormat:@"%i",OriginValue[0]]) forState:UIControlStateNormal];
    [N2 setTitle:([NSString stringWithFormat:@"%i",OriginValue[1]]) forState:UIControlStateNormal];
    [N3 setTitle:([NSString stringWithFormat:@"%i",OriginValue[2]]) forState:UIControlStateNormal];
    [N4 setTitle:([NSString stringWithFormat:@"%i",OriginValue[3]]) forState:UIControlStateNormal];
    [N5 setTitle:([NSString stringWithFormat:@"%i",OriginValue[4]]) forState:UIControlStateNormal];
    [N6 setTitle:([NSString stringWithFormat:@"%i",OriginValue[5]]) forState:UIControlStateNormal];
    
    Goal.text=@"Find:5-6-7-8-9-12";
    Goal.hidden=NO;
    [self Level2Setup];
    CheckLevel=17;
}
-(IBAction)L18Function:(id)sender
{
    [self HidePage];
    [self init_all];
    Find[0]=9;
    Find[1]=4;
    Find[2]=5;
    Find[3]=6;
    Find[4]=7;
    Find[5]=2;
    OriginValue[0]=19;
    OriginValue[1]=10;
    OriginValue[2]=20;
    OriginValue[3]=12;
    OriginValue[4]=8;
    OriginValue[5]=5;
    
    [N1 setTitle:([NSString stringWithFormat:@"%i",OriginValue[0]]) forState:UIControlStateNormal];
    [N2 setTitle:([NSString stringWithFormat:@"%i",OriginValue[1]]) forState:UIControlStateNormal];
    [N3 setTitle:([NSString stringWithFormat:@"%i",OriginValue[2]]) forState:UIControlStateNormal];
    [N4 setTitle:([NSString stringWithFormat:@"%i",OriginValue[3]]) forState:UIControlStateNormal];
    [N5 setTitle:([NSString stringWithFormat:@"%i",OriginValue[4]]) forState:UIControlStateNormal];
    [N6 setTitle:([NSString stringWithFormat:@"%i",OriginValue[5]]) forState:UIControlStateNormal];
    
    Goal.text=@"Find:2-4-5-6-7-9";
    Goal.hidden=NO;
    [self Level2Setup];
    CheckLevel=18;
}

-(IBAction)L19Function:(id)sender
{
    [self HidePage];
    [self init_all];
    Find[0]=17;
    Find[1]=9;
    Find[2]=5;
    Find[3]=7;
    Find[4]=13;
    Find[5]=20;
    Find[6]=16;
    OriginValue[0]=23;
    OriginValue[1]=15;
    OriginValue[2]=8;
    OriginValue[3]=10;
    OriginValue[4]=14;
    OriginValue[5]=21;
    OriginValue[6]=19;
    
    [N1 setTitle:([NSString stringWithFormat:@"%i",OriginValue[0]]) forState:UIControlStateNormal];
    [N2 setTitle:([NSString stringWithFormat:@"%i",OriginValue[1]]) forState:UIControlStateNormal];
    [N3 setTitle:([NSString stringWithFormat:@"%i",OriginValue[2]]) forState:UIControlStateNormal];
    [N4 setTitle:([NSString stringWithFormat:@"%i",OriginValue[3]]) forState:UIControlStateNormal];
    [N5 setTitle:([NSString stringWithFormat:@"%i",OriginValue[4]]) forState:UIControlStateNormal];
    [N6 setTitle:([NSString stringWithFormat:@"%i",OriginValue[5]]) forState:UIControlStateNormal];
    [N7 setTitle:([NSString stringWithFormat:@"%i",OriginValue[6]]) forState:UIControlStateNormal];
    Goal.text=@"Find:5-7-9-13-16-17-20";
    Goal.hidden=NO;
    [self Level3Setup];
    CheckLevel=19;
}

-(IBAction)L20Function:(id)sender
{
    [self HidePage];
    [self init_all];
    Find[0]=7;
    Find[1]=3;
    Find[2]=6;
    Find[3]=4;
    Find[4]=1;
    Find[5]=2;
    Find[6]=10;
    OriginValue[0]=8;
    OriginValue[1]=4;
    OriginValue[2]=9;
    OriginValue[3]=7;
    OriginValue[4]=2;
    OriginValue[5]=11;
    OriginValue[6]=5;
    
    [N1 setTitle:([NSString stringWithFormat:@"%i",OriginValue[0]]) forState:UIControlStateNormal];
    [N2 setTitle:([NSString stringWithFormat:@"%i",OriginValue[1]]) forState:UIControlStateNormal];
    [N3 setTitle:([NSString stringWithFormat:@"%i",OriginValue[2]]) forState:UIControlStateNormal];
    [N4 setTitle:([NSString stringWithFormat:@"%i",OriginValue[3]]) forState:UIControlStateNormal];
    [N5 setTitle:([NSString stringWithFormat:@"%i",OriginValue[4]]) forState:UIControlStateNormal];
    [N6 setTitle:([NSString stringWithFormat:@"%i",OriginValue[5]]) forState:UIControlStateNormal];
    [N7 setTitle:([NSString stringWithFormat:@"%i",OriginValue[6]]) forState:UIControlStateNormal];
    Goal.text=@"Find:1-2-3-4-6-7-10";
    Goal.hidden=NO;
    [self Level3Setup];
    CheckLevel=20;
}

-(IBAction)L21Function:(id)sender
{
    [self HidePage];
    [self init_all];
    Find[0]=11;
    Find[1]=2;
    Find[2]=5;
    Find[3]=9;
    Find[4]=3;
    Find[5]=7;
    Find[6]=12;
    OriginValue[0]=17;
    OriginValue[1]=8;
    OriginValue[2]=6;
    OriginValue[3]=10;
    OriginValue[4]=3;
    OriginValue[5]=7;
    OriginValue[6]=15;
    
    [N1 setTitle:([NSString stringWithFormat:@"%i",OriginValue[0]]) forState:UIControlStateNormal];
    [N2 setTitle:([NSString stringWithFormat:@"%i",OriginValue[1]]) forState:UIControlStateNormal];
    [N3 setTitle:([NSString stringWithFormat:@"%i",OriginValue[2]]) forState:UIControlStateNormal];
    [N4 setTitle:([NSString stringWithFormat:@"%i",OriginValue[3]]) forState:UIControlStateNormal];
    [N5 setTitle:([NSString stringWithFormat:@"%i",OriginValue[4]]) forState:UIControlStateNormal];
    [N6 setTitle:([NSString stringWithFormat:@"%i",OriginValue[5]]) forState:UIControlStateNormal];
    [N7 setTitle:([NSString stringWithFormat:@"%i",OriginValue[6]]) forState:UIControlStateNormal];
    Goal.text=@"Find:2-3-5-7-9-11-12";
    Goal.hidden=NO;
    [self Level3Setup];
    CheckLevel=21;
}


-(IBAction)L22Function:(id)sender
{
    [self HidePage];
    [self init_all];
    Find[0]=3;
    Find[1]=6;
    Find[2]=1;
    Find[3]=2;
    Find[4]=7;
    Find[5]=4;
    Find[6]=5;
    OriginValue[0]=9;
    OriginValue[1]=12;
    OriginValue[2]=2;
    OriginValue[3]=3;
    OriginValue[4]=13;
    OriginValue[5]=10;
    OriginValue[6]=5;
    
    [N1 setTitle:([NSString stringWithFormat:@"%i",OriginValue[0]]) forState:UIControlStateNormal];
    [N2 setTitle:([NSString stringWithFormat:@"%i",OriginValue[1]]) forState:UIControlStateNormal];
    [N3 setTitle:([NSString stringWithFormat:@"%i",OriginValue[2]]) forState:UIControlStateNormal];
    [N4 setTitle:([NSString stringWithFormat:@"%i",OriginValue[3]]) forState:UIControlStateNormal];
    [N5 setTitle:([NSString stringWithFormat:@"%i",OriginValue[4]]) forState:UIControlStateNormal];
    [N6 setTitle:([NSString stringWithFormat:@"%i",OriginValue[5]]) forState:UIControlStateNormal];
    [N7 setTitle:([NSString stringWithFormat:@"%i",OriginValue[6]]) forState:UIControlStateNormal];
    Goal.text=@"Find:1-2-3-4-5-6-7";
    Goal.hidden=NO;
    [self Level3Setup];
    CheckLevel=22;
}

-(IBAction)L23Function:(id)sender
{
    [self HidePage];
    [self init_all];
    Find[0]=12;
    Find[1]=14;
    Find[2]=10;
    Find[3]=5;
    Find[4]=2;
    Find[5]=3;
    Find[6]=1;
    OriginValue[0]=13;
    OriginValue[1]=15;
    OriginValue[2]=16;
    OriginValue[3]=11;
    OriginValue[4]=5;
    OriginValue[5]=6;
    OriginValue[6]=4;
    
    [N1 setTitle:([NSString stringWithFormat:@"%i",OriginValue[0]]) forState:UIControlStateNormal];
    [N2 setTitle:([NSString stringWithFormat:@"%i",OriginValue[1]]) forState:UIControlStateNormal];
    [N3 setTitle:([NSString stringWithFormat:@"%i",OriginValue[2]]) forState:UIControlStateNormal];
    [N4 setTitle:([NSString stringWithFormat:@"%i",OriginValue[3]]) forState:UIControlStateNormal];
    [N5 setTitle:([NSString stringWithFormat:@"%i",OriginValue[4]]) forState:UIControlStateNormal];
    [N6 setTitle:([NSString stringWithFormat:@"%i",OriginValue[5]]) forState:UIControlStateNormal];
    [N7 setTitle:([NSString stringWithFormat:@"%i",OriginValue[6]]) forState:UIControlStateNormal];
    Goal.text=@"Find:1-2-3-5-10-12-14";
    Goal.hidden=NO;
    [self Level3Setup];
    CheckLevel=23;
}

-(IBAction)L24Function:(id)sender
{
    [self HidePage];
    [self init_all];
    Find[0]=2;
    Find[1]=4;
    Find[2]=1;
    Find[3]=3;
    Find[4]=10;
    Find[5]=13;
    Find[6]=15;
    OriginValue[0]=5;
    OriginValue[1]=7;
    OriginValue[2]=2;
    OriginValue[3]=4;
    OriginValue[4]=13;
    OriginValue[5]=16;
    OriginValue[6]=25;
    
    [N1 setTitle:([NSString stringWithFormat:@"%i",OriginValue[0]]) forState:UIControlStateNormal];
    [N2 setTitle:([NSString stringWithFormat:@"%i",OriginValue[1]]) forState:UIControlStateNormal];
    [N3 setTitle:([NSString stringWithFormat:@"%i",OriginValue[2]]) forState:UIControlStateNormal];
    [N4 setTitle:([NSString stringWithFormat:@"%i",OriginValue[3]]) forState:UIControlStateNormal];
    [N5 setTitle:([NSString stringWithFormat:@"%i",OriginValue[4]]) forState:UIControlStateNormal];
    [N6 setTitle:([NSString stringWithFormat:@"%i",OriginValue[5]]) forState:UIControlStateNormal];
    [N7 setTitle:([NSString stringWithFormat:@"%i",OriginValue[6]]) forState:UIControlStateNormal];
    Goal.text=@"Find:1-2-3-4-10-13-15";
    Goal.hidden=NO;
    [self Level3Setup];
    CheckLevel=24;
}

-(IBAction)L25Function:(id)sender
{
    [self HidePage];
    [self init_all];
    Find[0]=3;
    Find[1]=8;
    Find[2]=4;
    Find[3]=7;
    Find[4]=6;
    Find[5]=5;
    Find[6]=2;
    OriginValue[0]=9;
    OriginValue[1]=14;
    OriginValue[2]=7;
    OriginValue[3]=17;
    OriginValue[4]=12;
    OriginValue[5]=8;
    OriginValue[6]=3;
    
    [N1 setTitle:([NSString stringWithFormat:@"%i",OriginValue[0]]) forState:UIControlStateNormal];
    [N2 setTitle:([NSString stringWithFormat:@"%i",OriginValue[1]]) forState:UIControlStateNormal];
    [N3 setTitle:([NSString stringWithFormat:@"%i",OriginValue[2]]) forState:UIControlStateNormal];
    [N4 setTitle:([NSString stringWithFormat:@"%i",OriginValue[3]]) forState:UIControlStateNormal];
    [N5 setTitle:([NSString stringWithFormat:@"%i",OriginValue[4]]) forState:UIControlStateNormal];
    [N6 setTitle:([NSString stringWithFormat:@"%i",OriginValue[5]]) forState:UIControlStateNormal];
    [N7 setTitle:([NSString stringWithFormat:@"%i",OriginValue[6]]) forState:UIControlStateNormal];
    Goal.text=@"Find:2-3-4-5-6-7-8";
    Goal.hidden=NO;
    [self Level3Setup];
    CheckLevel=25;
}


-(IBAction)L26Function:(id)sender
{
    [self HidePage];
    [self init_all];
    Find[0]=15;
    Find[1]=10;
    Find[2]=11;
    Find[3]=13;
    Find[4]=17;
    Find[5]=4;
    Find[6]=5;
    OriginValue[0]=25;
    OriginValue[1]=20;
    OriginValue[2]=12;
    OriginValue[3]=14;
    OriginValue[4]=23;
    OriginValue[5]=10;
    OriginValue[6]=8;
    
    [N1 setTitle:([NSString stringWithFormat:@"%i",OriginValue[0]]) forState:UIControlStateNormal];
    [N2 setTitle:([NSString stringWithFormat:@"%i",OriginValue[1]]) forState:UIControlStateNormal];
    [N3 setTitle:([NSString stringWithFormat:@"%i",OriginValue[2]]) forState:UIControlStateNormal];
    [N4 setTitle:([NSString stringWithFormat:@"%i",OriginValue[3]]) forState:UIControlStateNormal];
    [N5 setTitle:([NSString stringWithFormat:@"%i",OriginValue[4]]) forState:UIControlStateNormal];
    [N6 setTitle:([NSString stringWithFormat:@"%i",OriginValue[5]]) forState:UIControlStateNormal];
    [N7 setTitle:([NSString stringWithFormat:@"%i",OriginValue[6]]) forState:UIControlStateNormal];
    Goal.text=@"Find:4-5-10-11-13-15-17";
    Goal.hidden=NO;
    [self Level3Setup];
    CheckLevel=26;
}

-(IBAction)L27Function:(id)sender
{
    [self HidePage];
    [self init_all];
    Find[0]=8;
    Find[1]=3;
    Find[2]=10;
    Find[3]=15;
    Find[4]=5;
    Find[5]=9;
    Find[6]=7;
    OriginValue[0]=14;
    OriginValue[1]=6;
    OriginValue[2]=16;
    OriginValue[3]=18;
    OriginValue[4]=20;
    OriginValue[5]=19;
    OriginValue[6]=8;
    
    [N1 setTitle:([NSString stringWithFormat:@"%i",OriginValue[0]]) forState:UIControlStateNormal];
    [N2 setTitle:([NSString stringWithFormat:@"%i",OriginValue[1]]) forState:UIControlStateNormal];
    [N3 setTitle:([NSString stringWithFormat:@"%i",OriginValue[2]]) forState:UIControlStateNormal];
    [N4 setTitle:([NSString stringWithFormat:@"%i",OriginValue[3]]) forState:UIControlStateNormal];
    [N5 setTitle:([NSString stringWithFormat:@"%i",OriginValue[4]]) forState:UIControlStateNormal];
    [N6 setTitle:([NSString stringWithFormat:@"%i",OriginValue[5]]) forState:UIControlStateNormal];
    [N7 setTitle:([NSString stringWithFormat:@"%i",OriginValue[6]]) forState:UIControlStateNormal];
    Goal.text=@"Find:3-5-7-8-9-10-15";
    Goal.hidden=NO;
    [self Level3Setup];
    CheckLevel=27;
}



-(IBAction)L28Function:(id)sender
{
    [self HidePage];
    [self init_all];
    Find[0]=8;
    Find[1]=5;
    Find[2]=3;
    Find[3]=2;
    Find[4]=10;
    Find[5]=11;
    Find[6]=1;
    Find[7]=12;
    OriginValue[0]=11;
    OriginValue[1]=6;
    OriginValue[2]=4;
    OriginValue[3]=5;
    OriginValue[4]=13;
    OriginValue[5]=12;
    OriginValue[6]=2;
    OriginValue[7]=15;
    
    [N1 setTitle:([NSString stringWithFormat:@"%i",OriginValue[0]]) forState:UIControlStateNormal];
    [N2 setTitle:([NSString stringWithFormat:@"%i",OriginValue[1]]) forState:UIControlStateNormal];
    [N3 setTitle:([NSString stringWithFormat:@"%i",OriginValue[2]]) forState:UIControlStateNormal];
    [N4 setTitle:([NSString stringWithFormat:@"%i",OriginValue[3]]) forState:UIControlStateNormal];
    [N5 setTitle:([NSString stringWithFormat:@"%i",OriginValue[4]]) forState:UIControlStateNormal];
    [N6 setTitle:([NSString stringWithFormat:@"%i",OriginValue[5]]) forState:UIControlStateNormal];
    [N7 setTitle:([NSString stringWithFormat:@"%i",OriginValue[6]]) forState:UIControlStateNormal];
    [N8 setTitle:([NSString stringWithFormat:@"%i",OriginValue[7]]) forState:UIControlStateNormal];
    Goal.text=@"Find:1-2-3-5-8-10-11-12";
    Goal.hidden=NO;
    [self Level4Setup];
    CheckLevel=28;
}

-(IBAction)L29Function:(id)sender
{
    [self HidePage];
    [self init_all];
    Find[0]=12;
    Find[1]=6;
    Find[2]=8;
    Find[3]=4;
    Find[4]=9;
    Find[5]=18;
    Find[6]=10;
    Find[7]=2;
    OriginValue[0]=18;
    OriginValue[1]=7;
    OriginValue[2]=8;
    OriginValue[3]=5;
    OriginValue[4]=15;
    OriginValue[5]=19;
    OriginValue[6]=13;
    OriginValue[7]=3;
    
    [N1 setTitle:([NSString stringWithFormat:@"%i",OriginValue[0]]) forState:UIControlStateNormal];
    [N2 setTitle:([NSString stringWithFormat:@"%i",OriginValue[1]]) forState:UIControlStateNormal];
    [N3 setTitle:([NSString stringWithFormat:@"%i",OriginValue[2]]) forState:UIControlStateNormal];
    [N4 setTitle:([NSString stringWithFormat:@"%i",OriginValue[3]]) forState:UIControlStateNormal];
    [N5 setTitle:([NSString stringWithFormat:@"%i",OriginValue[4]]) forState:UIControlStateNormal];
    [N6 setTitle:([NSString stringWithFormat:@"%i",OriginValue[5]]) forState:UIControlStateNormal];
    [N7 setTitle:([NSString stringWithFormat:@"%i",OriginValue[6]]) forState:UIControlStateNormal];
    [N8 setTitle:([NSString stringWithFormat:@"%i",OriginValue[7]]) forState:UIControlStateNormal];
    Goal.text=@"Find:2-4-6-8-9-10-12-18";
    Goal.hidden=NO;
    [self Level4Setup];
    CheckLevel=29;
}

-(IBAction)L30Function:(id)sender
{
    [self HidePage];
    [self init_all];
    Find[0]=7;
    Find[1]=9;
    Find[2]=13;
    Find[3]=4;
    Find[4]=8;
    Find[5]=5;
    Find[6]=1;
    Find[7]=2;
    OriginValue[0]=13;
    OriginValue[1]=12;
    OriginValue[2]=14;
    OriginValue[3]=5;
    OriginValue[4]=11;
    OriginValue[5]=6;
    OriginValue[6]=2;
    OriginValue[7]=3;
    
    [N1 setTitle:([NSString stringWithFormat:@"%i",OriginValue[0]]) forState:UIControlStateNormal];
    [N2 setTitle:([NSString stringWithFormat:@"%i",OriginValue[1]]) forState:UIControlStateNormal];
    [N3 setTitle:([NSString stringWithFormat:@"%i",OriginValue[2]]) forState:UIControlStateNormal];
    [N4 setTitle:([NSString stringWithFormat:@"%i",OriginValue[3]]) forState:UIControlStateNormal];
    [N5 setTitle:([NSString stringWithFormat:@"%i",OriginValue[4]]) forState:UIControlStateNormal];
    [N6 setTitle:([NSString stringWithFormat:@"%i",OriginValue[5]]) forState:UIControlStateNormal];
    [N7 setTitle:([NSString stringWithFormat:@"%i",OriginValue[6]]) forState:UIControlStateNormal];
    [N8 setTitle:([NSString stringWithFormat:@"%i",OriginValue[7]]) forState:UIControlStateNormal];
    Goal.text=@"Find:1-2-4-5-7-8-9-13";
    Goal.hidden=NO;
    [self Level4Setup];
    CheckLevel=30;
}

-(IBAction)L31Function:(id)sender
{
    [self HidePage];
    [self init_all];
    Find[0]=1;
    Find[1]=2;
    Find[2]=8;
    Find[3]=6;
    Find[4]=17;
    Find[5]=15;
    Find[6]=5;
    Find[7]=7;
    OriginValue[0]=4;
    OriginValue[1]=5;
    OriginValue[2]=9;
    OriginValue[3]=7;
    OriginValue[4]=18;
    OriginValue[5]=16;
    OriginValue[6]=11;
    OriginValue[7]=13;
    
    [N1 setTitle:([NSString stringWithFormat:@"%i",OriginValue[0]]) forState:UIControlStateNormal];
    [N2 setTitle:([NSString stringWithFormat:@"%i",OriginValue[1]]) forState:UIControlStateNormal];
    [N3 setTitle:([NSString stringWithFormat:@"%i",OriginValue[2]]) forState:UIControlStateNormal];
    [N4 setTitle:([NSString stringWithFormat:@"%i",OriginValue[3]]) forState:UIControlStateNormal];
    [N5 setTitle:([NSString stringWithFormat:@"%i",OriginValue[4]]) forState:UIControlStateNormal];
    [N6 setTitle:([NSString stringWithFormat:@"%i",OriginValue[5]]) forState:UIControlStateNormal];
    [N7 setTitle:([NSString stringWithFormat:@"%i",OriginValue[6]]) forState:UIControlStateNormal];
    [N8 setTitle:([NSString stringWithFormat:@"%i",OriginValue[7]]) forState:UIControlStateNormal];
    Goal.text=@"Find:1-2-5-6-7-8-15-17";
    Goal.hidden=NO;
    [self Level4Setup];
    CheckLevel=31;
}

-(IBAction)L32Function:(id)sender
{
    [self HidePage];
    [self init_all];
    Find[0]=14;
    Find[1]=5;
    Find[2]=6;
    Find[3]=9;
    Find[4]=13;
    Find[5]=8;
    Find[6]=3;
    Find[7]=2;
    OriginValue[0]=17;
    OriginValue[1]=5;
    OriginValue[2]=7;
    OriginValue[3]=15;
    OriginValue[4]=16;
    OriginValue[5]=11;
    OriginValue[6]=4;
    OriginValue[7]=3;
    
    [N1 setTitle:([NSString stringWithFormat:@"%i",OriginValue[0]]) forState:UIControlStateNormal];
    [N2 setTitle:([NSString stringWithFormat:@"%i",OriginValue[1]]) forState:UIControlStateNormal];
    [N3 setTitle:([NSString stringWithFormat:@"%i",OriginValue[2]]) forState:UIControlStateNormal];
    [N4 setTitle:([NSString stringWithFormat:@"%i",OriginValue[3]]) forState:UIControlStateNormal];
    [N5 setTitle:([NSString stringWithFormat:@"%i",OriginValue[4]]) forState:UIControlStateNormal];
    [N6 setTitle:([NSString stringWithFormat:@"%i",OriginValue[5]]) forState:UIControlStateNormal];
    [N7 setTitle:([NSString stringWithFormat:@"%i",OriginValue[6]]) forState:UIControlStateNormal];
    [N8 setTitle:([NSString stringWithFormat:@"%i",OriginValue[7]]) forState:UIControlStateNormal];
    Goal.text=@"Find:2-3-5-6-8-9-13-14";
    Goal.hidden=NO;
    [self Level4Setup];
    CheckLevel=32;
}

-(IBAction)L33Function:(id)sender
{
    [self HidePage];
    [self init_all];
    Find[0]=8;
    Find[1]=6;
    Find[2]=7;
    Find[3]=11;
    Find[4]=9;
    Find[5]=13;
    Find[6]=16;
    Find[7]=15;
    OriginValue[0]=11;
    OriginValue[1]=12;
    OriginValue[2]=13;
    OriginValue[3]=14;
    OriginValue[4]=15;
    OriginValue[5]=16;
    OriginValue[6]=17;
    OriginValue[7]=18;
    
    [N1 setTitle:([NSString stringWithFormat:@"%i",OriginValue[0]]) forState:UIControlStateNormal];
    [N2 setTitle:([NSString stringWithFormat:@"%i",OriginValue[1]]) forState:UIControlStateNormal];
    [N3 setTitle:([NSString stringWithFormat:@"%i",OriginValue[2]]) forState:UIControlStateNormal];
    [N4 setTitle:([NSString stringWithFormat:@"%i",OriginValue[3]]) forState:UIControlStateNormal];
    [N5 setTitle:([NSString stringWithFormat:@"%i",OriginValue[4]]) forState:UIControlStateNormal];
    [N6 setTitle:([NSString stringWithFormat:@"%i",OriginValue[5]]) forState:UIControlStateNormal];
    [N7 setTitle:([NSString stringWithFormat:@"%i",OriginValue[6]]) forState:UIControlStateNormal];
    [N8 setTitle:([NSString stringWithFormat:@"%i",OriginValue[7]]) forState:UIControlStateNormal];
    Goal.text=@"Find:6-7-8-9-11-13-15-16";
    Goal.hidden=NO;
    [self Level4Setup];
    CheckLevel=33;
}

-(IBAction)L34Function:(id)sender
{
    [self HidePage];
    [self init_all];
    Find[0]=10;
    Find[1]=14;
    Find[2]=17;
    Find[3]=2;
    Find[4]=4;
    Find[5]=1;
    Find[6]=6;
    Find[7]=11;
    OriginValue[0]=11;
    OriginValue[1]=15;
    OriginValue[2]=20;
    OriginValue[3]=5;
    OriginValue[4]=7;
    OriginValue[5]=4;
    OriginValue[6]=12;
    OriginValue[7]=17;
    
    [N1 setTitle:([NSString stringWithFormat:@"%i",OriginValue[0]]) forState:UIControlStateNormal];
    [N2 setTitle:([NSString stringWithFormat:@"%i",OriginValue[1]]) forState:UIControlStateNormal];
    [N3 setTitle:([NSString stringWithFormat:@"%i",OriginValue[2]]) forState:UIControlStateNormal];
    [N4 setTitle:([NSString stringWithFormat:@"%i",OriginValue[3]]) forState:UIControlStateNormal];
    [N5 setTitle:([NSString stringWithFormat:@"%i",OriginValue[4]]) forState:UIControlStateNormal];
    [N6 setTitle:([NSString stringWithFormat:@"%i",OriginValue[5]]) forState:UIControlStateNormal];
    [N7 setTitle:([NSString stringWithFormat:@"%i",OriginValue[6]]) forState:UIControlStateNormal];
    [N8 setTitle:([NSString stringWithFormat:@"%i",OriginValue[7]]) forState:UIControlStateNormal];
    Goal.text=@"Find:1-2-4-6-10-11-14-17";
    Goal.hidden=NO;
    [self Level4Setup];
    CheckLevel=34;
}

-(IBAction)L35Function:(id)sender
{
    [self HidePage];
    [self init_all];
    Find[0]=7;
    Find[1]=17;
    Find[2]=3;
    Find[3]=2;
    Find[4]=12;
    Find[5]=10;
    Find[6]=9;
    Find[7]=5;
    OriginValue[0]=7;
    OriginValue[1]=17;
    OriginValue[2]=9;
    OriginValue[3]=8;
    OriginValue[4]=15;
    OriginValue[5]=13;
    OriginValue[6]=10;
    OriginValue[7]=6;
    
    [N1 setTitle:([NSString stringWithFormat:@"%i",OriginValue[0]]) forState:UIControlStateNormal];
    [N2 setTitle:([NSString stringWithFormat:@"%i",OriginValue[1]]) forState:UIControlStateNormal];
    [N3 setTitle:([NSString stringWithFormat:@"%i",OriginValue[2]]) forState:UIControlStateNormal];
    [N4 setTitle:([NSString stringWithFormat:@"%i",OriginValue[3]]) forState:UIControlStateNormal];
    [N5 setTitle:([NSString stringWithFormat:@"%i",OriginValue[4]]) forState:UIControlStateNormal];
    [N6 setTitle:([NSString stringWithFormat:@"%i",OriginValue[5]]) forState:UIControlStateNormal];
    [N7 setTitle:([NSString stringWithFormat:@"%i",OriginValue[6]]) forState:UIControlStateNormal];
    [N8 setTitle:([NSString stringWithFormat:@"%i",OriginValue[7]]) forState:UIControlStateNormal];
    Goal.text=@"Find:2-3-5-7-9-10-12-17";
    Goal.hidden=NO;
    [self Level4Setup];
    CheckLevel=35;
}

-(IBAction)L36Function:(id)sender
{
    [self HidePage];
    [self init_all];
    Find[0]=10;
    Find[1]=7;
    Find[2]=8;
    Find[3]=14;
    Find[4]=12;
    Find[5]=11;
    Find[6]=2;
    Find[7]=3;
    OriginValue[0]=16;
    OriginValue[1]=13;
    OriginValue[2]=9;
    OriginValue[3]=15;
    OriginValue[4]=18;
    OriginValue[5]=17;
    OriginValue[6]=5;
    OriginValue[7]=6;
    
    [N1 setTitle:([NSString stringWithFormat:@"%i",OriginValue[0]]) forState:UIControlStateNormal];
    [N2 setTitle:([NSString stringWithFormat:@"%i",OriginValue[1]]) forState:UIControlStateNormal];
    [N3 setTitle:([NSString stringWithFormat:@"%i",OriginValue[2]]) forState:UIControlStateNormal];
    [N4 setTitle:([NSString stringWithFormat:@"%i",OriginValue[3]]) forState:UIControlStateNormal];
    [N5 setTitle:([NSString stringWithFormat:@"%i",OriginValue[4]]) forState:UIControlStateNormal];
    [N6 setTitle:([NSString stringWithFormat:@"%i",OriginValue[5]]) forState:UIControlStateNormal];
    [N7 setTitle:([NSString stringWithFormat:@"%i",OriginValue[6]]) forState:UIControlStateNormal];
    [N8 setTitle:([NSString stringWithFormat:@"%i",OriginValue[7]]) forState:UIControlStateNormal];
    Goal.text=@"Find:2-3-7-8-10-11-12-14";
    Goal.hidden=NO;
    [self Level4Setup];
    CheckLevel=36;
}

-(IBAction)L37Function:(id)sender
{
    [self HidePage];
    [self init_all];
    Find[0]=7;
    Find[1]=9;
    Find[2]=14;
    Find[3]=11;
    Find[4]=6;
    Find[5]=10;
    Find[6]=2;
    Find[7]=5;
    OriginValue[0]=8;
    OriginValue[1]=12;
    OriginValue[2]=15;
    OriginValue[3]=14;
    OriginValue[4]=16;
    OriginValue[5]=20;
    OriginValue[6]=3;
    OriginValue[7]=6;
    
    [N1 setTitle:([NSString stringWithFormat:@"%i",OriginValue[0]]) forState:UIControlStateNormal];
    [N2 setTitle:([NSString stringWithFormat:@"%i",OriginValue[1]]) forState:UIControlStateNormal];
    [N3 setTitle:([NSString stringWithFormat:@"%i",OriginValue[2]]) forState:UIControlStateNormal];
    [N4 setTitle:([NSString stringWithFormat:@"%i",OriginValue[3]]) forState:UIControlStateNormal];
    [N5 setTitle:([NSString stringWithFormat:@"%i",OriginValue[4]]) forState:UIControlStateNormal];
    [N6 setTitle:([NSString stringWithFormat:@"%i",OriginValue[5]]) forState:UIControlStateNormal];
    [N7 setTitle:([NSString stringWithFormat:@"%i",OriginValue[6]]) forState:UIControlStateNormal];
    [N8 setTitle:([NSString stringWithFormat:@"%i",OriginValue[7]]) forState:UIControlStateNormal];
    Goal.text=@"Find:2-5-6-7-9-10-11-14";
    Goal.hidden=NO;
    [self Level4Setup];
    CheckLevel=37;
}

-(IBAction)L38Function:(id)sender
{
    [self HidePage];
    [self init_all];
    Find[0]=7;
    Find[1]=8;
    Find[2]=6;
    Find[3]=5;
    Find[4]=1;
    Find[5]=2;
    Find[6]=3;
    Find[7]=4;
    OriginValue[0]=13;
    OriginValue[1]=14;
    OriginValue[2]=12;
    OriginValue[3]=11;
    OriginValue[4]=4;
    OriginValue[5]=5;
    OriginValue[6]=9;
    OriginValue[7]=10;
    
    [N1 setTitle:([NSString stringWithFormat:@"%i",OriginValue[0]]) forState:UIControlStateNormal];
    [N2 setTitle:([NSString stringWithFormat:@"%i",OriginValue[1]]) forState:UIControlStateNormal];
    [N3 setTitle:([NSString stringWithFormat:@"%i",OriginValue[2]]) forState:UIControlStateNormal];
    [N4 setTitle:([NSString stringWithFormat:@"%i",OriginValue[3]]) forState:UIControlStateNormal];
    [N5 setTitle:([NSString stringWithFormat:@"%i",OriginValue[4]]) forState:UIControlStateNormal];
    [N6 setTitle:([NSString stringWithFormat:@"%i",OriginValue[5]]) forState:UIControlStateNormal];
    [N7 setTitle:([NSString stringWithFormat:@"%i",OriginValue[6]]) forState:UIControlStateNormal];
    [N8 setTitle:([NSString stringWithFormat:@"%i",OriginValue[7]]) forState:UIControlStateNormal];
    Goal.text=@"Find:1-2-3-4-5-6-7-8";
    Goal.hidden=NO;
    [self Level4Setup];
    CheckLevel=38;
}

-(IBAction)L39Function:(id)sender
{
    [self HidePage];
    [self init_all];
    Find[0]=15;
    Find[1]=12;
    Find[2]=9;
    Find[3]=11;
    Find[4]=7;
    Find[5]=3;
    Find[6]=5;
    Find[7]=10;
    OriginValue[0]=21;
    OriginValue[1]=18;
    OriginValue[2]=12;
    OriginValue[3]=14;
    OriginValue[4]=8;
    OriginValue[5]=4;
    OriginValue[6]=20;
    OriginValue[7]=25;
    
    [N1 setTitle:([NSString stringWithFormat:@"%i",OriginValue[0]]) forState:UIControlStateNormal];
    [N2 setTitle:([NSString stringWithFormat:@"%i",OriginValue[1]]) forState:UIControlStateNormal];
    [N3 setTitle:([NSString stringWithFormat:@"%i",OriginValue[2]]) forState:UIControlStateNormal];
    [N4 setTitle:([NSString stringWithFormat:@"%i",OriginValue[3]]) forState:UIControlStateNormal];
    [N5 setTitle:([NSString stringWithFormat:@"%i",OriginValue[4]]) forState:UIControlStateNormal];
    [N6 setTitle:([NSString stringWithFormat:@"%i",OriginValue[5]]) forState:UIControlStateNormal];
    [N7 setTitle:([NSString stringWithFormat:@"%i",OriginValue[6]]) forState:UIControlStateNormal];
    [N8 setTitle:([NSString stringWithFormat:@"%i",OriginValue[7]]) forState:UIControlStateNormal];
    Goal.text=@"Find:3-5-7-9-10-11-12-15";
    Goal.hidden=NO;
    [self Level4Setup];
    CheckLevel=39;
}

-(IBAction)L40Function:(id)sender
{
    [self HidePage];
    [self init_all];
    Find[0]=14;
    Find[1]=7;
    Find[2]=17;
    Find[3]=22;
    Find[4]=23;
    Find[5]=13;
    Find[6]=15;
    Find[7]=20;
    OriginValue[0]=17;
    OriginValue[1]=13;
    OriginValue[2]=27;
    OriginValue[3]=28;
    OriginValue[4]=24;
    OriginValue[5]=16;
    OriginValue[6]=30;
    OriginValue[7]=20;
    
    [N1 setTitle:([NSString stringWithFormat:@"%i",OriginValue[0]]) forState:UIControlStateNormal];
    [N2 setTitle:([NSString stringWithFormat:@"%i",OriginValue[1]]) forState:UIControlStateNormal];
    [N3 setTitle:([NSString stringWithFormat:@"%i",OriginValue[2]]) forState:UIControlStateNormal];
    [N4 setTitle:([NSString stringWithFormat:@"%i",OriginValue[3]]) forState:UIControlStateNormal];
    [N5 setTitle:([NSString stringWithFormat:@"%i",OriginValue[4]]) forState:UIControlStateNormal];
    [N6 setTitle:([NSString stringWithFormat:@"%i",OriginValue[5]]) forState:UIControlStateNormal];
    [N7 setTitle:([NSString stringWithFormat:@"%i",OriginValue[6]]) forState:UIControlStateNormal];
    [N8 setTitle:([NSString stringWithFormat:@"%i",OriginValue[7]]) forState:UIControlStateNormal];
    Goal.text=@"Find:7-13-14-15-17-20-22-23";
    Goal.hidden=NO;
    [self Level4Setup];
    CheckLevel=40;
}

-(IBAction)L41Function:(id)sender
{
    [self HidePage];
    [self init_all];
    Find[0]=9;
    Find[1]=15;
    Find[2]=6;
    Find[3]=7;
    Find[4]=2;
    Find[5]=13;
    Find[6]=12;
    Find[7]=11;
    OriginValue[0]=19;
    OriginValue[1]=16;
    OriginValue[2]=9;
    OriginValue[3]=22;
    OriginValue[4]=5;
    OriginValue[5]=23;
    OriginValue[6]=18;
    OriginValue[7]=12;
    
    [N1 setTitle:([NSString stringWithFormat:@"%i",OriginValue[0]]) forState:UIControlStateNormal];
    [N2 setTitle:([NSString stringWithFormat:@"%i",OriginValue[1]]) forState:UIControlStateNormal];
    [N3 setTitle:([NSString stringWithFormat:@"%i",OriginValue[2]]) forState:UIControlStateNormal];
    [N4 setTitle:([NSString stringWithFormat:@"%i",OriginValue[3]]) forState:UIControlStateNormal];
    [N5 setTitle:([NSString stringWithFormat:@"%i",OriginValue[4]]) forState:UIControlStateNormal];
    [N6 setTitle:([NSString stringWithFormat:@"%i",OriginValue[5]]) forState:UIControlStateNormal];
    [N7 setTitle:([NSString stringWithFormat:@"%i",OriginValue[6]]) forState:UIControlStateNormal];
    [N8 setTitle:([NSString stringWithFormat:@"%i",OriginValue[7]]) forState:UIControlStateNormal];
    Goal.text=@"Find:2-6-7-9-11-12-13-15";
    Goal.hidden=NO;
    [self Level4Setup];
    CheckLevel=41;
}

-(IBAction)L42Function:(id)sender
{
    [self HidePage];
    [self init_all];
    Find[0]=15;
    Find[1]=14;
    Find[2]=12;
    Find[3]=16;
    Find[4]=24;
    Find[5]=11;
    Find[6]=10;
    Find[7]=13;
    OriginValue[0]=21;
    OriginValue[1]=24;
    OriginValue[2]=27;
    OriginValue[3]=31;
    OriginValue[4]=25;
    OriginValue[5]=14;
    OriginValue[6]=11;
    OriginValue[7]=19;
    
    [N1 setTitle:([NSString stringWithFormat:@"%i",OriginValue[0]]) forState:UIControlStateNormal];
    [N2 setTitle:([NSString stringWithFormat:@"%i",OriginValue[1]]) forState:UIControlStateNormal];
    [N3 setTitle:([NSString stringWithFormat:@"%i",OriginValue[2]]) forState:UIControlStateNormal];
    [N4 setTitle:([NSString stringWithFormat:@"%i",OriginValue[3]]) forState:UIControlStateNormal];
    [N5 setTitle:([NSString stringWithFormat:@"%i",OriginValue[4]]) forState:UIControlStateNormal];
    [N6 setTitle:([NSString stringWithFormat:@"%i",OriginValue[5]]) forState:UIControlStateNormal];
    [N7 setTitle:([NSString stringWithFormat:@"%i",OriginValue[6]]) forState:UIControlStateNormal];
    [N8 setTitle:([NSString stringWithFormat:@"%i",OriginValue[7]]) forState:UIControlStateNormal];
    Goal.text=@"Find:10-11-12-13-14-15-16-24";
    Goal.hidden=NO;
    [self Level4Setup];
    CheckLevel=42;
}

-(IBAction)L43Function:(id)sender
{
    [self HidePage];
    [self init_all];
    Find[0]=19;
    Find[1]=23;
    Find[2]=21;
    Find[3]=26;
    Find[4]=10;
    Find[5]=30;
    Find[6]=15;
    Find[7]=12;
    OriginValue[0]=20;
    OriginValue[1]=33;
    OriginValue[2]=24;
    OriginValue[3]=29;
    OriginValue[4]=25;
    OriginValue[5]=36;
    OriginValue[6]=15;
    OriginValue[7]=13;
    
    [N1 setTitle:([NSString stringWithFormat:@"%i",OriginValue[0]]) forState:UIControlStateNormal];
    [N2 setTitle:([NSString stringWithFormat:@"%i",OriginValue[1]]) forState:UIControlStateNormal];
    [N3 setTitle:([NSString stringWithFormat:@"%i",OriginValue[2]]) forState:UIControlStateNormal];
    [N4 setTitle:([NSString stringWithFormat:@"%i",OriginValue[3]]) forState:UIControlStateNormal];
    [N5 setTitle:([NSString stringWithFormat:@"%i",OriginValue[4]]) forState:UIControlStateNormal];
    [N6 setTitle:([NSString stringWithFormat:@"%i",OriginValue[5]]) forState:UIControlStateNormal];
    [N7 setTitle:([NSString stringWithFormat:@"%i",OriginValue[6]]) forState:UIControlStateNormal];
    [N8 setTitle:([NSString stringWithFormat:@"%i",OriginValue[7]]) forState:UIControlStateNormal];
    Goal.text=@"Find:10-12-15-19-21-23-26-30";
    Goal.hidden=NO;
    [self Level4Setup];
    CheckLevel=43;
}

-(IBAction)L44Function:(id)sender
{
    [self HidePage];
    [self init_all];
    Find[0]=90;
    Find[1]=84;
    Find[2]=78;
    Find[3]=83;
    Find[4]=94;
    Find[5]=81;
    Find[6]=89;
    Find[7]=95;
    OriginValue[0]=100;
    OriginValue[1]=99;
    OriginValue[2]=88;
    OriginValue[3]=89;
    OriginValue[4]=97;
    OriginValue[5]=87;
    OriginValue[6]=95;
    OriginValue[7]=98;
    
    [N1 setTitle:([NSString stringWithFormat:@"%i",OriginValue[0]]) forState:UIControlStateNormal];
    [N2 setTitle:([NSString stringWithFormat:@"%i",OriginValue[1]]) forState:UIControlStateNormal];
    [N3 setTitle:([NSString stringWithFormat:@"%i",OriginValue[2]]) forState:UIControlStateNormal];
    [N4 setTitle:([NSString stringWithFormat:@"%i",OriginValue[3]]) forState:UIControlStateNormal];
    [N5 setTitle:([NSString stringWithFormat:@"%i",OriginValue[4]]) forState:UIControlStateNormal];
    [N6 setTitle:([NSString stringWithFormat:@"%i",OriginValue[5]]) forState:UIControlStateNormal];
    [N7 setTitle:([NSString stringWithFormat:@"%i",OriginValue[6]]) forState:UIControlStateNormal];
    [N8 setTitle:([NSString stringWithFormat:@"%i",OriginValue[7]]) forState:UIControlStateNormal];
    Goal.text=@"Find:78-81-83-84-89-90-94-95";
    Goal.hidden=NO;
    [self Level4Setup];
    CheckLevel=44;
}

-(IBAction)L45Function:(id)sender
{
    [self HidePage];
    [self init_all];
    Find[0]=1;
    Find[1]=2;
    Find[2]=3;
    Find[3]=4;
    Find[4]=5;
    Find[5]=6;
    Find[6]=7;
    Find[7]=8;
    OriginValue[0]=29;
    OriginValue[1]=30;
    OriginValue[2]=31;
    OriginValue[3]=32;
    OriginValue[4]=33;
    OriginValue[5]=34;
    OriginValue[6]=35;
    OriginValue[7]=36;
    
    [N1 setTitle:([NSString stringWithFormat:@"%i",OriginValue[0]]) forState:UIControlStateNormal];
    [N2 setTitle:([NSString stringWithFormat:@"%i",OriginValue[1]]) forState:UIControlStateNormal];
    [N3 setTitle:([NSString stringWithFormat:@"%i",OriginValue[2]]) forState:UIControlStateNormal];
    [N4 setTitle:([NSString stringWithFormat:@"%i",OriginValue[3]]) forState:UIControlStateNormal];
    [N5 setTitle:([NSString stringWithFormat:@"%i",OriginValue[4]]) forState:UIControlStateNormal];
    [N6 setTitle:([NSString stringWithFormat:@"%i",OriginValue[5]]) forState:UIControlStateNormal];
    [N7 setTitle:([NSString stringWithFormat:@"%i",OriginValue[6]]) forState:UIControlStateNormal];
    [N8 setTitle:([NSString stringWithFormat:@"%i",OriginValue[7]]) forState:UIControlStateNormal];
    Goal.text=@"Find:1-2-3-4-5-6-7-8";
    Goal.hidden=NO;
    [self Level4Setup];
    CheckLevel=0;
}


-(void)HidePage
{
    Level1.hidden=YES;
    Level2.hidden=YES;
    Level3.hidden=YES;
    Level4.hidden=YES;
    Level5.hidden=YES;
    Tutorial.hidden=YES;
    LVBG.hidden=YES;
    L1.hidden=YES;
    L2.hidden=YES;
    L3.hidden=YES;
    L4.hidden=YES;
    L5.hidden=YES;
    L6.hidden=YES;
    L7.hidden=YES;
    L8.hidden=YES;
    L9.hidden=YES;
    LevelBG.hidden=YES;
}


-(void)MainPage
{
    BG.hidden=NO;
    OKButton.hidden=YES;
    RuleContent.hidden=YES;
    Easy.hidden=YES;
    Coming.hidden=YES;
    SettingView.hidden=YES;
    Level1.hidden=YES;
    Level2.hidden=YES;
    Level3.hidden=YES;
    Level4.hidden=YES;
    Level5.hidden=YES;
    Tutorial.hidden=YES;
    LVBG.hidden=YES;
    
    for (int i=0; i<AllLevel; i++) {
        [buttonArray[i] setHidden:YES];
    }
    
    [N1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [N2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [N3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [N4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [N5 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [N6 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [N7 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [N8 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    N1.hidden=YES;
    N2.hidden=YES;
    N3.hidden=YES;
    N4.hidden=YES;
    N5.hidden=YES;
    N6.hidden=YES;
    N7.hidden=YES;
    N8.hidden=YES;
    
    Goal.hidden=YES;
    LevelBG.hidden=YES;
    StartGame.hidden=NO;
    Setting.hidden=NO;
    Rule.hidden=NO;
    Back.hidden=YES;
    L1Setup.hidden=YES;
    Conitune.hidden=YES;
    
}

-(void)LevelPage
{
    BG.hidden=YES;
    LVBG.hidden=NO;
    Level1.hidden=NO;
    Level2.hidden=NO;
    Level3.hidden=NO;
    Level4.hidden=NO;
    Level5.hidden=NO;
    [Level1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [Level2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [Level3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [Level4 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [Level5 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    Tutorial.hidden=NO;
    Conitune.hidden=YES;
    
    for (int i=0; i<9; i++) {
        [buttonArray[i] setHidden:YES];
    }
    
    
    if(Level==1 && CurrentLevel<=9)
    {
        for(int i=0; i<CurrentLevel; i++)
        {
            [buttonArray[i] setHidden:NO];
        }
        [Level1 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    }
    
    else if (Level==1 && CurrentLevel>9)
    {
        for (int i=0; i<9; i++) {
            [buttonArray[i] setHidden:NO];
        }
        [Level1 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    }
    
    else if (CurrentLevel>9 && CurrentLevel<=18 && Level==2)
    {
        for(int i=0; i<CurrentLevel-9; i++)
        {
            [buttonArray[i] setHidden:NO];
        }
        [Level2 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    }
    
    else if (CurrentLevel>18 && Level==2)
    {
        for (int i=0; i<9; i++) {
            [buttonArray[i] setHidden:NO];
        }
        [Level2 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    }
    
    else if (CurrentLevel>18 && CurrentLevel<=27 && Level==3)
    {
        for (int i=0; i<CurrentLevel-18; i++) {
            [buttonArray[i] setHidden:NO];
        }
        [Level3 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    }
    else if (CurrentLevel>27 && Level==3)
    {
        for (int i=0; i<9; i++) {
            [buttonArray[i] setHidden:NO];
        }
        [Level3 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    }
    else if (CurrentLevel>27 &&CurrentLevel<=36 && Level==4)
    {
        for (int i=0; i<CurrentLevel-27; i++) {
            [buttonArray[i] setHidden:NO];
        }
        [Level4 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    }
    else if (CurrentLevel>36 && Level==4)
    {
        for (int i=0; i<9; i++) {
            [buttonArray[i] setHidden:NO];
        }
        [Level4 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    }
    else if (CurrentLevel>36 &&CurrentLevel<=45 && Level==5)
    {
        for (int i=0; i<CurrentLevel-36; i++) {
            [buttonArray[i] setHidden:NO];
        }
        [Level5 setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    }

    
        
    L1Setup.hidden=YES;
  
    N1.hidden=YES;
    N2.hidden=YES;
    N3.hidden=YES;
    N4.hidden=YES;
    N5.hidden=YES;
    N6.hidden=YES;
    N7.hidden=YES;
    N8.hidden=YES;
    Goal.hidden=YES;
    LevelBG.hidden=NO;
    StartGame.hidden=YES;
    Setting.hidden=YES;
    Rule.hidden=YES;
    Back.hidden=NO;
    [self LevelSelect];
    [shapeLayer removeFromSuperlayer];
}

-(void)AddButtons
{
    [buttonArray addObject:L1];
    [buttonArray addObject:L2];
    [buttonArray addObject:L3];
    [buttonArray addObject:L4];
    [buttonArray addObject:L5];
    [buttonArray addObject:L6];
    [buttonArray addObject:L7];
    [buttonArray addObject:L8];
    [buttonArray addObject:L9];

}

-(void)LevelSelect
{
    if(Level==1)
    {
        for (int i=0; i<9; i++) {
            int a=i+1;
            [buttonArray[i] setTitle:([NSString stringWithFormat:@"%i", a]) forState:UIControlStateNormal];
        }
        
        [L1 addTarget:self
               action:@selector(L1Function:)
     forControlEvents:UIControlEventTouchUpInside];
        
        [L2 addTarget:self
               action:@selector(L2Function:)
     forControlEvents:UIControlEventTouchUpInside];
        
        [L3 addTarget:self
               action:@selector(L3Function:)
     forControlEvents:UIControlEventTouchUpInside];
        
        [L4 addTarget:self
               action:@selector(L4Function:)
     forControlEvents:UIControlEventTouchUpInside];
        
        [L5 addTarget:self
               action:@selector(L5Function:)
     forControlEvents:UIControlEventTouchUpInside];
        
        [L6 addTarget:self
               action:@selector(L6Function:)
     forControlEvents:UIControlEventTouchUpInside];
        
        [L7 addTarget:self
               action:@selector(L7Function:)
     forControlEvents:UIControlEventTouchUpInside];
        
        [L8 addTarget:self
               action:@selector(L8Function:)
     forControlEvents:UIControlEventTouchUpInside];
        
        [L9 addTarget:self
               action:@selector(L9Function:)
     forControlEvents:UIControlEventTouchUpInside];
    }
    
    else if (Level==2)
    {
        for (int i=0; i<9; i++) {
            int a=i+10;
            [buttonArray[i] setTitle:([NSString stringWithFormat:@"%i", a]) forState:UIControlStateNormal];
        }
        
        [L1 addTarget:self
               action:@selector(L10Function:)
     forControlEvents:UIControlEventTouchUpInside];
        
        [L2 addTarget:self
               action:@selector(L11Function:)
     forControlEvents:UIControlEventTouchUpInside];
        
        [L3 addTarget:self
               action:@selector(L12Function:)
     forControlEvents:UIControlEventTouchUpInside];
        
        [L4 addTarget:self
               action:@selector(L13Function:)
     forControlEvents:UIControlEventTouchUpInside];
        
        [L5 addTarget:self
               action:@selector(L14Function:)
     forControlEvents:UIControlEventTouchUpInside];
        
        [L6 addTarget:self
               action:@selector(L15Function:)
     forControlEvents:UIControlEventTouchUpInside];
        
        [L7 addTarget:self
               action:@selector(L16Function:)
     forControlEvents:UIControlEventTouchUpInside];
        
        [L8 addTarget:self
               action:@selector(L17Function:)
     forControlEvents:UIControlEventTouchUpInside];
        
        [L9 addTarget:self
               action:@selector(L18Function:)
     forControlEvents:UIControlEventTouchUpInside];
    }
    
    else if (Level==3)
    {
        for (int i=0; i<9; i++) {
            int a=i+19;
            [buttonArray[i] setTitle:([NSString stringWithFormat:@"%i", a]) forState:UIControlStateNormal];
        }
        
        [L1 addTarget:self
               action:@selector(L19Function:)
     forControlEvents:UIControlEventTouchUpInside];
        
        [L2 addTarget:self
               action:@selector(L20Function:)
     forControlEvents:UIControlEventTouchUpInside];
        
        [L3 addTarget:self
               action:@selector(L21Function:)
     forControlEvents:UIControlEventTouchUpInside];
        
        [L4 addTarget:self
               action:@selector(L22Function:)
     forControlEvents:UIControlEventTouchUpInside];
        
        [L5 addTarget:self
               action:@selector(L23Function:)
     forControlEvents:UIControlEventTouchUpInside];
        
        [L6 addTarget:self
               action:@selector(L24Function:)
     forControlEvents:UIControlEventTouchUpInside];
        
        [L7 addTarget:self
               action:@selector(L25Function:)
     forControlEvents:UIControlEventTouchUpInside];
        
        [L8 addTarget:self
               action:@selector(L26Function:)
     forControlEvents:UIControlEventTouchUpInside];
        
        [L9 addTarget:self
               action:@selector(L27Function:)
     forControlEvents:UIControlEventTouchUpInside];
    }
    else if (Level==4)
    {
        for (int i=0; i<9; i++) {
            int a=i+28;
            [buttonArray[i] setTitle:([NSString stringWithFormat:@"%i", a]) forState:UIControlStateNormal];
        }
        
        [L1 addTarget:self
               action:@selector(L28Function:)
     forControlEvents:UIControlEventTouchUpInside];
        
        [L2 addTarget:self
               action:@selector(L29Function:)
     forControlEvents:UIControlEventTouchUpInside];
        
        [L3 addTarget:self
               action:@selector(L30Function:)
     forControlEvents:UIControlEventTouchUpInside];
        
        [L4 addTarget:self
               action:@selector(L31Function:)
     forControlEvents:UIControlEventTouchUpInside];
        
        [L5 addTarget:self
               action:@selector(L32Function:)
     forControlEvents:UIControlEventTouchUpInside];
        
        [L6 addTarget:self
               action:@selector(L33Function:)
     forControlEvents:UIControlEventTouchUpInside];
        
        [L7 addTarget:self
               action:@selector(L34Function:)
     forControlEvents:UIControlEventTouchUpInside];
        
        [L8 addTarget:self
               action:@selector(L35Function:)
     forControlEvents:UIControlEventTouchUpInside];
        
        [L9 addTarget:self
               action:@selector(L36Function:)
     forControlEvents:UIControlEventTouchUpInside];
    }
    else if (Level==5)
    {
        for (int i=0; i<9; i++) {
            int a=i+37;
            [buttonArray[i] setTitle:([NSString stringWithFormat:@"%i", a]) forState:UIControlStateNormal];
        }
        
        [L1 addTarget:self
               action:@selector(L37Function:)
     forControlEvents:UIControlEventTouchUpInside];
        
        [L2 addTarget:self
               action:@selector(L38Function:)
     forControlEvents:UIControlEventTouchUpInside];
        
        [L3 addTarget:self
               action:@selector(L39Function:)
     forControlEvents:UIControlEventTouchUpInside];
        
        [L4 addTarget:self
               action:@selector(L40Function:)
     forControlEvents:UIControlEventTouchUpInside];
        
        [L5 addTarget:self
               action:@selector(L41Function:)
     forControlEvents:UIControlEventTouchUpInside];
        
        [L6 addTarget:self
               action:@selector(L42Function:)
     forControlEvents:UIControlEventTouchUpInside];
        
        [L7 addTarget:self
               action:@selector(L43Function:)
     forControlEvents:UIControlEventTouchUpInside];
        
        [L8 addTarget:self
               action:@selector(L44Function:)
     forControlEvents:UIControlEventTouchUpInside];
        
        [L9 addTarget:self
               action:@selector(L45Function:)
     forControlEvents:UIControlEventTouchUpInside];
    }
    
}



-(void)Start:(id)sender
{
    [self LevelPage];
}

-(IBAction)LevelChange1:(id)sender{
    Level=1;
    [self LevelPage];
}
-(IBAction)LevelChange2:(id)sender{
    Level=2;
    [self LevelPage];
}
-(IBAction)LevelChange3:(id)sender{
    Level=3;
    [self LevelPage];
}
-(IBAction)LevelChange4:(id)sender{
    Level=4;
    [self LevelPage];
}
-(IBAction)LevelChange5:(id)sender{
    Level=5;
    [self LevelPage];
}

-(void)DrawLine
{
  
    [shapeLayer removeFromSuperlayer];
    UIBezierPath *path = [UIBezierPath bezierPath];
    for (int i=0; i<8; i++) {
        for (int j=0; j<8; j++) {
            if(Linked[i][j]==true)
            {
                if((i==0 && j==1) || (i==1 && j==0))
                {
                    [path moveToPoint:CGPointMake(N1.center.x ,N1.center.y)];
                    [path addLineToPoint:CGPointMake(N2.center.x,N2.center.y)];
                }
                else if ((i==0 && j==2) || (i==2 && j==0))
                {
                    [path moveToPoint:CGPointMake(N1.center.x ,N1.center.y)];
                    [path addLineToPoint:CGPointMake(N3.center.x,N3.center.y)];
                }
                else if ((i==0 && j==3) || (i==3 && j==0))
                {
                    [path moveToPoint:CGPointMake(N1.center.x ,N1.center.y)];
                    [path addLineToPoint:CGPointMake(N4.center.x,N4.center.y)];
                }
                else if ((i==0 && j==4) || (i==4 && j==0))
                {
                    [path moveToPoint:CGPointMake(N1.center.x ,N1.center.y)];
                    [path addLineToPoint:CGPointMake(N5.center.x,N5.center.y)];
                }
                else if ((i==0 && j==5) || (i==5 && j==0))
                {
                    [path moveToPoint:CGPointMake(N1.center.x ,N1.center.y)];
                    [path addLineToPoint:CGPointMake(N6.center.x,N6.center.y)];
                }
                else if ((i==0 && j==6) || (i==6 && j==0))
                {
                    [path moveToPoint:CGPointMake(N1.center.x ,N1.center.y)];
                    [path addLineToPoint:CGPointMake(N7.center.x,N7.center.y)];
                }
                else if ((i==0 && j==7) || (i==7 && j==0))
                {
                    [path moveToPoint:CGPointMake(N1.center.x ,N1.center.y)];
                    [path addLineToPoint:CGPointMake(N8.center.x,N8.center.y)];
                }
                else if ((i==1 && j==2) || (i==2 && j==1))
                {
                    [path moveToPoint:CGPointMake(N2.center.x ,N2.center.y)];
                    [path addLineToPoint:CGPointMake(N3.center.x,N3.center.y)];
                }
                else if ((i==1 && j==3) || (i==3 && j==1))
                {
                    [path moveToPoint:CGPointMake(N2.center.x ,N2.center.y)];
                    [path addLineToPoint:CGPointMake(N4.center.x,N4.center.y)];
                }
                else if ((i==1 && j==4) || (i==4 && j==1))
                {
                    [path moveToPoint:CGPointMake(N2.center.x ,N2.center.y)];
                    [path addLineToPoint:CGPointMake(N5.center.x,N5.center.y)];
                }
                else if ((i==1 && j==5) || (i==5 && j==1))
                {
                    [path moveToPoint:CGPointMake(N2.center.x ,N2.center.y)];
                    [path addLineToPoint:CGPointMake(N6.center.x,N6.center.y)];
                }
                else if ((i==1 && j==6) || (i==6 && j==1))
                {
                    [path moveToPoint:CGPointMake(N2.center.x ,N2.center.y)];
                    [path addLineToPoint:CGPointMake(N7.center.x,N7.center.y)];
                }
                else if ((i==1 && j==7) || (i==7 && j==1))
                {
                    [path moveToPoint:CGPointMake(N2.center.x ,N2.center.y)];
                    [path addLineToPoint:CGPointMake(N8.center.x,N8.center.y)];
                }
                else if ((i==2 && j==3) || (i==3 && j==2))
                {
                    [path moveToPoint:CGPointMake(N3.center.x ,N3.center.y)];
                    [path addLineToPoint:CGPointMake(N4.center.x,N4.center.y)];
                }
                else if ((i==2 && j==4) || (i==4 && j==2))
                {
                    [path moveToPoint:CGPointMake(N3.center.x ,N3.center.y)];
                    [path addLineToPoint:CGPointMake(N5.center.x,N5.center.y)];
                }
                else if ((i==2 && j==5) || (i==5 && j==2))
                {
                    [path moveToPoint:CGPointMake(N3.center.x ,N3.center.y)];
                    [path addLineToPoint:CGPointMake(N6.center.x,N6.center.y)];
                }
                else if ((i==2 && j==6) || (i==6 && j==2))
                {
                    [path moveToPoint:CGPointMake(N3.center.x ,N3.center.y)];
                    [path addLineToPoint:CGPointMake(N7.center.x,N7.center.y)];
                }
                else if ((i==2 && j==7) || (i==7 && j==2))
                {
                    [path moveToPoint:CGPointMake(N3.center.x ,N3.center.y)];
                    [path addLineToPoint:CGPointMake(N8.center.x,N8.center.y)];
                }
                else if ((i==3 && j==4) || (i==4 && j==3))
                {
                    [path moveToPoint:CGPointMake(N4.center.x ,N4.center.y)];
                    [path addLineToPoint:CGPointMake(N5.center.x,N5.center.y)];
                }
                else if ((i==3 && j==5) || (i==5 && j==3))
                {
                    [path moveToPoint:CGPointMake(N4.center.x ,N4.center.y)];
                    [path addLineToPoint:CGPointMake(N6.center.x,N6.center.y)];
                }
                else if ((i==3 && j==6) || (i==6 && j==3))
                {
                    [path moveToPoint:CGPointMake(N4.center.x ,N4.center.y)];
                    [path addLineToPoint:CGPointMake(N7.center.x,N7.center.y)];
                }
                else if ((i==3 && j==7) || (i==7 && j==3))
                {
                    [path moveToPoint:CGPointMake(N4.center.x ,N4.center.y)];
                    [path addLineToPoint:CGPointMake(N8.center.x,N8.center.y)];
                }
                else if ((i==4 && j==5) || (i==5 && j==4))
                {
                    [path moveToPoint:CGPointMake(N5.center.x ,N5.center.y)];
                    [path addLineToPoint:CGPointMake(N6.center.x,N6.center.y)];
                }
                else if ((i==4 && j==6) || (i==6 && j==4))
                {
                    [path moveToPoint:CGPointMake(N5.center.x ,N5.center.y)];
                    [path addLineToPoint:CGPointMake(N7.center.x,N7.center.y)];
                }
                else if ((i==4 && j==7) || (i==7 && j==4))
                {
                    [path moveToPoint:CGPointMake(N5.center.x ,N5.center.y)];
                    [path addLineToPoint:CGPointMake(N8.center.x,N8.center.y)];
                }
                else if ((i==5 && j==6) || (i==6 && j==5))
                {
                    [path moveToPoint:CGPointMake(N6.center.x ,N6.center.y)];
                    [path addLineToPoint:CGPointMake(N7.center.x,N7.center.y)];
                }
                else if ((i==5 && j==7) || (i==7 && j==5))
                {
                    [path moveToPoint:CGPointMake(N6.center.x ,N6.center.y)];
                    [path addLineToPoint:CGPointMake(N8.center.x,N8.center.y)];
                }
                else if ((i==6 && j==7) || (i==7 && j==6))
                {
                    [path moveToPoint:CGPointMake(N7.center.x ,N7.center.y)];
                    [path addLineToPoint:CGPointMake(N8.center.x,N8.center.y)];
                }
                
            }
          
        }
    }
    
    shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = [path CGPath];
    shapeLayer.strokeColor = [[UIColor blackColor] CGColor];
    shapeLayer.lineWidth = 2.0;
    shapeLayer.opacity=0.3;
    
    shapeLayer.fillColor = [[UIColor clearColor] CGColor];
    [self.view.layer addSublayer:shapeLayer];
    

}

            
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    buttonArray = [[NSMutableArray alloc] init];
    [self AddButtons];
    [self MainPage];
    NSInteger s=[[NSUserDefaults standardUserDefaults] integerForKey:@"Save4"];
    if (CurrentLevel<s) {
        CurrentLevel=s;
    }
    
    }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
