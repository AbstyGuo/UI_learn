//
//  BookCell.m
//  CutomCellDemo
//
//  Created by 夏婷 on 15/12/1.
//  Copyright (c) 2015年 夏婷. All rights reserved.
//

#import "BookCell.h"

@implementation BookCell
{
    UIImageView *_iconImageView;//用来显示图标
    UILabel *_titleLabel;//用于显示书的名字
    UILabel *_detailLabel;//用于显示详细信息
    UILabel *_priceLabel;//用于显示价格
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //创建子视图
        [self createSubViews];
        
        //设置选中效果
        self.selectionStyle = UITableViewCellSelectionStyleBlue;
        /*
         UITableViewCellSelectionStyleNone,
         UITableViewCellSelectionStyleBlue,
         UITableViewCellSelectionStyleGray,
         UITableViewCellSelectionStyleDefault
         */
        UIView *backView = [[UIView alloc]init];
        backView.backgroundColor = [UIColor lightGrayColor];
        //设置选中时背景视图
        [self setSelectedBackgroundView:backView];
    }
    return self;
}

-(void)createSubViews
{
    
    CGRect frame = self.contentView.frame;
    //初始化图片视图
    _iconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 20, 60, 60)];
    
    _titleLabel = [[UILabel alloc]init];
    //设置frame
    _titleLabel.frame = CGRectMake(_iconImageView.frame.size.width + _iconImageView.frame.origin.x + 10, 10, frame.size.width - (_iconImageView.frame.size.width + _iconImageView.frame.origin.x + 10), 25);
    //设置文字颜色
    _titleLabel.textColor = [UIColor blackColor];
    
    //设置字体
    _titleLabel.font = [UIFont systemFontOfSize:15];
    
    _detailLabel = [[UILabel alloc]init];
    
    _detailLabel.frame = CGRectMake(_titleLabel.frame.origin.x, _titleLabel.frame.origin.y + _titleLabel.frame.size.height + 5, _titleLabel.frame.size.width, 25);
    _detailLabel.textColor = [UIColor blackColor];
    //设置字体
    _detailLabel.font = [UIFont systemFontOfSize:15];
    //设置左对齐
    _detailLabel.textAlignment = NSTextAlignmentLeft;
    
    _priceLabel = [[UILabel alloc]init];
    
    _priceLabel.frame = CGRectMake(_detailLabel.frame.origin.x, _detailLabel.frame.origin.y + _detailLabel.frame.size.height + 5, _detailLabel.frame.size.width, 25);
    
    [self.contentView addSubview:_iconImageView];
    [self.contentView addSubview:_titleLabel];
    [self.contentView addSubview:_detailLabel];
    [self.contentView addSubview:_priceLabel];
    
    /**
     *  contentView系统提供的与cell同样大小的一个空白视图，苹果推荐自定义的控件添加在contentView
     *
     */
}
#pragma mark -刷新cell显示内容
-(void)refreshViewWith:(NSDictionary *)dict
{
    NSString *imageName = [dict objectForKey:@"icon"];
    NSArray *array = [imageName componentsSeparatedByString:@"."];
    //获取路径
    NSString *path = [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@@2x",array[0]] ofType:array[1]];
    //创建图片对象
    UIImage *image = [UIImage imageWithContentsOfFile:path];
    _iconImageView.image = image;
    _titleLabel.text = [dict objectForKey:@"title"];
    
    _detailLabel.text = [dict objectForKey:@"detail"];
    
    _priceLabel.text = [dict objectForKey:@"price"];
}




- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
