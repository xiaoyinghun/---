//
//  GuanliVC.m
//  万维网
//
//  Created by Ibokan on 12-11-28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "GuanliVC.h"

@implementation GuanliVC
@synthesize imag;
@synthesize label;
@synthesize label1;
@synthesize label2;
@synthesize imag1;
@synthesize textfield;
@synthesize label3;
@synthesize textfield1;
//返回按钮
- (IBAction)button:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}
//忘记密码
- (IBAction)button1:(id)sender {
    viw=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 460)];
    viw.backgroundColor=[UIColor grayColor];
    UILabel *lab=[[UILabel alloc]init];
    lab.text=@"        亲爱的用户，万网的每一个域名都有一个对应的管理密码，在域名注册时就已生成。如您忘记了该域名的密码。\n请采取以下措施：\n1、如果您是万网网站会员用户，请您登陆网站，在会员中心的域名管理界面中心进行密码重置。\n2、如果您的域名是通过万网代理商取得联进行系咨询和获取密码。";
    lab.backgroundColor=[UIColor clearColor];
    CGSize constraint = CGSizeMake(280, 2000);//label内容设置大小
    CGSize size = [lab.text sizeWithFont:[UIFont systemFontOfSize:14] 
                         constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];
    lab.frame=CGRectMake(20, 120, 280, size.height);
    lab.font=[UIFont systemFontOfSize:14];
    lab.textColor=[UIColor whiteColor];
    lab.lineBreakMode=UILineBreakModeWordWrap;
    lab.numberOfLines=0;
    UIButton *but=[UIButton buttonWithType:0];
    but.frame=CGRectMake(120, 120+size.height+25, 60, 30);
    [but setBackgroundImage:[UIImage imageNamed:@"denglu.png"] forState:UIControlStateNormal];
    [but setTitle:NSLocalizedString( @"确 定", nil) forState:UIControlStateNormal];
    [but addTarget:self action:@selector(queding) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *imgview=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"叹号.png"]];
    imgview.frame=CGRectMake(140, 40, 40, 40);
    
    [self.view addSubview:viw];
    [viw addSubview:lab];
    [viw addSubview:but];
    [viw addSubview:imgview];
  
}
//取消页面
-(void)queding{
    [viw removeFromSuperview];
}
//确定按钮
- (IBAction)button2:(id)sender {
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setImag:nil];
    [self setLabel:nil];
    [self setLabel1:nil];
    [self setImag1:nil];
    [self setLabel2:nil];
    [self setTextfield:nil];
    [self setTextfield1:nil];
    [self setLabel3:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [imag release];
    [label release];
    [label1 release];
    [imag1 release];
    [label2 release];
    [textfield release];
    [textfield1 release];
    [label3 release];
    [super dealloc];
}
@end
