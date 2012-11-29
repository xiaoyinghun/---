//
//  TijianVC.m
//  万维网
//
//  Created by Ibokan on 12-11-28.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "TijianVC.h"

@implementation TijianVC
@synthesize fieldtext;
@synthesize imag1;
@synthesize imag2;
@synthesize imag3;
@synthesize label1;
@synthesize label2;
@synthesize imag4;
@synthesize label3;
@synthesize label4;
@synthesize imag;
@synthesize imall;
@synthesize label;

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

- (IBAction)search:(id)sender {
}
#pragma mark - View lifecycle
- (IBAction)button:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
   
}

- (void)viewDidUnload
{
    [self setLabel:nil];
    [self setImag:nil];
    [self setLabel1:nil];
    [self setLabel2:nil];
    [self setLabel3:nil];
    [self setLabel4:nil];
    [self setImag1:nil];
    [self setImag2:nil];
    [self setImag3:nil];
    [self setImag4:nil];
    [self setFieldtext:nil];
    [self setImall:nil];
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
    [label2 release];
    [label3 release];
    [label4 release];
    [imag1 release];
    [imag2 release];
    [imag3 release];
    [imag4 release];
    [fieldtext release];
    [imall release];
    [super dealloc];
}
@end
