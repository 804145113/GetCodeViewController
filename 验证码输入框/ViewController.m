//
//  ViewController.m
//  验证码输入框
//
//  Created by GXY on 15/8/17.
//  Copyright (c) 2015年 Tangxianhai. All rights reserved.
//

#import "ViewController.h"
#import "PresentingAnimator.h"
#import "DismissingAnimator.h"
#import "GetCodeViewController.h"

@interface ViewController () <UIViewControllerTransitioningDelegate,GetCodeViewDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)getCode:(UIButton *)sender {
    GetCodeViewController *getCodeViewController = [GetCodeViewController new];
    getCodeViewController.delegate = self;
    getCodeViewController.transitioningDelegate = self;
    getCodeViewController.modalPresentationStyle = UIModalPresentationCustom;
    
    [self presentViewController:getCodeViewController
                                            animated:YES
                                          completion:NULL];
}

#pragma mark - GetCodeViewDelegate Method

- (NSString *)titleForCodeView {
    return [NSString stringWithFormat:@"验证码已发送至您手机187*****1234"];
}

- (NSString *)titleForCodeButton {
    return @"获取验证码";
}

- (NSInteger)timeCode {
    return 120;
}

/**
 *  可以在这个方法里面做一些网络请求操作，比如说点击重新获取验证码，
 *  成功后调用 [codeVc startTimer]，开始倒计时，进行新一轮的验证码验证。
 */
- (void)getCodeButton:(GetCodeViewController *)codeVc {
    [codeVc startTimer];
}

- (BOOL)isStart {
    return NO;
}

- (void)cancelButton:(GetCodeViewController *)codeVc {
    [codeVc dismissViewControllerAnimated:YES completion:nil];
}

- (void)sureButton:(GetCodeViewController *)codeVc {
    NSLog(@"确 定");
}

#pragma mark - UIViewControllerTransitioningDelegate

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting
                                                                      sourceController:(UIViewController *)source
{
    return [PresentingAnimator new];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed
{
    return [DismissingAnimator new];
}


@end
