//
//  VideoRecordMusicView.h
//  TXLiteAVDemo
//
//  Created by zhangxiang on 2017/9/13.
//  Copyright © 2017年 Tencent. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol VideoRecordMusicViewDelegate <NSObject>
-(void)onBtnMusicSelected;
-(void)onBtnMusicStoped;
-(void)onBGMValueChange:(UISlider *)slider;
-(void)onVoiceValueChange:(UISlider *)slider;
-(void)onBGMPlayBeginChange;
-(void)onBGMPlayChange:(UISlider *)slider;
@end

@interface VideoRecordMusicView : UIView
@property(nonatomic,weak) id<VideoRecordMusicViewDelegate> delegate;
-(void)setBGMDuration:(CGFloat)duration;
-(void)setBGMPlayTime:(CGFloat)time;
-(void)resetUI;
@end
