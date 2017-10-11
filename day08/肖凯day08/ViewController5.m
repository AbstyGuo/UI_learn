//
//  ViewController5.m
//  day08_homeWork
//
//  Created by MS on 15-11-25.
//  Copyright (c) 2015年 肖凯. All rights reserved.
//

#import "ViewController5.h"

@interface ViewController5 ()

@end

@implementation ViewController5

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UISlider *slider = [[UISlider alloc]initWithFrame:CGRectMake(50, 100, self.view.frame.size.width-100, 30)];
    slider.tintColor = [UIColor redColor];
    slider.tag = 50;
    slider.minimumValue =  0;
    slider.maximumValue =  255.0;
    [slider addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
    
    UISlider *slider1 = [[UISlider alloc]initWithFrame:CGRectMake(50, 200, self.view.frame.size.width-100, 30)];
    
    slider1.tintColor = [UIColor greenColor];
    slider1.tag = 60;
    
    slider1.minimumValue = 0;
   
    slider1.maximumValue = 255.0;
    
    [slider1 addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider1];
    
    
    UISlider *slider2 = [[UISlider alloc]initWithFrame:CGRectMake(50, 300, self.view.frame.size.width-100, 30)];
    slider2.tintColor = [UIColor blueColor];
    slider2.tag = 70;
    slider2.minimumValue = 0;
    slider2.maximumValue = 255.0;
    [slider2 addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider2];
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 100, 30, 30)];
    label.textColor = [UIColor redColor];
    label.font = [UIFont boldSystemFontOfSize:30];
    label.text = @"R";
    [self.view addSubview:label];
    
    UILabel *label2 = [[UILabel alloc]initWithFrame:CGRectMake(10, 200, 30, 30)];
    label2.textColor = [UIColor greenColor];
    label2.font = [UIFont boldSystemFontOfSize:30];
    label2.text = @"G";
    [self.view addSubview:label2];
    
    UILabel *label3 = [[UILabel alloc]initWithFrame:CGRectMake(10, 300, 30, 30)];
    label3.textColor = [UIColor blueColor];
    label3.font = [UIFont boldSystemFontOfSize:30];
    label3.text = @"B";
    [self.view addSubview:label3];
    
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(250, 400, 40, 30)];
    [button setTitle:@"保存" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor cyanColor] forState:UIControlStateHighlighted];
    button.backgroundColor = [UIColor yellowColor];
    button.titleLabel.font = [UIFont boldSystemFontOfSize:20];
    [button addTarget:self action:@selector(buttonSave) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSString *red = [[NSUserDefaults standardUserDefaults]objectForKey:@"red"];
    NSString *green = [[NSUserDefaults standardUserDefaults]objectForKey:@"green"];
    NSString *blue = [[NSUserDefaults standardUserDefaults]objectForKey:@"blue"];
    float r = [red floatValue];
    float g = [green floatValue];
    float b = [blue floatValue];
    self.view.backgroundColor = [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:1];
}

-(void)buttonSave{
    UISlider *redSlider = (id)[self.view viewWithTag:50];
    UISlider *greenSlider = (id)[self.view viewWithTag:60];
    UISlider *blueSlider = (id)[self.view viewWithTag:70];
    NSString *r = [NSString stringWithFormat:@"%.2f",redSlider.value];
    NSString *g = [NSString stringWithFormat:@"%.2f",greenSlider.value];
    NSString *b = [NSString stringWithFormat:@"%.2f",blueSlider.value];
//    NSLog(@"%.2f %.2f %.2f",r,g,b);
     NSUserDefaults *defauts = [NSUserDefaults standardUserDefaults];
    [defauts setObject:r forKey:@"red"];
    [defauts setObject:g forKey:@"green"];
    [defauts setObject:b forKey:@"blue"];
    [defauts synchronize];
    
}
-(void)valueChanged:(UISlider *)slider{
    UISlider *redSlider = (id)[self.view viewWithTag:50];
    UISlider *greenSlider = (id)[self.view viewWithTag:60];
    UISlider *blueSlider = (id)[self.view viewWithTag:70];
    self.view.backgroundColor = [UIColor colorWithRed:redSlider.value/255.0f green:greenSlider.value/255.0f blue:blueSlider.value/255.0f alpha:1];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
