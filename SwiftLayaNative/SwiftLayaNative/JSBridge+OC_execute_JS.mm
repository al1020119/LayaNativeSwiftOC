////
////  JSBridge+OC_execute_JS.m
////  LayaBox
////
////  Created by iCocos on 2019/5/9.
////  Copyright © 2019 LayaBox. All rights reserved.
////
//
//#import "JSBridge+OC_execute_JS.h"
//#import "ViewController.h"
//
//@implementation JSBridge (OC_execute_JS)
//
///**
//1.读档完毕
////参数为读档实体json
//实体json参考： http://192.168.1.201:8900/play/readingstore.html
//NativeBridge.showReadStore(storeJson: String)
//@param name <#name description#>
//*/
//+ (void)showReadStore:(NSString *)storeJson {
//    [[conchRuntime GetIOSConchRuntime] runJS:@"showReadStore"];
//}
//
///**
//2.章节支付成功
////不用传参数，记得关闭支付界面
//NativeBridge.showPaySuc()
//@param name <#name description#>
//*/
//+ (void)showPaySuc {
//    [[conchRuntime GetIOSConchRuntime] runJS:@"showPaySuc"];
//}
//
///**
//3.下一大章/继续阅读
////章节过渡界面调用，点击 继续阅读btn 调用
//NativeBridge.showNextChapter()
//@param name <#name description#>
//*/
//+ (void)showNextChapter {
//    [[conchRuntime GetIOSConchRuntime] runJS:@"showNextChapter"];
//}
//
///**
//4.登录完成回调
////参数为用户实体Json
//NativeBridge.showLogin(userJson: String)
//@param name <#name description#>
//*/
//+ (void)showLogin:(NSString *)userJson {
//    [[conchRuntime GetIOSConchRuntime] runJS:@"showLogin"];
//}
//
///**
//5.弹窗点击状态回调
////原生根据用户点击，点击确定，调用Laya方法
//NativeBridge.showDialogSuc(type: Int)
//@param name <#name description#>
//*/
//+ (void)showDialogSuc:(NSString *)type {
//    [[conchRuntime GetIOSConchRuntime] runJS:@"showDialogSuc"];
//}
//
///**
//6.重读本章
//NativeBridge.showRetryChapter()
//@param name <#name description#>
//*/
//+ (void)showRetryChapter {
//    [[conchRuntime GetIOSConchRuntime] runJS:@"showRetryChapter"];
//}
//
///**
//7.获取状态栏高度完毕
//NativeBridge.showStatusHeight(height: Int)
//@param name <#name description#>
//*/
//+ (void)showStatusHeight:(NSString *)height {
//    [[conchRuntime GetIOSConchRuntime] runJS:@"showStatusHeight"];
//}
//
///**
//8.评论成功回调，改变更多弹窗的  评论数
//关闭评论页面，回调该方法
////用户添加了评论就会回调
//NativeBridge.showCommentPlus()
//@param name <#name description#>
//*/
//+ (void)showCommentPlus {
//    [[conchRuntime GetIOSConchRuntime] runJS:@"showCommentPlus"];
//}
//
///**
//9.同步存档
////点击关闭阅读界面的时候进行调用
//NativeBridge.asyncStore()
//@param name <#name description#>
//*/
//+ (void)asyncStore {
//    [[conchRuntime GetIOSConchRuntime] runJS:@"asyncStore"];
//}
//
///**
//10重读小说
//fun showRetryNovel()
//@param name <#name description#>
//*/
//+ (void)showRetryNovel {
//    [[conchRuntime GetIOSConchRuntime] runJS:@"showRetryNovel"];
//}
//
//@end
