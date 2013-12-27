//
//  TopFreeBridgingViewController.m
//  M2ThreadMemoryDemo
//
//  Created by Chen Meisong on 13-12-19.
//  Copyright (c) 2013年 Chen Meisong. All rights reserved.
//

#import "TopFreeBridgingViewController.h"

@interface TopFreeBridgingViewController ()

@end

@implementation TopFreeBridgingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.view.backgroundColor = randomColor;
	// Do any additional setup after loading the view.
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 70, 300, 0)];
    textLabel.backgroundColor = [UIColor clearColor];
    textLabel.numberOfLines = 0;
    textLabel.font = [UIFont systemFontOfSize:16];
    textLabel.text = @"请直接查看源码";
    [textLabel sizeToFit];
    [self.view addSubview:textLabel];
    
    // 从foundation到cf
    NSString *string = [NSString stringWithFormat:@"oc string"];
    CFStringRef cfString = CFBridgingRetain(string);//retain，CF不在ARC管理范围内，桥接时要自己retain
    NSLog(@"cfString(%@)  @@%s", cfString, __func__);
    CFRelease(cfString);// release CF不在ARC管理范围内，要自己release
    
    // 从cf到foundation
    CFStringRef cfStringB = CFSTR("c string");
    NSString *stringB = CFBridgingRelease(cfStringB);// release，CF不在ARC管理范围内，此句在桥接后将cfStringB release
    // 上句若在非ARC中理解，就好比是 stringB = [cfStringB retain]; 再CFRelease(cfStringB)
    NSLog(@"string(%@)  @@%s", stringB, __func__);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
