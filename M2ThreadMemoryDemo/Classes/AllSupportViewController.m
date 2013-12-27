//
//  AllSupportViewController.m
//  M2ThreadMemoryDemo
//
//  Created by Chen Meisong on 13-12-19.
//  Copyright (c) 2013年 Chen Meisong. All rights reserved.
//

#import "AllSupportViewController.h"
#import "PrintDeallocObject.h"

@interface AllSupportViewController (){
    PrintDeallocObject *_obj;
}
@end

@implementation AllSupportViewController

- (id)init{
    self = [super init];
    if (self) {
        _obj = [PrintDeallocObject new];
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = randomColor;
	// Do any additional setup after loading the view.
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 70, 300, 0)];
    textLabel.backgroundColor = [UIColor clearColor];
    textLabel.numberOfLines = 0;
    textLabel.font = [UIFont systemFontOfSize:16];
    textLabel.text = @"请直接查看源码及Log，你会发现，无论你将本源文件设置为支持ARC或不支持ARC，AllSupportUseObject对象都能正确的释放。\n本源文件默认会设置为不支持ARC，即-fno-objc-arc，你可以删掉这个设置（或设置为fobjc-arc，不过，这在支持ARC的工程中是没必要的）来查看本类，效果是一样的";
    [textLabel sizeToFit];
    [self.view addSubview:textLabel];
    
    PrintDeallocObject *localObj = [PrintDeallocObject new];
    [self tryReleaseObj:localObj];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 支持ARC与非ARC
- (void)tryReleaseMembers{
#if ! __has_feature(objc_arc)
    [_obj release];
    _obj = nil;
#endif
}
- (void)tryReleaseObj:(id)obj{
#if ! __has_feature(objc_arc)
    [obj release];
#endif
}

#pragma mark -
- (void)dealloc{
    [self tryReleaseMembers];

#if ! __has_feature(objc_arc)
    [super dealloc];
#endif
}

@end
