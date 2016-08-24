//
//  HomeCell.h
//  CYLTabBarController
//
//  Created by xiayuanquan on 16/1/30.
//  Copyright © 2016年 mac. All rights reserved.
//

#import <UIKit/UIKit.h>

@class WBStatusFrame;
@interface HomeCell : UITableViewCell

@property (strong,nonatomic)WBStatusFrame *wbStatusFrame;

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier;

@end
