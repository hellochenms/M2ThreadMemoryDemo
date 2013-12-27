//
//  BlockAlertViewController.m
//  M2ThreadMemoryDemo
//
//  Created by Chen Meisong on 13-12-24.
//  Copyright (c) 2013年 Chen Meisong. All rights reserved.
//

#import "BlockAlertViewController.h"
#import "UIAlertView+Block.h"

@interface BlockAlertViewController ()

@end

@implementation BlockAlertViewController

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
    UIButton *showAlertButton = [UIButton buttonWithType:UIButtonTypeCustom];
    showAlertButton.frame = CGRectMake(10, 10, 300, 50);
    showAlertButton.backgroundColor = [UIColor blueColor];
    showAlertButton.titleLabel.font = [UIFont systemFontOfSize:14];
    [showAlertButton setTitle:@"开始动画" forState:UIControlStateNormal];
    [showAlertButton addTarget:self action:@selector(onTapShowAlert) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:showAlertButton];
}

- (void)onTapShowAlert{
    [UIAlertView showAlertViewWithTitle:@"title"
                                message:@"message"
                      cancelButtonTitle:@"取消"
                      otherButtonTitles:@[@"1", @"2"]
                      cancelButtonBlock:^{
                          NSLog(@"取消  @@%s", __func__);
                      }
                       otherButtonBlock:^(int index) {
                           NSLog(@"index(%d)  @@%s", index, __func__);
                       }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
