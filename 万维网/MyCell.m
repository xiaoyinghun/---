//
//  MyCell.m
//  万维网
//
//  Created by Ibokan on 12-11-29.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "MyCell.h"

@implementation MyCell
@synthesize _lab,_lab1,_lab2,imm;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //文件图片
       imm=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"文件.png"]];
        [self addSubview:imm];
        //公司名
        _lab=[[UILabel alloc]init];
        [self.contentView addSubview:_lab];
        //内容
        _lab1=[[UILabel alloc]init];
        [self.contentView addSubview:_lab1];
        //时间戳
        _lab2=[[UILabel alloc]init];
        [self.contentView addSubview:_lab2];
        
    }
    return self;
}
-(void)prepareForReuse{
    self.imm.frame=CGRectMake(-1000,0, 0, 0);
    self._lab.frame=CGRectMake(-1000, 0, 0, 0);
    self._lab1.frame=CGRectMake(-1000,0, 0, 0);
    self._lab2.frame=CGRectMake(-1000, 0, 0, 0);
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
