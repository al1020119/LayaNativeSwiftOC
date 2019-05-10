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
//  SwiftLayaNative
//  ReadingGamesViewController.m
//
//  Created by iCocos on 2019/5/9.
//  Copyright © 2019 com.fiction.jmt. All rights reserved.
//
// @class ReadingGamesViewController
// @abstract <#类的描述#>控制器
// @discussion <#类的功能#>控制器显示与控制
//
//░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
// **************************************************************
#import "ReadingGamesViewController.h"
#import <conchRuntime.h>

@implementation ReadingGamesViewController
{
@public
    
    GLKView*                    m_pGLKView;
    
    EAGLContext*                m_pGLContext;
    
    conchRuntime*               m_pConchRuntime;
}

static ReadingGamesViewController* g_pIOSMainViewController = nil;
//------------------------------------------------------------------------------
+(ReadingGamesViewController*)GetIOSViewController
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
//------------------------------------------------------------------------------
- (void)viewDidLoad
{
    [super viewDidLoad];
    //保持屏幕常亮，可以通过脚本设置
    [[UIApplication sharedApplication] setIdleTimerDisabled:YES];
    self->m_pGLContext = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES3];
    if (self->m_pGLContext)
    {
        NSLog(@"iOS OpenGL ES 3.0 context created");
    }
    else
    {
        self->m_pGLContext = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
        if (self->m_pGLContext)
        {
            NSLog(@"iOS OpenGL ES 2.0 context created");
        }
        else
        {
            NSLog(@"iOS OpenGL ES 2.0 context created failed");
        }
    }
    m_pGLKView = (GLKView *)self.view;
    m_pGLKView.context = self->m_pGLContext;
    m_pGLKView.drawableDepthFormat = GLKViewDrawableDepthFormat24;
    m_pGLKView.drawableStencilFormat = GLKViewDrawableStencilFormat8;
    [EAGLContext setCurrentContext:self->m_pGLContext];
    self.preferredFramesPerSecond = 10000;
    
    //conchRuntime 初始化ConchRuntime引擎
    CGRect frame = UIScreen.mainScreen.bounds;
    m_pConchRuntime = [[conchRuntime alloc]initWithView:m_pGLKView frame:frame EAGLContext:m_pGLContext downloadThreadNum:3];
}
//------------------------------------------------------------------------------
- (void)dealloc
{
    [self tearDownGL];
    if ( [EAGLContext currentContext] == self->m_pGLContext )
    {
        [EAGLContext setCurrentContext:nil];
    }
}
//------------------------------------------------------------------------------
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];

    //conchRuntime 内存警告的时候的处理
    [m_pConchRuntime didReceiveMemoryWarning];
}
//------------------------------------------------------------------------------
- (void)tearDownGL
{
    [EAGLContext setCurrentContext:self->m_pGLContext];
}
//------------------------------------------------------------------------------
- (void)update
{

}
//------------------------------------------------------------------------------
- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect
{
    //conchRuntime renderFrame
    [m_pConchRuntime renderFrame];
}
//-------------------------------------------------------------------------------
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //conchRuntime touch
    [m_pConchRuntime touchesBegan:touches withEvent:event];
}
//-------------------------------------------------------------------------------
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    //conchRuntime touch
    [m_pConchRuntime touchesMoved:touches withEvent:event];
}
//-------------------------------------------------------------------------------
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    //conchRuntime touch
    [m_pConchRuntime touchesEnded:touches withEvent:event];
}
//-------------------------------------------------------------------------------
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    //conchRuntime touch
    [m_pConchRuntime touchesCancelled:touches withEvent:event];
}
//-------------------------------------------------------------------------------
-(NSUInteger)supportedInterfaceOrientations
{
    /*
     UIInterfaceOrientationMaskPortrait,             ===2
     UIInterfaceOrientationMaskPortraitUpsideDown,   ===4
     UIInterfaceOrientationMaskLandscapeLeft,        ===8
     UIInterfaceOrientationMaskLandscapeRight,       ===16
     */
    return [conchConfig GetInstance]->m_nOrientationType;
}
//-------------------------------------------------------------------------------
- (BOOL)shouldAutorotate
{
    return YES;//支持转屏
}
//-------------------------------------------------------------------------------
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.view.frame = m_pConchRuntime->m_currentFrame;
}
@end
