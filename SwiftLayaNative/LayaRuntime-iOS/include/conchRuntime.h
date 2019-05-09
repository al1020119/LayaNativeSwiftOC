/**
 @file			conchRuntime.h
 @brief         runtime类
 @author		James
 @version		1.0
 @date			2015_8_28
 @company       LayaBox
 */
#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>
#import "PlatformInterface/LayaPlatformInterface.h"
#import "conchConfig.h"
#import <functional>
//https://www.jianshu.com/p/1fff427c11da

// 同 'string' file not found
//原因就是文件后缀应该从.m改为.mm,这样就支持 c++混编了，必须将引用到c++混编的AAA.h的所有文件后缀都改为.mm，否则还是会编译不过。所以，为了保险，我一般将所以的文件后缀都全部改为.mm.
//c++ Standard Library的选择
//
//如果你在 summary 中 的Deployment  Target 中选择了4.3，而不是XCode默认的6.0,那么你在 混编C++的时候还可能会遇到另外一个错误：
//
//clang: error: invalid deployment target for -stdlib=libc++ (requires iOS 5.0 or later)
//
//clang failed with exit code 1
//
//原因是 XCode 的 Build Setting中 的 C++  Standard  Library默认选择了
//
//libc++ (LLVM C++ standard library with c++11 support)选项，这个表示支持c++11的最新特新，
//
//但是它只支持ios5以上，所以如果要使用这个选项，有两个选择：
//
//第1个选择就是 将Deployment Target中 改为5.0以上，一般不会这样，因为我们一般想支持的sdk越低越好，尽量支持低版本的ios设备。
//
//第2个选择就是 将这个 C++ Standard Library选项改为 libstdc++ (GNU  c++  standard  library ),它支持最低到4.3 .

typedef char* (*HandleFileData)(const char* data, int& len);

class JCTouchFilter;
@class LayaReachability;
@class JCMp3Player;
@class LayaWebView;
@class LayaEditBox;
@class LayaEditBoxDelegate;
@class LayaAlert;
@class UIAssistantTouch;
@class Reflection;

@interface FuncObj : NSObject
{
@public
    std::function<void(void)> m_Fuction;
};
-(id)init:(std::function<void(void)>)func;
@end

@interface conchRuntime : NSObject
{
@public
    
    GLKView*                    m_pGLKView;
    
    EAGLContext*                m_pGLContext;
    
    bool                        m_bEngineInited;
    
    //-----------------------------------------------------------------
    //touch用的
    JCTouchFilter*              m_pTouchFilter;
    
    UITouch*                    m_vTouch[10];
    
    int                         m_nTouchCount;
    
    //-----------------------------------------------------------------
    //editBox相关的
    int                         m_nGLViewOffset;        //因为editBox导致得移动
    
    LayaEditBox*                m_pEditBox;             //EditBox
    
    LayaEditBoxDelegate*        m_pEditBoxDelegate;     //eiditBoxDelegate
    
    //-----------------------------------------------------------------
    
    JCMp3Player*                m_pMp3Player;           //MP3播放器
    
    id<LayaPlatformInterface>   m_pMarket;              //市场类，比如91，appStore
    
    //界面相关的
    //-----------------------------------------------------------------
    
    LayaWebView*                m_pWebView;             //webView
    
    LayaReachability*           m_pNetworkListener;     //网络监听
    
    UIAssistantTouch*           m_pAssistantTouch;
    //-----------------------------------------------------------------
    
    float                       m_fRetinaValue;         //Retina的缩放比例
    
    NSString*                   m_nsRootResourcePath;   //Resoure的路径
    
    NSString*                   m_nsRootCachePath;      //Cache的根路径
    
    CGPoint*                    m_pResolution;          //当前分辨率
    
    float                       m_fIOSVersion;          //ios设备的版本
    
    NSTimer*                    m_pNSTimer;             //定时器
    
    bool                        m_bIgnoreCurEvent;
    
    LayaAlert*                  m_pLayaAlert;

    Reflection*                 m_pReflection;
    
    int                         m_nCurrentOrientation;
    
    bool                        m_bStopEngine;
    
    NSRunLoop*                  m_pJSRunLoop;
    
    CGRect                      m_initFrame;
    CGRect                      m_currentFrame;
}


//全局的MainView
+(conchRuntime*)GetIOSConchRuntime;
-(id)initWithView:(GLKView*)pGLView frame:(CGRect)frame EAGLContext:(EAGLContext*) pGLContext downloadThreadNum:(int)nDownloadThreadNum;
-(id)initWithView:(GLKView*)pGLView frame:(CGRect)frame EAGLContext:(EAGLContext*) pGLContext downloadThreadNum:(int)nDownloadThreadNum URL:(NSString*)pUrl;
-(void)setConchRuntimeParam:(GLKView*)pGLView EAGLContext:(EAGLContext*) pGLContext downloadThreadNum:(int)nDownloadThreadNum;
-(void)didReceiveMemoryWarning;
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event;
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event;
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event;
-(void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event;
-(void)renderFrame;
-(void)onVsync:(double)vsyncTmMs;
-(int)checkNetworkState;
-(NSString*)getRootCachePath;
-(NSString*)getResourcePath;
-(void) setScreenOrientation:(int)p_nType;
-(void)reset;
-(void)callMethod:(int)objid className:(NSString*)cls methodName:(NSString*)method param:(NSString*)param;
-(void)callbackToJSWithClass:(Class)cls methodName:(NSString*)name ret:(NSObject*)retObj;
-(void)callbackToJSWithClassName:(NSString*)cls methodName:(NSString*)name ret:(NSObject*)retObj;
-(void)callbackToJSWithObject:(id)obj methodName:(NSString*)name ret:(NSObject*)retObj;
-(void)runJS:(NSString*)script;
-(void)setFileDataHandler:(HandleFileData)func;
-(void)destory;
-(void)runJsLoop;
-(void)runFunc:(NSTimer*)timer;
@end
