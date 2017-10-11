//
//  ADScrollView.h
//  CutomCellDemo
//
//  Created by 夏婷 on 15/12/1.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ADScrollView : UIView<UIScrollViewDelegate>//遵循滚动视图的协议

//对外提供一个方法刷新显示的图片等信息,array存储图片名字
-(void)reloadDataWithImageArray:(NSArray *)array;


@end
