# GetCodeViewController
仿某某获取验证码，并验证方式。提供很多自定义接口，高度自定义。也可以自己更改源代码，界面用xib文件，加自动布局实现，直观易懂。

## 运行项目，请先cd到该目录后，pod update一下，即可运行，因为用到了POP动画库。
#用法

 1. 将 项目中 popCodeViewController 整个文件夹拖到你的项目里面。
 2. 导入依赖库POP动画库
 3. 自定义控制器中，导入GetCodeViewController、PresentingAnimator、DismissingAnimator类
 4. 自定义控制器中，实现以下方法
 

```
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
```
5.调用，实现以下代码即可
```
	GetCodeViewController *getCodeViewController = [GetCodeViewController new];
    getCodeViewController.delegate = self;
    getCodeViewController.transitioningDelegate = self;
    getCodeViewController.modalPresentationStyle = UIModalPresentationCustom;
    [self presentViewController:getCodeViewController
                                            animated:YES
                                          completion:NULL];
```

#版本
支持iOS7.0及以上。
#效果图
![](https://github.com/AsTryE/Images/blob/master/Resoures/submitAnimation.gif)


