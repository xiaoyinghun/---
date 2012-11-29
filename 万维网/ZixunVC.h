//
//  ZixunVC.h
//  万维网
//
//  Created by Ibokan on 12-11-28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyCell.h"
#import <CommonCrypto/CommonDigest.h>
//@interface NSString (MD5)
//@end

//#import "NSString+MD5HexDigest.h"
@interface ZixunVC : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (retain, nonatomic) IBOutlet UIImageView *imag;
@property (retain, nonatomic) IBOutlet UILabel *label;
@property (retain, nonatomic) IBOutlet UILabel *label1;
@property (retain, nonatomic) IBOutlet UIImageView *_imag;
@property (retain, nonatomic) UITableView *_tabview;
@property (retain, nonatomic) MyCell *cell;
@property (retain, nonatomic) NSMutableData *receiveData;
+ (NSString *)md5Digest:(NSString *)str;
@end
