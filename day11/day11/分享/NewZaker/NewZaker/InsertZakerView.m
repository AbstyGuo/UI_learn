//
//  InsertZakerView.m
//  NewZaker
//
//  Created by OS on 13-8-21.
//  Copyright (c) 2013年 OS. All rights reserved.
//

#import "InsertZakerView.h"
#import "ZakerView.h"
//设计参数设置
#define cloumns 3         //最大列数
#define rows 4            //最大行数
#define itemsPerpage 12    //每页zakerView个数
#define itemHight 95     //zakerVew高度
#define itemWith 70      //zakerView宽度
#define unlidIndex -1
#define threshold 30
#define space 10           //间隔距离
#define leftspace 40      //距离左边的距离
#define topspace 20        //距离顶部的距离

@interface InsertZakerView(private)

-(NSInteger)indexOfLocation:(CGPoint)location;
-(CGPoint)orginPointOfIndex:(NSInteger)index;
-(void)exchangeItem:(NSInteger)oldIndex WithPosition:(NSInteger)newIndex;

@end


@implementation InsertZakerView

//@synthesize zakerArray = _zakerArray;

{
    UIScrollView *_scrollView;
    ZakerView *addButton;
    NSInteger *_curPage;
    CGRect _preFrame;
    NSInteger addTime;
}
@synthesize zakersArray = _zakersArray;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _preFrame = CGRectMake(0, 0, 0, 0);
        _zakersArray = [[NSMutableArray alloc]init];
        _scrollView = [[UIScrollView alloc]init];
        _scrollView.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
        _scrollView.pagingEnabled = YES;
        _scrollView.showsVerticalScrollIndicator = NO;
        [self addSubview:_scrollView];
        
        _curPage = 0;
        addButton = [[ZakerView alloc]initWithTitle:@"更多" atIndex:0];
        addButton.tag = 0;
        [addButton setFrame:CGRectMake(leftspace, topspace, itemWith, itemHight)];
        [_zakersArray addObject:addButton];
        addButton.delegate = self;
        [_scrollView addSubview:addButton];
    }
    return self;
}
-(id)initWithFrame:(CGRect)frame TitleAndImageArray:(NSArray *)array
{
    self = [super initWithFrame:frame];
    _preFrame = CGRectMake(0, 0, 0, 0);
    _zakersArray = [[NSMutableArray alloc]init];
    _scrollView = [[UIScrollView alloc]init];
    _scrollView.frame = CGRectMake(0, 0, 320, 480);
    _scrollView.pagingEnabled = YES;
    [self addSubview:_scrollView];
    
    _curPage = 0;
    NSDictionary *dict = [array objectAtIndex:0];
//    addButton = [[ZakerView alloc]initWithTitle:[dict objectForKey:@"titleString"]  atIndex:0];
    addButton = [[ZakerView alloc]initWithTitle:[dict objectForKey:@"titleString"] atIndex:0 AndImage:[dict objectForKey:@"imageNameString"]];
    addButton.tag = 0;
    [addButton setFrame:CGRectMake(leftspace, topspace, itemWith, itemHight)];
    [_zakersArray addObject:addButton];
    addButton.delegate = self;
    [_scrollView addSubview:addButton];
    
    
    for (addTime=1; addTime<[array count];addTime++)
    {
        NSDictionary *dict1 = [array objectAtIndex:addTime];
        
        [self addItemWithTitle:[dict1 objectForKey:@"titleString"] AndImage:[dict1 objectForKey:@"imageNameString"]];
    }
    return self;
}
-(void)addItemWithTitle:(NSString *)title AndImage:(NSString *)imageName
{
    CGRect preframe = addButton.frame;
    CGRect frame = CGRectMake(leftspace, topspace, itemWith, itemHight);
    NSInteger n = 0;
    NSInteger row = 0;
    NSInteger col = 0;
    NSInteger curPage = 0;
    if(addButton.index == [_zakersArray count]-1)
    {
        n = [_zakersArray count];
        row = (n-1)/cloumns;
        col = (n-1)%cloumns;
        curPage = (n-1)/itemsPerpage;
        row = row % rows;
    }
    else
    {
        n = [_zakersArray count];
        row = (n)/cloumns;
        col = (n)%cloumns;
        curPage = (n)/itemsPerpage;
        row = row % rows;
    }
    frame.origin.x = frame.origin.x +frame.size.width*col +space * col +_scrollView.frame.size.width * curPage;
    //＋topspace
    frame.origin.y = frame.origin.y + space*row +topspace +frame.size.height*row;
    //修改标题和tag
//    ZakerView *zakerItem = [[ZakerView alloc]initWithTitle:[NSString stringWithFormat:@"%d",n-1] atIndex:n-1];
    ZakerView *zakerItem = [[ZakerView alloc]initWithTitle:title atIndex:n-1 AndImage:imageName];
    zakerItem.tag = n-1;
    if (addButton.index == [_zakersArray count]-1) {
        [zakerItem setFrame:preframe];
    }
    else
        [zakerItem setFrame:frame];
    
    zakerItem.delegate = self;
    [_zakersArray addObject:zakerItem];
    [_scrollView addSubview:zakerItem];
    zakerItem = nil;
    
    //移动添加按钮位置
    if(addButton.index == [_zakersArray count]-2)
    {
        row = n/cloumns;
        col = n%cloumns;
        curPage = n/itemsPerpage;
        row = row % rows;
        frame = CGRectMake(leftspace, topspace, itemWith, itemHight);
        frame.origin.x = frame.origin.x + frame.size.width * col + space* col + _scrollView.frame.size.width * curPage;
        //＋topspace
        frame.origin.y = frame.origin.y + frame.size.height * row + space * row;
        [UIView animateWithDuration:0.2f animations:^{
            [addButton setFrame:frame];
        }];
        [_zakersArray exchangeObjectAtIndex:[_zakersArray count]-1 withObjectAtIndex:[_zakersArray count]-2];
        addButton.index +=1;
        NSLog(@"addButon.index 已经＋1,移动了AddBUton的位置");
    }
    if ([_zakersArray count]%itemsPerpage==1) {
        [_scrollView setContentSize:CGSizeMake(_scrollView.frame.size.width * (curPage + 1), _scrollView.frame.size.height)];
        [_scrollView scrollRectToVisible:CGRectMake(_scrollView.frame.size.width * curPage, _scrollView.frame.origin.y, _scrollView.frame.size.width, _scrollView.frame.size.height) animated:NO];
    }
}
-(void)addbutton
{
    CGRect preframe = addButton.frame;
    CGRect frame = CGRectMake(leftspace, topspace, itemWith, itemHight);
    NSInteger n = 0;
    NSInteger row = 0;
    NSInteger col = 0;
    NSInteger curPage = 0;
    if(addButton.index == [_zakersArray count]-1)
    {
        n = [_zakersArray count];
        row = (n-1)/cloumns;
        col = (n-1)%cloumns;
        curPage = (n-1)/itemsPerpage;
        row = row % rows;
    }
    else
    {
        n = [_zakersArray count];
        row = (n)/cloumns;
        col = (n)%cloumns;
        curPage = (n)/itemsPerpage;
        row = row % rows;
    }
    frame.origin.x = frame.origin.x +frame.size.width*col +space * col +_scrollView.frame.size.width * curPage;
    //＋topspace
    frame.origin.y = frame.origin.y + space*row +topspace +frame.size.height*row;
    //修改标题和tag
    ZakerView *zakerItem = [[ZakerView alloc]initWithTitle:[NSString stringWithFormat:@"%d",n-1] atIndex:n-1];
    zakerItem.tag = n-1;
    if (addButton.index == [_zakersArray count]-1) {
        [zakerItem setFrame:preframe];
    }
    else
        [zakerItem setFrame:frame];
    
    zakerItem.delegate = self;
    [_zakersArray addObject:zakerItem];
    [_scrollView addSubview:zakerItem];
    zakerItem = nil;
    
    //移动添加按钮位置
    if(addButton.index == [_zakersArray count]-2)
    {
        row = n/cloumns;
        col = n%cloumns;
        curPage = n/itemsPerpage;
        row = row % rows;
        frame = CGRectMake(leftspace, topspace, itemWith, itemHight);
        frame.origin.x = frame.origin.x + frame.size.width * col + space* col + _scrollView.frame.size.width * curPage;
        //＋topspace
        frame.origin.y = frame.origin.y + frame.size.height * row + space * row;
        [UIView animateWithDuration:0.2f animations:^{
            [addButton setFrame:frame];
        }];
        [_zakersArray exchangeObjectAtIndex:[_zakersArray count]-1 withObjectAtIndex:[_zakersArray count]-2];
        addButton.index +=1;
        NSLog(@"addButon.index 已经＋1,移动了AddBUton的位置");
    }
    if ([_zakersArray count]%itemsPerpage==1) {
        [_scrollView setContentSize:CGSizeMake(_scrollView.frame.size.width * (curPage + 1), _scrollView.frame.size.height)];
        [_scrollView scrollRectToVisible:CGRectMake(_scrollView.frame.size.width * curPage, _scrollView.frame.origin.y, _scrollView.frame.size.width, _scrollView.frame.size.height) animated:NO];
    }
}
-(void)zakerItemDidClicked:(ZakerView *)zakerItem
{
//    if (zakerItem.tag == 0) {
//        [self addbutton];
//    }
}
-(void)zakerItemDidMoved:(ZakerView *)zakerItem WithLocation:(CGPoint)point moveGestureReconizer:(UILongPressGestureRecognizer *)recognizer
{
    NSLog(@"移动开始");
    CGRect frame = zakerItem.frame;
    CGPoint willMoved = [recognizer locationInView:_scrollView];
    CGPoint pointInView = [recognizer locationInView:self];
    //拖动移动
    frame.origin.x = willMoved.x - point.x;
    frame.origin.y = willMoved.y - point.y;
    zakerItem.frame = frame;
    
    
    NSInteger toIndex = [self indexOfLocation:willMoved];
    NSInteger fromIndex = zakerItem.index;
    NSLog(@"fromIndex =%d,Toindex = %d",fromIndex,toIndex);
    
    if (fromIndex != toIndex && toIndex != unlidIndex)
    {
        if (toIndex -fromIndex == 1 || toIndex-fromIndex == -1)//移动的View和目的View相邻
        {
        ZakerView *aimItem = [_zakersArray objectAtIndex:toIndex];
//        [_scrollView sendSubviewToBack:aimItem];
        [_scrollView bringSubviewToFront:aimItem];
        [UIView animateWithDuration:0.2 animations:^{
            CGPoint origin = [self orginPointOfIndex:fromIndex];
            aimItem.frame = CGRectMake(origin.x, origin.y, aimItem.frame.size.width, aimItem.frame.size.height);
        } ];
        [self exchangeItem:fromIndex WithPosition:toIndex];
        }
        else//移动的View和目的View不相邻
        {
            if (fromIndex < toIndex)
            {
                
                for (NSInteger i = fromIndex;i < toIndex; i++ )
                {
                    ZakerView *anmItem = [_zakersArray objectAtIndex:i+1];
                    [_scrollView bringSubviewToFront:anmItem];
                    [UIView animateWithDuration:0.2 animations:^{
                        CGPoint origin = [self orginPointOfIndex:i];
                        anmItem.frame = CGRectMake(origin.x, origin.y, anmItem.frame.size.width, anmItem.frame.size.height);
                    }];
                    [self exchangeItem:i WithPosition:i+1];
                }
            }
            if (fromIndex > toIndex)
            {
                for (NSInteger i = fromIndex; i > toIndex; i--)
                {
                    ZakerView *anmItem = [_zakersArray objectAtIndex:i-1];
                    [_scrollView bringSubviewToFront:anmItem];
                    [UIView animateWithDuration:0.2 animations:^{
                        CGPoint origin = [self orginPointOfIndex:i];
                        anmItem.frame = CGRectMake(origin.x, origin.y, anmItem.frame.size.width, anmItem.frame.size.height);
                    }];
                    [self exchangeItem:i WithPosition:i-1];

                }
            }
        }
    }
    //翻页
    if (pointInView.x >= _scrollView.frame.size.width - threshold)
    {
        NSLog(@"翻页");
        [_scrollView scrollRectToVisible:CGRectMake(_scrollView.contentOffset.x + _scrollView.frame.size.width, 0, _scrollView.frame.size.width, _scrollView.frame.size.height) animated:YES];
    }else if (pointInView.x < threshold) {
        [_scrollView scrollRectToVisible:CGRectMake(_scrollView.contentOffset.x - _scrollView.frame.size.width, 0, _scrollView.frame.size.width, _scrollView.frame.size.height) animated:YES];
    }
    
}
-(void)zakerItemDidEndMoved:(ZakerView *)zakerItem WithLocation:(CGPoint)point moveGestureReconizer:(UILongPressGestureRecognizer *)recognizer
{
    CGPoint _point = [recognizer locationInView:_scrollView];
    NSInteger toIndex = [self indexOfLocation:_point];
    if (toIndex == unlidIndex) {
        toIndex = zakerItem.index;
    }
    CGPoint origin = [self orginPointOfIndex:toIndex];
    [UIView animateWithDuration:0.2 animations:^{
        zakerItem.frame = CGRectMake(origin.x, origin.y, zakerItem.frame.size.width, zakerItem.frame.size.height);
    }];
    NSLog(@"zakerItem index:%d",zakerItem.index);
    
    NSLog(@"移动结束");
}
-(NSInteger)indexOfLocation:(CGPoint)location
{
    NSInteger index;
    NSInteger page = location.x/320;
    NSInteger row = (location.y-topspace)/( itemHight + space );
    NSInteger col = (location.x - page *320-leftspace)/(itemWith+space);
    
    if (row >= rows || col >= cloumns) {
        return  unlidIndex;
    }
    index = itemsPerpage * page + row * cloumns + col;
    if (index >= [_zakersArray count]) {
        return unlidIndex;
    }
    return index;
    
}
-(CGPoint)orginPointOfIndex:(NSInteger)index
{
    CGPoint point = CGPointZero;
    
    if (index > [_zakersArray count] || index < 0) {
        return point;
    }else{
        NSInteger _page = index / itemsPerpage;
        NSInteger row = (index - _page * itemsPerpage) / cloumns;
        NSInteger col = (index - _page * itemsPerpage) % cloumns;
        
        point.x = _page * 320 + col * itemWith + col * space +leftspace;
        //+topspace
        point.y = row * itemHight + row * space +topspace;
        return  point;
    }
    
}

-(void)exchangeItem:(NSInteger)oldIndex WithPosition:(NSInteger)newIndex
{
    ((ZakerView *)[_zakersArray objectAtIndex:oldIndex]).index = newIndex;
    ((ZakerView *)[_zakersArray objectAtIndex:newIndex]).index = oldIndex;
    [_zakersArray exchangeObjectAtIndex:oldIndex withObjectAtIndex:newIndex];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
