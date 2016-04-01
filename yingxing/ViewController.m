//
//  ViewController.m
//  yingxing
//
//  Created by 海尔冰箱－智慧小微 on 16/4/1.
//  Copyright © 2016年 test. All rights reserved.
//

#import "ViewController.h"
#import "YXAlertController.h"
#import <objc/runtime.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    [self alertViewTest2];
    [self runTimetest1];
}
- (void)alertViewTest1{
    UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:@"小贴士" message:@"坚实的护肤环节开始的返回接口" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *actionSure = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"确定");
    }];
    UIAlertAction *actionCancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"取消");
    }];
    [alertVc addAction:actionSure];
    [alertVc addAction:actionCancel];
    [self presentViewController:alertVc animated:YES completion:nil];
}
- (void)alertViewTest2{
    __weak typeof(self) weakSelf = self;
    YXAlertController *vc = [YXAlertController alertControllerWithTitle:@"小贴士" message:@"坚实的护肤环节开始的返回接口" cancelBlock:^{
        NSLog(@"取消");
    } sureBlock:^{
        NSLog(@"确定");
    }];
#warning 此处有内存泄漏  未解决
    [vc addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
//        textField.delegate = weakSelf;
    }];
    [self presentViewController:vc animated:YES completion:nil];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)runTimetest1{
    unsigned int count;
  Ivar *ivarList =  class_copyIvarList([YXAlertController class], &count);
    NSString *name1 = [NSString stringWithUTF8String:ivar_getName(ivarList[0])];
    NSLog(@"%d",count);
}
@end
