//
//  WBPhotosView.h
//  CYLTabBarController
//
//  Created by xiayuanquan on 16/1/31.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WBStatus.h"
#import "RetweetedWBStatus.h"

@interface WBPhotosView : UIView
@property (strong,nonatomic)WBStatus *status;
@property (strong,nonatomic)RetweetedWBStatus *retweetedStatus;
@end
