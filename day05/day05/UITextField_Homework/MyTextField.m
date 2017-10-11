//
//  MyTextField.m
//  UITextField_Homework
//
//  Created by 夏婷 on 15/11/20.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "MyTextField.h"

@implementation MyTextField

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //创建固定的二级键盘
        [self createInputAccessView];
    }
    return self;
}

-(void)createInputAccessView
{
    //把表情放到数组，通过数组一堆按钮
    NSArray *titleArray = @[@"😉",@"😍",@"🐨",@"🐻",@"🔥",@"💩",@"💘",@"👿",@"👽",@"🎋"];
    //获取屏幕尺寸
    CGSize size = [UIScreen mainScreen].bounds.size;
    //创建二级键盘视图
    UIView *inputAccessView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, size.width, 50)];
    //计算按钮的宽度
    CGFloat width = size.width/titleArray.count;
    
    for (int i = 0; i < titleArray.count; i++)
    {
        UIButton *button = [[UIButton alloc]init];
        //设置标题
        [button setTitle:titleArray[i] forState:UIControlStateNormal];
        [button setTitle:titleArray[i] forState:UIControlStateHighlighted];
        // 设置位置和大小
        button.frame = CGRectMake(i * width, 0, width, 50);
        //添加点击事件
        //Target 是MyTextField的对象
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        //添加到二级键盘的视图上
        [inputAccessView addSubview:button];
    }
    //把自定义的二级键盘设置为文本框的二级键盘
    self.inputAccessoryView = inputAccessView;
    
}
-(void)buttonClicked:(UIButton *)button
{
    //拼接输入的表情
    self.text = [NSString stringWithFormat:@"%@%@",self.text,button.titleLabel.text];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
