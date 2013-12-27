//
//  AllSupportUseObject.m
//  M2ThreadMemoryDemo
//
//  Created by Chen Meisong on 13-12-19.
//  Copyright (c) 2013年 Chen Meisong. All rights reserved.
//

#import "PrintDeallocObject.h"

@implementation PrintDeallocObject

#pragma mark -
- (void)dealloc{
    NSLog(@"%@  @@%s", self, __func__);
}
@end
