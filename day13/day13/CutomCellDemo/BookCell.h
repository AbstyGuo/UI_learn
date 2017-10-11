//
//  BookCell.h
//  CutomCellDemo
//
//  Created by 夏婷 on 15/12/1.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BookCell : UITableViewCell

//公开一个方法刷新显示内容
-(void)refreshViewWith:(NSDictionary *)dict;


@end
