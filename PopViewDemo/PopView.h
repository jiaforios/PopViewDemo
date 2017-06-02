//
//  weekDayView.h
//  NVRFunction
//
//  Created by foscom on 16/9/28.
//  Copyright © 2016年 zengjia. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^resultBlock)(NSString *result);

@interface PopView : UIView

+ (instancetype)sharePopViewWithString:(NSString *)string
                           resultBlock:(resultBlock)resultBlock;

@end
