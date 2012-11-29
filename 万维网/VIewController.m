//
//  VIewController.m
//  万维网
//
//  Created by Ibokan on 12-11-27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "VIewController.h"
#import "TijianVC.h"
#import "YumingVXC.h"
#import "ZixunVC.h"
#import "GuanliVC.h"
#import "CaxunVC.h"
#import "ShezhiVC.h"
@implementation VIewController
@synthesize carousel,view1;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    //主视图
    self.carousel=[[iCarousel alloc]initWithFrame:CGRectMake(0, 0, 320, 480)];
    carousel.delegate=self;
    carousel.dataSource=self;
    carousel.type=iCarouselTypeRotary;//圆形
    //背景图片
    UIImageView *_imag=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"background_home.png"]];
    _imag.frame=CGRectMake(0, 0, 320, 480);
    
    //广告滑动视图
    UIScrollView *_scroll=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 360, 640, 80)];
    _scroll.backgroundColor=[UIColor redColor];
    
    
    
    [self.view addSubview:_imag];
    [carousel addSubview:_scroll];
    [self.view addSubview:carousel];
} 
#pragma mark -
//显示几个图片
- (NSUInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return 6;
}

- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSUInteger)index
{
    self.view1 = [[UIImageView alloc]init];
    
       switch (index) {
        case 0:
            view1.image=[UIImage imageNamed:@"monitor_home.png"];
            break;
        case 1:
            view1.image=[UIImage imageNamed:@"infor_home.png"];           
            break;
        case 2:
            view1.image=[UIImage imageNamed:@"exam_home.png"];
            break;
        case 3:
            view1.image=[UIImage imageNamed:@"con_home.png"];
            break;
        case 4:
            view1.image=[UIImage imageNamed:@"check_home.png"];
            break;
        case 5:
            view1.image=[UIImage imageNamed:@"seting_home.png"];
            break;
        default:
            break;
    }
     view1.frame = CGRectMake(0, 0,95, 95);
//    for (int i=0; i<6; i++) {
//        float tmpy =(float)(view1.center.y-50)+ 100*cos(2.0*M_PI *i/6);
//        float tmpx =(float)(view1.center.x)+100*sin(2.0*M_PI *i/6);
//         NSLog(@"%f~~~~~%f",tmpx,tmpy);
//        view1.center=CGPointMake(tmpx, tmpy);        
//    }
    return view1;
}
//从0开始
- (NSUInteger)numberOfPlaceholdersInCarousel:(iCarousel *)carousel
{
	return 0;
}
//有几个框
- (NSUInteger)numberOfVisibleItemsInCarousel:(iCarousel *)carousel
{
    return 6;
}

- (CGFloat)carouselItemWidth:(iCarousel *)carousel
{
    return 170;
}

- (CATransform3D)carousel:(iCarousel *)_carousel transformForItemView:(UIView *)view withOffset:(CGFloat)offset
{
    view.alpha = 1.0 - fminf(fmaxf(offset, 0.0), 1.0);
    
    CATransform3D transform = CATransform3DIdentity;
    transform.m34 = self.carousel.perspective;
    transform = CATransform3DRotate(transform, M_PI / 8.0, 0, 1.0, 0);
    return CATransform3DTranslate(transform, 0.0, 0.0, offset * carousel.itemWidth);
}
- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index
{
    if (index==0) {
        YumingVXC *yuming=[[YumingVXC alloc]init];
        [self presentModalViewController:yuming animated:YES];
    }
    if (index==1) {
        ZixunVC *zixun=[[ZixunVC alloc]init];
        [self presentModalViewController:zixun animated:YES];
    }
    if (index==2) {
        TijianVC *tijian=[[TijianVC alloc]init];
        [self presentModalViewController:tijian animated:YES];
    }
    if (index==3) {
        GuanliVC *guanli=[[GuanliVC alloc]init];
        [self presentModalViewController:guanli animated:YES];
    }
    if (index==4) {
        CaxunVC *caxun=[[CaxunVC alloc]init];
        [self presentModalViewController:caxun animated:YES];
    }
    if (index==5) {
        ShezhiVC *shezhi=[[ShezhiVC alloc]init];
        [self presentModalViewController:shezhi animated:YES];
    }
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    self.carousel=nil;
}
-(void)dealloc{
    [carousel release];
    [super dealloc];
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
@end
