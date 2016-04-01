//
//  YXAlertController.m
//  yingxing
//
//  Created by 海尔冰箱－智慧小微 on 16/4/1.
//  Copyright © 2016年 test. All rights reserved.
//

#import "YXAlertController.h"

@implementation YXAlertController
+ (instancetype)alertControllerWithTitle:(nullable NSString *)title message:(nullable NSString *)message cancelBlock:(cancelBlock)cancelBlock sureBlock:(sureBlock)sureBlock
{
    YXAlertController *alertVc = [self alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
     alertVc.sureBlock = sureBlock;
     alertVc.cancelBlock = cancelBlock;
     [alertVc addActions];
   return alertVc;
    
}
- (void)addActions{
    __weak typeof(self) weakSelf = self;
    UIAlertAction *actionSure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
     
        if (weakSelf.sureBlock) {
            weakSelf.sureBlock();
        }
        if (weakSelf) {
            [weakSelf dismissViewControllerAnimated:NO completion:nil];
        }
        

    }];
    UIAlertAction *actionCancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
  
        if (weakSelf.cancelBlock) {
            weakSelf.cancelBlock();
        }
        if (weakSelf) {
            
            [weakSelf dismissViewControllerAnimated:NO completion:nil];
        }

    }];

    [self addAction:actionSure];
    [self addAction:actionCancel];
   

}

- (void)dealloc{
   
}
@end
