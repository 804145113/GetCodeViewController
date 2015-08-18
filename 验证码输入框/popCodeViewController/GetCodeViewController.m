//
//  GetCodeViewController.m
//  验证码输入框
//
//  Created by GXY on 15/8/17.
//  Copyright (c) 2015年 Tangxianhai. All rights reserved.
//

#import "GetCodeViewController.h"

@interface GetCodeViewController ()

@property (nonatomic, weak) IBOutlet UIImageView *imageView_getCode_border;
@property (nonatomic, weak) IBOutlet UIButton *button_getCode;
@property (nonatomic, weak) IBOutlet UILabel *label_alertTitle;
@property (nonatomic, weak) IBOutlet UITextField *textField_code;

@end

@implementation GetCodeViewController {
    NSTimer *timer;
    NSInteger time;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self instance];
}

- (void)instance {
    UIImage *imageCode = [UIImage imageNamed:@"getCode"];
    _imageView_getCode_border.image = [imageCode stretchableImageWithLeftCapWidth:1.f topCapHeight:1.f];
    [_button_getCode setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_button_getCode setBackgroundColor:[UIColor orangeColor]];
    [_button_getCode setUserInteractionEnabled:YES];
    
    _textField_code.delegate = self;
    if (_delegate != nil) {
        _label_alertTitle.text = [_delegate titleForCodeView];
    }
    
    // 默认点击才开始动画倒计时
    if (_delegate != nil) {
        if ([_delegate isStart]) {
            [self startTimer];
        }
    }
}

- (IBAction)getCode:(UIButton *)sender {
    if (_delegate != nil) {
        [_delegate getCodeButton:self];
    }
}

- (void)titleForTime:(NSTimer *)currentTimer {
    [_button_getCode setTitle:[NSString stringWithFormat:@"%ld秒",time] forState:UIControlStateNormal];
    [_button_getCode setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [_button_getCode setBackgroundColor:[UIColor lightGrayColor]];
    [_button_getCode setUserInteractionEnabled:NO];
    time --;
    if (time == 0) {
        // 默认为 重新获取
        if (_delegate != nil) {
            [_button_getCode setTitle:[_delegate titleForCodeButton] forState:UIControlStateNormal];
        }
        else {
            [_button_getCode setTitle:[NSString stringWithFormat:@"重新获取"] forState:UIControlStateNormal];
        }
        [_button_getCode setBackgroundColor:[UIColor orangeColor]];
        [_button_getCode setUserInteractionEnabled:YES];
        [currentTimer invalidate];
    }
}

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if ([UIScreen mainScreen].bounds.size.height < 568.f) {
        CGRect rect = self.view.frame;
        rect.origin.y -= 76.f;
        self.view.frame = rect;
    }
}

- (void)startTimer {
    if (timer.valid) {
        [timer invalidate];
        timer = nil;
    }
    if (_delegate != nil) {
        time = [_delegate timeCode];
    }
    else {
        // 默认60秒
        time = 60;
    }
    timer = [NSTimer scheduledTimerWithTimeInterval:1.f target:self selector:@selector(titleForTime:) userInfo:nil repeats:YES];
    [timer fire];
}

- (IBAction)cancelAction:(UIButton *)sender {
    if (_delegate != nil) {
        [_delegate cancelButton:self];
    }
}

- (IBAction)sureAction:(UIButton *)sender {
    if (_delegate != nil) {
        [_delegate sureButton:self];
    }
}

@end
