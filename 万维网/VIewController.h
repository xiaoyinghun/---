//
//  VIewController.h
//  万维网
//
//  Created by Ibokan on 12-11-27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "iCarousel.h"
@interface VIewController : UIViewController<iCarouselDelegate,iCarouselDataSource>
@property(retain,nonatomic)iCarousel *carousel;
@property(retain,nonatomic)UIImageView *view1;//6个小圆视图
@end
