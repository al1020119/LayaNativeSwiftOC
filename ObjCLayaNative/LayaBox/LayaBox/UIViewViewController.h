//░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
// **************************************************************
//                  http://www.icocos.cn                       //
//                 https://icocos.github.io                    //
//                https://al1020119.github.io                  //
// **************************************************************
//  ************  😂🤔 曹理鹏(梦工厂@iCocos) 🤔😂  ************  //
// **************************************************************
//░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
// **************************************************************
//
//  LayaBox
//  UIViewViewController.h
//
//  Created by iCocos on 2019/5/10.
//  Copyright © 2019 LayaBox. All rights reserved.
//
// @class UIViewViewController
// @abstract <#类的描述#>控制器
// @discussion <#类的功能#>控制器显示与控制
//
//░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
// **************************************************************

#import <UIKit/UIKit.h>
#import "LaunchView.h"

NS_ASSUME_NONNULL_BEGIN

@interface UIViewViewController : UIViewController

+(UIViewViewController*)GetIOSViewController;
-(id)init;

@property (strong, nonatomic) LaunchView *launchView;

@property (nonatomic, copy) NSString *novelID;

@end

NS_ASSUME_NONNULL_END
