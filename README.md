 ------------------------------------------ 先解压zip ------------------------------------------ 

# LayaNativeSwiftOC
LayaNative与Swift交互，LayaNative与OC

---------------- Swift <--> 实现方案 ---------------- 

现在Swift引入LayaNative方式
+ Swift调用Objective-C
+ OC在调用Objective-C/C++
+ Objective-C/C++再调SDK

详细说明：
1. Swift桥接文件Bridging-Header.h中引入原生OC
2. 原生OC调用Objective-C/C++(mm)
3. Objective-C/C++(mm)引入并调用SDK相关文件

------------ Swift导入LayaNative编译不过 ------------

>报错位置：

>> conchRuntime.h  ->  #import <functional>

错误信息：缺少C++标准库，即：'functional' file not found

1. 经测试新旧项目OC导入正常，新旧项目Swift导入报错
2. Swift与OC桥接，OC再调用执行Laya相关的文件(已经改成mm)
3. Laya相关库，引用，路径，资源已导入

问题描述：
1. 无法知道#import <functional>需要什么系统库的支持
  
同时存在：#import <conchRuntime.h> -> 'conchRuntime.h' file not found

如果Bridge中引入#import "LayaBridgeViewController.h"，就会报
#import <conchRuntime.h> -> 'conchRuntime.h' file not found

- 但是LayaBridgeViewController是OC原生文件
- ReadingGamesViewController才是OC/C++混合文件

### 尝试检测

+ 先可以再试试以下几个方法：
1. 看看是不是有新添加的文件跟之前文件同名
2. 错误信息中出现了某个类的名字，去原文件中看看#import了哪些第三方库，把这些库挨个注释排除，找到出错的那个库，然后按照官方提供的步骤重新添加一遍。
3. SVN或git忽略了某些文件，如.o 等文件没能update下来，查看.o文件可能是红色的，可以重新添加或者修改SVN(git)的忽略设置
4. 把.a文件删除再重新拖到项目中解决问题
5. 可能重复添加了文件（也可能没勾选 Copy items if neded 这个选项），建议删除后重新添加
6. 工程中文件名重复了 也会出现同样的错误
7. ”Build Settings”->”Enable Bitcode”设置为NO ，因为有些SDK不支持Bitcode
8. 可能在引用的时候 可能写的是#import "XXXXX.m" ，如果是改为#import "XXXXX.h"
9. 可能你导入的SDK只能在真机下才能运行，模拟器会报错！
10. 一个类中自定义创建的父类没有implementation部分，在此基础上继承的子类就报这样的错误了
11. 在不同的地方命名了相同的静态变量，不过这个真机调试不报错，模拟器运行的时候报错了。

