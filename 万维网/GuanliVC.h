//
//  GuanliVC.h
//  万维网
//
//  Created by Ibokan on 12-11-28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GuanliVC : UIViewController
{
    UIView *viw;
}
@property (retain, nonatomic) IBOutlet UIImageView *imag;
@property (retain, nonatomic) IBOutlet UILabel *label;
@property (retain, nonatomic) IBOutlet UILabel *label1;
@property (retain, nonatomic) IBOutlet UILabel *label2;
@property (retain, nonatomic) IBOutlet UIImageView *imag1;
@property (retain, nonatomic) IBOutlet UITextField *textfield;//输入域名
@property (retain, nonatomic) IBOutlet UILabel *label3;
@property (retain, nonatomic) IBOutlet UITextField *textfield1;//输入密码

@end
