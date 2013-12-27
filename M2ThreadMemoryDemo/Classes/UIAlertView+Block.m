//
//  UIAlertView+Block.m
//  M2ThreadMemoryDemo
//
//  Created by Chen Meisong on 13-12-24.
//  Copyright (c) 2013年 Chen Meisong. All rights reserved.
//

#import "UIAlertView+Block.h"

@interface UIAlertView()<UIAlertViewDelegate>
@end

@implementation UIAlertView (Block)

static CancelButtonBlock sCancelButtonBlock = nil;
static OtherButtonBlock sOtherButtonBlock = nil;

+ (void)showAlertViewWithTitle:(NSString*)title
                       message:(NSString*)message
             cancelButtonTitle:(NSString*)cancelButtonTitle
             otherButtonTitles:(NSArray*)otherButtonTitles
             cancelButtonBlock:(CancelButtonBlock)cancelButtonBlock
              otherButtonBlock:(OtherButtonBlock)otherButtonBlock{
    sCancelButtonBlock = [cancelButtonBlock copy];
    sOtherButtonBlock = [otherButtonBlock copy];
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:message
                                                       delegate:self
                                              cancelButtonTitle:cancelButtonTitle
                                              otherButtonTitles:nil];
    for (NSString *buttonTitle in otherButtonTitles) {
        [alertView addButtonWithTitle:buttonTitle];
    }
    [alertView show];
}

#pragma mark - UIAlertViewDelegate
+ (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{// 修改为了类方法
    if (buttonIndex == 0) {
        if (sCancelButtonBlock) {
            sCancelButtonBlock();
        }
    }else{
        if (sOtherButtonBlock) {
            sOtherButtonBlock(buttonIndex - 1);
        }
    }
}

@end
