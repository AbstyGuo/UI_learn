//
//  CalculatorViewController.m
//  Calculator
//
//  Created by student on 15-11-17.
//  Copyright (c) 2015年 郭永峰. All rights reserved.
//

#import "CalculatorViewController.h"

@interface CalculatorViewController ()
{
    NSMutableString * _str;
    BOOL _isY;
}
@end

@implementation CalculatorViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _str =[[NSMutableString alloc]init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    UILabel  * label = [[UILabel alloc]initWithFrame:CGRectMake(30, 40, 260, 60)];
    _isY = YES;
    label.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:label];
    label.tag=10;
    label.text=@"0";
    label.font=[UIFont systemFontOfSize:44];
    label.textAlignment = NSTextAlignmentRight;
    label.textColor=[UIColor blueColor];
    label.adjustsFontSizeToFitWidth=YES;
    
    UIButton * button1 =[[UIButton alloc]initWithFrame:CGRectMake(30, 170, 62, 50)];
    button1.tag=11;
    button1.backgroundColor=[UIColor lightGrayColor];
    [button1 setTitle:@"AC" forState:UIControlStateNormal];
    [button1 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button1 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    UIButton * button2 =[[UIButton alloc]initWithFrame:CGRectMake(96, 170, 62, 50)];
    button2.tag=12;
    button2.backgroundColor=[UIColor lightGrayColor];
    [button2 setTitle:@"⬅️" forState:UIControlStateNormal];
    [button2 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button2 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    UIButton * button3 =[[UIButton alloc]initWithFrame:CGRectMake(162, 170, 62, 50)];
    button3.tag=13;
    button3.backgroundColor=[UIColor lightGrayColor];
    [button3 setTitle:@"➗" forState:UIControlStateNormal];
    [button3 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button3 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];
    
    UIButton * button4 =[[UIButton alloc]initWithFrame:CGRectMake(228, 170, 62, 50)];
    button4.tag=14;
    button4.backgroundColor=[UIColor lightGrayColor];
    [button4 setTitle:@"✖️" forState:UIControlStateNormal];
    [button4 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button4 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button4];
    
    UIButton * button5 =[[UIButton alloc]initWithFrame:CGRectMake(30, 225, 62, 50)];
    button5.tag=15;
    button5.backgroundColor=[UIColor lightGrayColor];
    [button5 setTitle:@"1" forState:UIControlStateNormal];
    [button5 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button5 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button5];
    
    UIButton * button6 =[[UIButton alloc]initWithFrame:CGRectMake(96, 225, 62, 50)];
    button6.tag=16;
    button6.backgroundColor=[UIColor lightGrayColor];
    [button6 setTitle:@"2" forState:UIControlStateNormal];
    [button6 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button6 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button6];
    
    UIButton * button7 =[[UIButton alloc]initWithFrame:CGRectMake(162, 225, 62, 50)];
    button7.tag=17;
    button7.backgroundColor=[UIColor lightGrayColor];
    [button7 setTitle:@"3" forState:UIControlStateNormal];
    [button7 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button7 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button7];
    
    UIButton * button8 =[[UIButton alloc]initWithFrame:CGRectMake(228, 225, 62, 50)];
    button8.tag=18;
    button8.backgroundColor=[UIColor lightGrayColor];
    [button8 setTitle:@"➖" forState:UIControlStateNormal];
    [button8 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button8 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button8];
    
    UIButton * button9 =[[UIButton alloc]initWithFrame:CGRectMake(30, 280, 62, 50)];
    button9.tag=19;
    button9.backgroundColor=[UIColor lightGrayColor];
    [button9 setTitle:@"4" forState:UIControlStateNormal];
    [button9 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button9 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button9];
    
    UIButton * button10 =[[UIButton alloc]initWithFrame:CGRectMake(96, 280, 62, 50)];
    button10.tag=20;
    button10.backgroundColor=[UIColor lightGrayColor];
    [button10 setTitle:@"5" forState:UIControlStateNormal];
    [button10 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button10 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button10];
    
    UIButton * button11 =[[UIButton alloc]initWithFrame:CGRectMake(162, 280, 62, 50)];
    button11.tag=21;
    button11.backgroundColor=[UIColor lightGrayColor];
    [button11 setTitle:@"6" forState:UIControlStateNormal];
    [button11 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button11 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button11];
    
    UIButton * button12 =[[UIButton alloc]initWithFrame:CGRectMake(228, 280, 62, 50)];
    button12.tag=22;
    button12.backgroundColor=[UIColor lightGrayColor];
    [button12 setTitle:@"➕" forState:UIControlStateNormal];
    [button12 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button12 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button12];
    
    UIButton * button13 =[[UIButton alloc]initWithFrame:CGRectMake(30, 335, 62, 50)];
    button13.tag=23;
    button13.backgroundColor=[UIColor lightGrayColor];
    [button13 setTitle:@"7" forState:UIControlStateNormal];
    [button13 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button13 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button13];
    
    UIButton * button14 =[[UIButton alloc]initWithFrame:CGRectMake(96, 335, 62, 50)];
    button14.tag=24;
    button14.backgroundColor=[UIColor lightGrayColor];
    [button14 setTitle:@"8" forState:UIControlStateNormal];
    [button14 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button14 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button14];
    
    UIButton * button15 =[[UIButton alloc]initWithFrame:CGRectMake(162, 335, 62, 50)];
    button15.tag=25;
    button15.backgroundColor=[UIColor lightGrayColor];
    [button15 setTitle:@"9" forState:UIControlStateNormal];
    [button15 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button15 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button15];
    
    UIButton * button16 =[[UIButton alloc]initWithFrame:CGRectMake(228, 335, 62, 105)];
    button16.tag=26;
    button16.backgroundColor=[UIColor lightGrayColor];
    [button16 setTitle:@"=" forState:UIControlStateNormal];
    [button16 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button16 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button16];
    
    UIButton * button17 =[[UIButton alloc]initWithFrame:CGRectMake(30, 390, 128, 50)];
    button17.tag=27;
    button17.backgroundColor=[UIColor lightGrayColor];
    [button17 setTitle:@"0" forState:UIControlStateNormal];
    [button17 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button17 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button17];
    
    UIButton * button18 =[[UIButton alloc]initWithFrame:CGRectMake(162, 390, 62, 50)];
    button18.tag=28;
    button18.backgroundColor=[UIColor lightGrayColor];
    [button18 setTitle:@"." forState:UIControlStateNormal];
    [button18 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [button18 addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button18];
   
    }

-(void)buttonClicked:(UIButton *)sender
{
    UILabel * label =(id)[self.view viewWithTag:10];
    int x = sender.tag;
    if (_isY==YES) {
        _str=[NSMutableString stringWithString:@""];
    }
    switch (x) {
        case 11:
            label.text=@"0";
            _isY=NO;
            break;
        case 12:
            [_str deleteCharactersInRange:NSMakeRange([_str length]-1, 1)];
            label.text = _str;
            _isY=NO;
            break;
        case 13:
            [_str appendString:@"/"];
            label.text = _str;
            _isY=NO;
            break;
        case 14:
            [_str appendString:@"*"];
            label.text = _str;
            _isY=NO;
            break;
        case 15:
            [_str appendString:@"1"];
            label.text = _str;
            _isY=NO;
            break;
        case 16:
            [_str appendString:@"2"];
            label.text = _str;
            _isY=NO;
            break;
        case 17:
            [_str appendString:@"3"];
            label.text = _str;
            _isY=NO;
            break;
        case 18:
            [_str appendString:@"-"];
            label.text = _str;
            _isY=NO;
            break;
        case 19:
            [_str appendString:@"4"];
            label.text = _str;
            _isY=NO;
            break;
        case 20:
            [_str appendString:@"5"];
            label.text = _str;
            _isY=NO;
            break;
        case 21:
            [_str appendString:@"6"];
            label.text = _str;
            _isY=NO;
            break;
        case 22:
            [_str appendString:@"+"];
            label.text = _str;
            _isY=NO;
            break;
        case 23:
            [_str appendString:@"7"];
            label.text = _str;
            _isY=NO;
            break;
        case 24:
            [_str appendString:@"8"];
            label.text = _str;
            _isY=NO;
            break;
        case 25:
            [_str appendString:@"9"];
            label.text = _str;
            _isY=NO;
            break;
        case 26:
            _str=[self resultWithString:_str];
            label.text = _str;
            _isY=YES;
            break;
        case 27:
            [_str appendString:@"0"];
            label.text = _str;
            _isY=NO;
            break;
        case 28:
            [_str appendString:@"."];
            label.text = _str;
            _isY=NO;
            break;
        default:
            break;
    }
}

-(NSString *)resultWithString:(NSString*)expression
{
    NSMutableArray *mutNumArray = [NSMutableArray arrayWithArray:[expression componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"+-*/"]]];
    NSMutableArray *mutSignArray = [NSMutableArray arrayWithArray:[expression componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"0123456789"]]];
    
    [mutSignArray removeObject:@""];
    [mutSignArray removeObject:@"."];
    
    for (int i = 0; i < [mutSignArray count]; i++) {
        if ([[mutSignArray objectAtIndex:i] isEqualToString:@"*"]) {
            [mutNumArray replaceObjectsInRange:NSMakeRange(i, 2) withObjectsFromArray:@[[NSString stringWithFormat:@"%.6f", [mutNumArray[i] floatValue] * [mutNumArray[i + 1] floatValue]]]];
            
            [mutSignArray removeObjectAtIndex:i];
            
            i = -1;
        }else if ([[mutSignArray objectAtIndex:i] isEqualToString:@"/"]){
            [mutNumArray replaceObjectsInRange:NSMakeRange(i, 2) withObjectsFromArray:@[[NSString stringWithFormat:@"%.6f", [mutNumArray[i] floatValue] / [mutNumArray[i + 1] floatValue]]]];
            
            [mutSignArray removeObjectAtIndex:i];
            
            i = -1;
        }
    }
    for (int i = 0; i < [mutSignArray count]; i++) {
        if ([[mutSignArray objectAtIndex:i] isEqualToString:@"+"]) {
            [mutNumArray replaceObjectsInRange:NSMakeRange(i, 2) withObjectsFromArray:@[[NSString stringWithFormat:@"%.6f", [mutNumArray[i] floatValue] + [mutNumArray[i + 1] floatValue]]]];
            
            [mutSignArray removeObjectAtIndex:i];
            
            i = -1;
//            NSLog(@"%@  %@",mutNumArray,mutSignArray);
            
        }else if ([[mutSignArray objectAtIndex:i] isEqualToString:@"-"]){
            [mutNumArray replaceObjectsInRange:NSMakeRange(i, 2) withObjectsFromArray:@[[NSString stringWithFormat:@"%.6f", [mutNumArray[i] floatValue] - [mutNumArray[i + 1] floatValue]]]];
            
            [mutSignArray removeObjectAtIndex:i];
            
            i = -1;
//            NSLog(@"%@  %@",mutNumArray,mutSignArray);
        }
    }
    
     NSString * string=[self deleteLastZeroFromString:mutNumArray[0]];
    return string;
    
}
-(NSString *)deleteLastZeroFromString:(NSString *)numRet{
    while ([numRet rangeOfString:@"."].length != 0) {
        if ([numRet hasSuffix:@"0"]) {
            numRet = [numRet substringToIndex:[numRet length]-1];
        }else if ([numRet hasSuffix:@"."])
            numRet = [numRet substringToIndex:[numRet length]-1];
        else{
            break;
        }
    }
    return numRet;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
