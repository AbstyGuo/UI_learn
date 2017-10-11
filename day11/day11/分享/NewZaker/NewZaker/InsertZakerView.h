//
//  InsertZakerView.h
//  NewZaker
//
//  Created by OS on 13-8-21.
//  Copyright (c) 2013年 OS. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZakerView.h"
@interface InsertZakerView : UIView<UIScrollViewDelegate,UIGestureRecognizerDelegate,ZakerViewDelegate>
@property (nonatomic, strong) NSMutableArray *zakersArray;
-(void)addbutton;

-(id)initWithFrame:(CGRect)frame TitleAndImageArray:( NSArray * )array;

@end
