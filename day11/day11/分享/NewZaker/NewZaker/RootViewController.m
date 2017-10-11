//
//  RootViewController.m
//  NewZaker
//
//  Created by OS on 13-8-21.
//  Copyright (c) 2013年 OS. All rights reserved.
//

#import "RootViewController.h"
#import "InsertZakerView.h"

@interface RootViewController ()

@end

@implementation RootViewController

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
    NSMutableArray *array = [[NSMutableArray alloc]init];
    for (NSInteger i=0 ; i<27; i++) {
        NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:[NSString stringWithFormat:@"%d",i],@"titleString",[NSString stringWithFormat:@"%d.jpg",i+1],@"imageNameString",nil];
        [array addObject:dict];
    }
//    InsertZakerView *insertView = [[InsertZakerView alloc]initWithFrame:self.view.bounds];
    InsertZakerView *insertView = [[InsertZakerView alloc]initWithFrame:self.view.bounds TitleAndImageArray:array];
    insertView.backgroundColor = [UIColor clearColor];
    self.view.backgroundColor = [UIColor clearColor];
    [self.view addSubview:insertView];
    [insertView release];
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
