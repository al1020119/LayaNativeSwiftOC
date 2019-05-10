#import "ViewController.h"
#import <conchRuntime.h>

@interface ViewController ()
{
@public
    
    GLKView*                    m_pGLKView;
    
    EAGLContext*                m_pGLContext;
    
    conchRuntime*               m_pConchRuntime;
}

@end

@implementation ViewController

static ViewController* g_pIOSMainViewController = nil;
//------------------------------------------------------------------------------
+(ViewController*)GetIOSViewController
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
        NSLog(@"----------------------%s----------------------", __FUNCTION__);
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
    NSLog(@"----------------------%s----------------------", __FUNCTION__);
}
//------------------------------------------------------------------------------
- (void)dealloc
{
    [self tearDownGL];
    if ( [EAGLContext currentContext] == self->m_pGLContext )
    {
        [EAGLContext setCurrentContext:nil];
    }
    NSLog(@"----------------------%s----------------------", __FUNCTION__);
}
//------------------------------------------------------------------------------
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
    //conchRuntime 内存警告的时候的处理
    [m_pConchRuntime didReceiveMemoryWarning];
    NSLog(@"----------------------%s----------------------", __FUNCTION__);
}
//------------------------------------------------------------------------------
- (void)tearDownGL
{
    [EAGLContext setCurrentContext:self->m_pGLContext];
    NSLog(@"----------------------%s----------------------", __FUNCTION__);
}
//------------------------------------------------------------------------------
- (void)update
{
    NSLog(@"----------------------%s----------------------", __FUNCTION__);
}
//------------------------------------------------------------------------------
- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect
{
    //conchRuntime renderFrame
    [m_pConchRuntime renderFrame];
    NSLog(@"----------------------%s----------------------", __FUNCTION__);
}
//-------------------------------------------------------------------------------
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    //conchRuntime touch
    [m_pConchRuntime touchesBegan:touches withEvent:event];
    NSLog(@"----------------------%s----------------------", __FUNCTION__);
}
//-------------------------------------------------------------------------------
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    //conchRuntime touch
    [m_pConchRuntime touchesMoved:touches withEvent:event];
    NSLog(@"----------------------%s----------------------", __FUNCTION__);
}
//-------------------------------------------------------------------------------
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    //conchRuntime touch
    [m_pConchRuntime touchesEnded:touches withEvent:event];
    NSLog(@"----------------------%s----------------------", __FUNCTION__);
}
//-------------------------------------------------------------------------------
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    //conchRuntime touch
    [m_pConchRuntime touchesCancelled:touches withEvent:event];
    NSLog(@"----------------------%s----------------------", __FUNCTION__);
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
    return 2;
    //return [conchConfig GetInstance]->m_nOrientationType;
    NSLog(@"----------------------%s----------------------", __FUNCTION__);
}

//-------------------------------------------------------------------------------
- (BOOL)shouldAutorotate
{
    return YES;//支持转屏
    NSLog(@"----------------------%s----------------------", __FUNCTION__);
}
//-------------------------------------------------------------------------------
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.view.frame = m_pConchRuntime->m_currentFrame;
    NSLog(@"----------------------%s----------------------", __FUNCTION__);
}
@end
