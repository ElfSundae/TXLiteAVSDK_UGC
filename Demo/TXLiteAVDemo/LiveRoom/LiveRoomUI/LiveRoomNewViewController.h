//
//  LiveRoomNewViewController.h
//  TXLiteAVDemo
//
//  Created by lijie on 2017/11/22.
//  Copyright © 2017年 Tencent. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LiveRoom.h"

@interface LiveRoomNewViewController : UIViewController

@property (nonatomic, weak)    LiveRoom*         liveRoom;
@property (nonatomic, copy)    NSString*         userName;

@end
