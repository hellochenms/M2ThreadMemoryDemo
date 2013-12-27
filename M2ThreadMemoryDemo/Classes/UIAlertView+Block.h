//
//  UIAlertView+Block.h
//  M2ThreadMemoryDemo
//
//  Created by Chen Meisong on 13-12-24.
//  Copyright (c) 2013年 Chen Meisong. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^CancelButtonBlock) (void);
typedef void (^OtherButtonBlock) (int index);

@interface UIAlertView (Block)
+ (void)showAlertViewWithTitle:(NSString*)title
                       message:(NSString*)message
             cancelButtonTitle:(NSString*)cancelButtonTitle
             otherButtonTitles:(NSArray*)otherButtonTitles
             cancelButtonBlock:(CancelButtonBlock)cancelButtonBlock
              otherButtonBlock:(OtherButtonBlock)otherButtonBlock;
@end
