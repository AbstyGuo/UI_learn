//
//  MyCell.m
//  day08_homeWork
//
//  Created by MS on 15-12-2.
//  Copyright (c) 2015年 肖凯. All rights reserved.
//

#import "MyCell.h"

@implementation MyCell
{
    UILabel *_nameLabel;
    UILabel *_agelabel;
    UILabel *_textNumLabel;
    NSString *_name;
    NSInteger _age;
    NSInteger _text;
    NSMutableArray *_dataSource;
}
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createSubViews];
    }
    return self;
}
-(void)createSubViews{
    CGRect frame = self.contentView.frame;
    _nameLabel =[[UILabel alloc]init];
    _nameLabel.frame = CGRectMake(5,15,frame.size.width,25);
    _nameLabel.textColor = [UIColor blackColor];
    _nameLabel.font = [UIFont systemFontOfSize:15];
   

    
    
    _agelabel =[[UILabel alloc]init];
    _agelabel.frame = CGRectMake(5,45,frame.size.width,25);
    _agelabel.textColor = [UIColor blackColor];
    _agelabel.font = [UIFont systemFontOfSize:15];
    
    
    
    _textNumLabel =[[UILabel alloc]init];
    _textNumLabel.frame = CGRectMake(5,75,frame.size.width,25);
    _textNumLabel.textColor = [UIColor blackColor];
    _textNumLabel.font = [UIFont systemFontOfSize:15];
    


    [self.contentView addSubview:_nameLabel];
    [self.contentView addSubview:_agelabel];
    [self.contentView addSubview:_textNumLabel];
}
-(void)refreshViewWith:(NSMutableArray *)dataSource{
    _dataSource = dataSource;
    for (NSMutableArray *array in dataSource) {
        _nameLabel.text = [NSString stringWithFormat:@"姓名:%@",array[0]];
        _agelabel.text = [NSString stringWithFormat:@"年龄:%@",array[1]];
        
        _textNumLabel.text = [NSString stringWithFormat:@"成绩:%@",array[2]];
    }
    

}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
