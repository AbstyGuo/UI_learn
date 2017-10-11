//
//  BaseViewController.h
//  OtherControls
//
//  Created by 夏婷 on 15/11/25.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseViewController : UIViewController
//公开一个方法，提供给子类创建视图时重写
-(void)createControl;

@end
