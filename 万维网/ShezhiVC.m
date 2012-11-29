//
//  ShezhiVC.m
//  万维网
//
//  Created by Ibokan on 12-11-28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ShezhiVC.h"

@implementation ShezhiVC
@synthesize label1;
@synthesize imag;
@synthesize label,_tableview;
//返回按钮
- (IBAction)button:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
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
    self._tableview=[[UITableView alloc]initWithFrame:CGRectMake(0, 44, 320, 420) style:UITableViewStyleGrouped];
    _tableview.delegate=self;
    _tableview.dataSource=self;
    _tableview.scrollEnabled=NO;
    [self.view addSubview:_tableview];
}
//返回一列7行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}
//多少列
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
//列高
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}
//cell中写内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *str=@"cell";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:str];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:str];
    }
    //写入名字
    NSArray *arry=[[NSArray alloc]initWithObjects:@"我的收藏",@"历史记录",@"新手指南",@"版本信息",@"意见反馈",@"微博账号",@"评分",nil];
    cell.textLabel.text=[arry objectAtIndex:indexPath.row];
    return cell;
}
//cell被选中时
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
- (void)viewDidUnload
{
    [self setImag:nil];
    [self setLabel:nil];
    [self setLabel1:nil];
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
    [super dealloc];
}
@end
