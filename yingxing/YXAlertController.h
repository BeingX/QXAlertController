//
//  YXAlertController.h
//  yingxing
//
//  Created by 海尔冰箱－智慧小微 on 16/4/1.
//  Copyright © 2016年 test. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^cancelBlock)();
typedef void(^sureBlock)();
@interface YXAlertController : UIAlertController

@property (nullable,nonatomic,copy)cancelBlock cancelBlock;
@property (nullable,nonatomic,copy)sureBlock sureBlock;
+ (nullable instancetype)alertControllerWithTitle:(nullable NSString *)title message:(nullable NSString *)message cancelBlock:(nullable cancelBlock)cancelBlock sureBlock:(nullable sureBlock)sureBlock;
@end
