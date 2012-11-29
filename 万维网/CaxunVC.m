//
//  CaxunVC.m
//  万维网
//
//  Created by Ibokan on 12-11-28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CaxunVC.h"

@implementation CaxunVC
@synthesize textfield;
@synthesize imag4;
@synthesize imag3;
@synthesize label1;
@synthesize imag;
@synthesize label;
//查询按钮
- (IBAction)searchbar:(id)sender {
}
//返回按钮
- (IBAction)fanhui:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}
//多域名按钮
- (IBAction)more:(id)sender {
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
    [self setImag3:nil];
    [self setImag4:nil];
    [self setTextfield:nil];
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
    [imag3 release];
    [imag4 release];
    [textfield release];
    [super dealloc];
}
@end
