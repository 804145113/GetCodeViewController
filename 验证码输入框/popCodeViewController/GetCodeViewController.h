//
//  GetCodeViewController.h
//  验证码输入框
//
//  Created by GXY on 15/8/17.
//  Copyright (c) 2015年 Tangxianhai. All rights reserved.
//

#import <UIKit/UIKit.h>

#define TIME 60

@class GetCodeViewController;

@protocol GetCodeViewDelegate <NSObject>
@required
/**
 *  设置验证码窗口提示标题
 *
 *  @return
 */
- (NSString *)titleForCodeView;

/**
 *  设置闪烁总时长，不设置，默认 60秒
 *
 *  @return 返回闪烁时间
 */
- (NSInteger)timeCode;

/**
 *  设置获取验证码按钮标题，默认为 重新获取
 *
 *  @return 返回 获取验证码按钮的标题
 */
- (NSString *)titleForCodeButton;

/**
 *  设置是否加载后立即开始动画倒计时，默认为不倒计时
 *
 *  @return
 */
- (BOOL)isStart;

/**
 *  点击取消按钮
 *
 *  @param codeVc 验证码控制器本身
 */
- (void)cancelButton:(GetCodeViewController *)codeVc;
/**
 *  点击确定按钮
 *
 *  @param codeVc 验证码控制器本身
 */
- (void)sureButton:(GetCodeViewController *)codeVc;
/**
 *  点击获取验证码
 *
 *  @param codeVc 控制器本身
 */
- (void)getCodeButton:(GetCodeViewController *)codeVc;

@end

@interface GetCodeViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, assign) id <GetCodeViewDelegate> delegate;

/**
 *  开始倒计时动画
 */
- (void)startTimer;

@end
