//
//  XTScrollView.h
//  UIScrollView_reuse
//
//  Created by 夏婷 on 15/11/28.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *  复用ScrollView
 *1：按页滚动，滚动指示条隐藏
 
 *2： 复用，使用三个子视图，显示无数个图片
 
  a:如果显示的时第一个（下标是0）时，第一个子视图显示第一张图片（下标是0)，第二个子视图显示第二张图片（下标1），第三个子视图显示第三张图片（下标2）
  b:如果当前显示的是最后一张图（下标对应总数 -1），第三个子视图显示最后一张图片（下标对应总数 -1），第二子视图显示倒数第二张图（下标对应总数 -2），第一个子视图显示倒数第三张图片（下标对应总数 -3）
  c:当前显示的是中间任意一张图时，第二子视图显示当前下标对应的图片，第一个子视图显示当前下标-1对应的图片，第三个子视图显示当前下标 + 1对应的图片
 
 *第一个代理 :<获取子视图添加XTScrollView上>
 
 *3从代理对象中拿到显示的子视图<XTScrollView本身不知道要添加什么子视图的>
 第二代理：数据源有关的
 *4：通过代理方法从代理中取到要显示的视图总数
 *5：即将显示某一个视图时，让代理提供数据中对应的显示数，刷新显示
 
 XTScrollView 本身实例方法
 
 *6：当数据源发生改变时，可以有方法刷新所有数据
 
 *7:当XTScrollView要显示到窗口上时，自己触发一次刷新
 */

/**
 *  声明一个协议，主要是从代理中拿到子视图（子视图在代理对象中创建）
 */
@protocol XTScrollViewDelegate <NSObject>

//从代理对象中获取子视图
@required
-(UIView *)viewAtIndex:(NSInteger)index;

@end



/**
 *  数据源相关的协议
 1.从代理中获取显示的子视图总个数
 2.传递要显示的子视图和子视图下标，在代理中刷新显示内容
 */
@protocol XTScrollViewDataSource <NSObject>
// 1.从代理中获取显示的子视图总个数
@required
-(NSInteger)numberOfPages;

@optional
//传递要显示的子视图和子视图下标，在代理中刷新显示内容
-(void)refreshView:(UIView *)view atIndex:(NSInteger)index;

@end


@interface XTScrollView : UIScrollView<UIScrollViewDelegate>//遵循滚动视图的协议

//获取子视图的代理
@property(nonatomic, assign) id<XTScrollViewDelegate>subViewDelegate;
//数据源代理
@property (nonatomic, weak) id<XTScrollViewDataSource> dataSource;

//触发刷新的方法
-(void)reloadData;

@end
