////
////  JSBridge+JS_execute_OC.m
////  LayaBox
////
////  Created by iCocos on 2019/5/9.
////  Copyright © 2019 LayaBox. All rights reserved.
////
//
////阅读模块，测试着重点
////一、新增功能
////1、自动阅读状态下，下一次对话框显示间隔时间，根据对话内容长度，间隔时间不相同
////    ~ 文字长度<=30  间隔时间：0.5秒
////    ~ 文字长度<=60  间隔时间：0.8秒
////    ~ 文字长度>60  间隔时间：1.5秒
////2、对话内容长度>60，会向左向右去最近的一个标点符号分隔内容；分隔之后的如果内容长度还是>60，按照之前逻辑继续分隔，直到最后的内容长度<60
////3、新增阅读状态，分别是正常阅读、自动阅读。新用户进入阅读，首次状态为自动阅读，用户切换状态后，保存切换的状态，下次进入阅读 或者 阅读下一章，会取上一次保存的阅读状态
////4、如果用户是自动阅读状态，遇到选项，提交选项后，阅读状态依然是自动阅读
////5、新增安卓回调统计，这些统计吴南川测试
////二、因为阅读模块删除了大部分没用的代码，所以上面新增的功能测试完成后，进行全面的测试，所有功能点都测下
//
//#import "JSBridge+JS_execute_OC.h"
//#import "ViewController.h"
//
//@implementation JSBridge (JS_execute_OC)
//
///**
//1.初始化进度回调
////进度,范围0-100
//fun loading(percent: Int)
// @param name <#name description#>
// */
//+ (void)loading:(NSInteger)percent {
//    
//}
//
///**
//2.获取用户信息
////返回值为用户json
//fun getUserInfo(): String
// @param name <#name description#>
// */
//+ (void)getUserInfo {
//    
//}
//
///**
//3.打开剧情回顾
////参数为小说id、主角id
//fun openPlotLog(novelid: Int,roleid: Int)
// @param name <#name description#>
// */
//+ (void)openPlotLog:(NSString *)novelid roleid:(NSString *)roleid {
//    
//}
//
///**
//4.打开存储进度
////参数为存档实体，实体参考链接
//http://192.168.1.201:8900/play/storereading.html
//fun openSaveStore(novelid: Int,storeJson: String,readlistJson: String)
// @param name <#name description#>
// */
//+ (void)openSaveStore:(NSString *)novelid storeJson:(NSString *)storeJson readlistJson:(NSString *)readlistJson {
//    
//}
//
///**
//5.打开读档
////参数为小说id，原生会调用读档完毕
//fun openReadStore(novelid: Int)
// @param name <#name description#>
// */
//+ (void)openReadStore:(NSString *)novelid {
//    
//}
//
///**
//6.打开评论
////参数为小说id
//fun openComment(novelid: Int)
// @param name <#name description#>
// */
//+ (void)openComment:(NSString *)novelid {
//    
//}
//
///**
//7.获取设备信息
////返回设备信息json
//fun getDeviceInfo(): String
// @param name imei   顾名思义
// @param name mac
// @param name model
// @param name osvn
// @param name osvc
// @param name dm
// @param name net
// @param name vc
// @param name chl
// @param name agent
// @param name platform   1为Android
// @param name <#name description#>
// */
//+ (void)getDeviceInfo {
//    
//}
//
///**
//8.打赏作品
////小说id、章节id、内容id
//fun openReward(novelid: Int,chapterid: Int,conid: Int)
// @param name <#name description#>
// */
//+ (void)openReward:(NSString *)novelid chapterid:(NSString *)chapterid conid:(NSString *)conid {
//    
//}
//
///**
// 9.获取开始阅读信息
// * 返回阅读信息Json
// fun getReadInfo(): String
// @param name novelid     Int，小说ID
// @param name chapterid   Int，章节id
// @param name sceneid     Int，场景id
// @param name conid       int，内容id
// @param name ispre    boolean，是否预览
// */
//+ (void)getReadInfo {
//    ViewController *vc = [ViewController GetIOSViewController];
//    NSString *novelID = vc.novelID;
//    //1.要转换成JSON数据的OC对象*这里是一个字典
//    NSDictionary *dictM = @{@"novelid": novelID};
//    NSData *data = [NSJSONSerialization dataWithJSONObject:dictM options:kNilOptions error:nil];
//    NSString *novelJson = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
//    [[conchRuntime GetIOSConchRuntime] callbackToJSWithObject:self methodName:@"getReadInfo" ret:novelJson];
//}
//
///**
//10.显示Toast
////显示toast
//fun openToast(text: String)
//@param name <#name description#>
//*/
//+ (void)openToast:(NSString *)text {
//    // Show Toast
//}
//
///**
//11.打开章节支付
////章节信息json
//fun openChapterPay(chapterinfoJson: String, isAutoBuy: Int)
// @param name <#name description#>
// */
//+ (void)openChapterPay:(NSString *)chapterinfoJson isAutoBuy:(NSString *)isAutoBuy {
//    
//}
//
///**
//12.拷贝到粘贴板
//fun copyToClipboard(text: String)
// @param name <#name description#>
// */
//+ (void)copyToClipboard:(NSString *)text {
//    
//}
//
///**
//13.退出阅读界面
//fun closeRead()
// @param name <#name description#>
// */
//+ (void)closeRead {
//    
//}
//
///**
//14.打开分享
////小说实体的json
//fun openShare(novelInfoJson: String)
// @param name <#name description#>
// */
//+ (void)openShare:(NSString *)novelInfoJson {
//    
//}
//
///**
//15.打开登陆
////登陆完成之后，会回调方法 showLogin(userJson: String)，h5需要编写showLogin这个方法去接收刷新用户信息
//fun openLogin()
// @param name <#name description#>
// */
//+ (void)openLogin {
//    
//}
//
//
///**
//16.打开章节付费
////付费实体json
//fun openChapterPay(chapterinfoJson: String)
// @param name <#name description#>
// */
//+ (void)openChapterPay:(NSString *)chapterinfoJson {
//    
//}
//
///**
//17.调用原生弹窗
//// 点击确定之后会回调showDialogSuc(type)
//// type:  1为重头开始弹窗，
//// type为类型，text是弹窗的提示文本
//fun openDialog(type: Int，text: String)
// @param name <#name description#>
// */
//+ (void)openDialog:(NSString *)type text:(NSString *)text {
//    
//}
//
///**
//18.打开大章节过渡
////小说实体json，下一章章节实体json
//fun openChapterTranstion(novelinfoJson: String,nextChapterInfoJson: String, autoBuy: Int)
// @param name <#name description#>
// */
//+ (void)openChapterTranstion:(NSString *)novelinfoJson nextChapterInfoJson:(NSString *)nextChapterInfoJson autoBuy:(NSString *)autoBuy {
//    
//}
//
///**
//19.打开结局界面
////小说实体json、结局标题、结局类型
//fun openEnding(novelinfoJson: String,title: String,resultType: Int)
// @param name <#name description#>
// */
//+ (void)openEnding:(NSString *)novelinfoJson title:(NSString *)title resultType:(NSString *)resultType {
//    
//}
//
///**
//20.打开属性界面
//fun openAttr(noveliid: Int)
// @param name <#name description#>
// */
//+ (void)openAttr:(NSString *)noveliid {
//    
//}
//
///**
//21.获取状态栏高度(刘海处理)
////因为是异步的，所以获取成功会回调showStatusHeight(height: Int)，height为0表示不是刘海
//fun getStatusHeight()
// @param name <#name description#>
// */
//+ (void)getStatusHeight {
//    
//}
//
///**
//22.改变状态
//fun changeState(type: Int,value: Int)
// @param name 1      0取消加入、1已加入     加入书架
// @param name 2      0取消点赞、1已点赞     点赞
// @param name 3      0取消关注、1已关注     关注作者
// @param name <#name description#>
// */
//+ (void)changeState:(NSString *)type value:(NSString *)value {
//    
//}
//
///**
//23.统计
////第一个参数为事件id;
////第二个参数为json列表，每个实体有两个参数分别为type和value，注意value必须是string类型。例如有两个参数：
////如果要求传递参数，参数为键值对形式的Json
//[
//    {
//        "type": "novelid",
//        "value": "123123123"
//    }
//]
//fun statistics(eventID: String,paraListJson: String)
// @param name readMoreClick      更多点击
// @param name readPropertyClick      属性点击
// @param name saveStoreClick         存档点击
// @param name readStoreClick         读档点击
// @param name readShareClick         阅读分享点击
// @param name readStopAutoPlay       动停止 自动阅读
// @param name readAutoChapterFinish      自动阅读状态 到章节末尾
// @param name <#name description#>
// */
//+ (void)statistics:(NSString *)eventID paraListJson:(NSString *)paraListJson {
//    
//}
//
///**
//24.获取小说信息完毕
////获取小说信息完毕的时候就回调原生，页面关闭的时候 用于统计阅读时长；原生在loading100%开始计时，直到退出阅读，结束计时；
//fun showNovelInfo(novelinfoJson: String)
// @param name <#name description#>
// */
//+ (void)showNovelInfo:(NSString *)novelinfoJson {
//    
//}
//
///**
//25.打开用户主页
//fun openUserPage(uid: Int)
// @param name <#name description#>
// */
//+ (void)openUserPage:(NSString *)uid {
//    
//}
//
//@end
