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
//  ReadingGamesViewController.h
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

#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>
#import <conchRuntime.h>

@interface ReadingGamesViewController : GLKViewController
{
@public
    
    GLKView*                    m_pGLKView;
    
    EAGLContext*                m_pGLContext;
    
    conchRuntime*               m_pConchRuntime;
}
+(ReadingGamesViewController*)GetIOSViewController;
-(id)init;
@end

///clang:-1: linker command failed with exit code 1 (use -v to see invocation)
//总结一下这个可能存在的原因：
//1、工程中文件名重复、重复引入头文件（用 cocoapods 的时候有可能造成重复）；
//2、.a 文件重复或者缺失（用 SVN 时候有可能导致缺失）；
//3、Other Linker Flags 下的属性改为 -all_load (或者下边的属性都删除)；（在TARGETS --> Build Setting --> Other Linker Flags）
//4、Build Setting --> Enable Bitcode 设置为 No；
//5、Build Setting --> Architectures --> Build Active Architecture Only 把 Yes 改为 No；

//1，看看是不是有新添加的文件跟之前文件同名
//
//2，错误信息中出现了某个类的名字，去原文件中看看#import了哪些第三方库，把这些库挨个注释排除，找到出错的那个库，然后按照官方提供的步骤重新添加一遍。
//
//3.SVN或git忽略了某些文件，如.o 等文件没能update下来，查看.o文件可能是红色的，可以重新添加或者修改SVN(git)的忽略设置
//
//4.把.a文件删除再重新拖到项目中解决问题
//
//5.可能重复添加了文件（也可能没勾选 Copy items if neded 这个选项），建议删除后重新添加
//
//6.工程中文件名重复了 也会出现同样的错误
//
//7.”Build Settings”->”Enable Bitcode”设置为NO ，因为有些SDK不支持Bitcode
//
//8.可能在引用的时候 可能写的是#import "XXXXX.m" ，如果是改为#import "XXXXX.h"
//
//9.可能你导入的SDK只能在真机下才能运行，模拟器会报错！


//先可以再试试以下几个方法：
//
//1.看看是不是有新添加的文件跟之前文件同名
//
//
//2.错误信息中出现了某个类的名字，去原文件中看看#import了哪些第三方库，把这些库挨个注释排除，找到出错的那个库，然后按照官方提供的步骤重新添加一遍。
//
//
//3.SVN或git忽略了某些文件，如.o 等文件没能update下来，查看.o文件可能是红色的，可以重新添加或者修改SVN(git)的忽略设置
//
//
//4.把.a文件删除再重新拖到项目中解决问题
//
//
//5.可能重复添加了文件（也可能没勾选 Copy items if neded 这个选项），建议删除后重新添加
//
//
//6.工程中文件名重复了 也会出现同样的错误
//
//
//7.”Build Settings”->”Enable Bitcode”设置为NO ，因为有些SDK不支持Bitcode
//
//
//8.可能在引用的时候 可能写的是#import "XXXXX.m" ，如果是改为#import "XXXXX.h"
//
//
//9.可能你导入的SDK只能在真机下才能运行，模拟器会报错！
//
//
//10.一个类中自定义创建的父类没有implementation部分，在此基础上继承的子类就报这样的错误了
//
//
//11.在不同的地方命名了相同的静态变量，不过这个真机调试不报错，模拟器运行的时候报错了。

