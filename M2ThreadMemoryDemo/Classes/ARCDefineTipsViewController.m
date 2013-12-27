//
//  ARCDefineTipsViewController.m
//  M2ThreadMemoryDemo
//
//  Created by Chen Meisong on 13-12-19.
//  Copyright (c) 2013年 Chen Meisong. All rights reserved.
//

#import "ARCDefineTipsViewController.h"

#if ! __has_feature(objc_arc)
#error 本源文件只支持ARC，如果您的工程不支持ARC，请在TARGETS-Build Phases-Compile Sources中找到本文件，在其Compiler Flags中添加-fobjc-arc
#endif

@interface ARCDefineTipsViewController ()

@end

@implementation ARCDefineTipsViewController

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
    
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 70, 300, 200)];
    textLabel.backgroundColor = [UIColor clearColor];
    textLabel.numberOfLines = 0;
    textLabel.font = [UIFont systemFontOfSize:16];
    textLabel.text = @"如果你将工程设置为不支持ARC，或为本文件的Compiler Flags添加-fno-objc-arc，build时你会发现本文件的一个error，error信息会告诉你下一步怎么做";
    [textLabel sizeToFit];
    [self.view addSubview:textLabel];

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
