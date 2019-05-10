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
//  UIViewViewController.m
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

#import "UIViewViewController.h"

#import "ViewController.h"

@interface UIViewViewController ()

@end

@implementation UIViewViewController

static UIViewViewController* g_pIOSMainViewController = nil;
//------------------------------------------------------------------------------
+(UIViewViewController*)GetIOSViewController
{
    return g_pIOSMainViewController;
}

//------------------------------------------------------------------------------
-(id)init
{
    self = [super init];
    if( self != nil )
    {
        g_pIOSMainViewController = self;
        return self;
    }
    return Nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    ViewController *vc = [[ViewController alloc] init];
    vc.novelID = self.novelID;
    [self.view addSubview:vc.view];
    [self addChildViewController:vc];
    
    _launchView = [[LaunchView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [vc.view addSubview:_launchView.view];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
