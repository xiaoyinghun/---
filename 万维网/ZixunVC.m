//
//  ZixunVC.m
//  万维网
//
//  Created by Ibokan on 12-11-28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ZixunVC.h"
#import "MyCell.h"
#import "JSON.h"

@implementation ZixunVC
@synthesize imag;
@synthesize label;
@synthesize label1;
@synthesize _imag,_tabview,cell,receiveData;
//返回主页
- (IBAction)button:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
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
    self._imag.userInteractionEnabled=YES;
    //segment按钮
    NSArray *arry=[[NSArray alloc]initWithObjects:@"最新",@"行业",@"应用",@"价值",@"安全",nil];
    UISegmentedControl *segmen=[[UISegmentedControl alloc]initWithItems:arry];
    segmen.segmentedControlStyle=UISegmentedControlStylePlain;//设置样式
    segmen.frame=CGRectMake(0, 0, 325,35);
    [segmen addTarget:self action:@selector(Selectbutton:) forControlEvents:UIControlEventValueChanged];
    //tableview
    _tabview=[[UITableView alloc]initWithFrame:CGRectMake(0, 35, 320,405 )];
    _tabview.backgroundColor=[UIColor clearColor];
    [_imag addSubview:segmen];
    //复制 取资讯内容
    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"1.0",@"ver",
                            @"ios",@"client",
                            @"list",@"method",
                            @"news",@"module",
                            @"updated",@"type",
                            @"1",@"pageIndex",
                            @"20",@"pageSize",
                            [self timestamp],@"timestamp",
                            @"IOS259",@"appid",
                            @"qetzcb259",@"appkey",nil];
    //参数按⾸首字⺟母排序
    NSArray *array = [[params allKeys]
                      sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    NSLog(@"array========%@",array);
    //按照参数排序后的顺序,将其对应的value,进⾏行字符串拼接 
    NSMutableString *signStr = [[NSMutableString alloc] init]; 
    for (int i = 0; i < [array count]; i++) {
    NSString *key = [array objectAtIndex:i]; //从排序好的参数数组中,取得key
    NSString *value = [params valueForKey:key]; //从做好的参数字典中,通过 key,取得对应的value
    [signStr insertString:value atIndex:signStr.length]; //将取出的 value,加到字符串⾥里⾯面
}
NSLog(@"signStr======%@",signStr);
NSString *sign = [MD5 md5Digest:signStr];
//将所有的参数和值进⾏行最后的拼接,使⽤用"&"连接 
NSArray *keys = [params allKeys]; NSArray *values = [params allValues];
NSMutableString *paramsStr = [[NSMutableString alloc] init];
for (int i = 0; i < [keys count]; i++) {
    NSString *key = [keys objectAtIndex:i];
    NSString *value = [values objectAtIndex:i];
    [paramsStr appendString:key];
    [paramsStr appendString:@"="];
    [paramsStr appendString:value];
    [paramsStr appendString:@"&"];
}
[paramsStr appendFormat:@"sign=%@",sign];
NSLog(@"%@",paramsStr);  
NSString *urlStr = [NSString stringWithFormat:@"http://zixun.www.net.cn/api/hichinaapp.php?%@",paramsStr];
                    NSURL *url = [NSURL URLWithString:urlStr];
                    NSURLRequest *request = [NSURLRequest requestWithURL:url];
                    [NSURLConnection connectionWithRequest:request delegate:self];
    
    
   
}
//点击segment触发的事件 
-(void)Selectbutton:(UISegmentedControl *)sender{
    int index=sender.selectedSegmentIndex;//定义触发的按钮
    if (index==0) {
        _tabview.delegate=self;
        _tabview.dataSource=self;
        [_imag addSubview:_tabview];
    }
    if (index==1) {
        _tabview.delegate=self;
        _tabview.dataSource=self;
        [_imag addSubview:_tabview];
    }

    if (index==2) {
        _tabview.delegate=self;
        _tabview.dataSource=self;
        [_imag addSubview:_tabview];
    }
    if (index==3) {
        _tabview.delegate=self;
        _tabview.dataSource=self;
        [_imag addSubview:_tabview];
    }
    if (index==4) {
        _tabview.delegate=self;
        _tabview.dataSource=self;
        [_imag addSubview:_tabview];
    }

}
#pragma mark--UITableViewDelegate
//多少行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 5;
}
//行高
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}
//行内容
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *str=@"cell";
    cell=[tableView dequeueReusableCellWithIdentifier:str];
    if (cell==nil) {
        cell=[[MyCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:str];
    }
    
    
    
    
    
    
    
    return cell;
}
//选中行触发方法
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
//此处需要在我们已经写好的MD5类中添加⽅方法
+ (NSString *)md5Digest:(NSString *)str
{
    const char *cStr = [str UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, strlen(cStr), result);
    return [[NSString stringWithFormat:
             @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
             result[0], result[1], result[2], result[3], result[4], result[5],
             result[6], result[7],
             result[8], result[9], result[10], result[11], result[12],
             result[13], result[14], result[15]
             ] uppercaseString];
}
#pragma mark - 关于资讯的单独网络请求 ----开始----
- (void)connection:(NSURLConnection *)connection didReceiveResponse: (NSURLResponse *)response
{
    self.receiveData = [NSMutableData data];
}
- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.receiveData appendData:data];
}
                
- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSMutableString *receiveStr = [[NSMutableString alloc]
                                   initWithData:self.receiveData encoding:NSUTF8StringEncoding];
    //******此处开始 对json字符串进⾏行修改 
    NSRange ra;
    ra = [receiveStr rangeOfString:@"{"]; NSRange delRa;
    delRa.location = 0;
    if (ra.length == 0)
    {
        delRa.length = 0;
    }
    else
    {
        delRa.length = ra.location;
    }
    [receiveStr deleteCharactersInRange:delRa]; //******修改结束
    //转化成可⽤用的字典
   // ￼￼/* 由于此处接收到的data,并不是标准的json格式,所以需要对其进⾏行修改 */
    NSDictionary *dic = (NSDictionary *)[receiveStr mutableObjectFromJSONString];
    NSLog(@"dic%@",dic);
}
- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError*)error
{
    NSLog(@"%@",[error debugDescription]);
}
- (void)viewDidUnload
{
    [self setImag:nil];
    [self setLabel:nil];
    [self setLabel1:nil];
    [self set_imag:nil];
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
    [label1 release];
    [label release];
    [_imag release];
    [super dealloc];
}
@end
