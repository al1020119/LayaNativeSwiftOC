#import "JSBridge.h"
//#import "AppDelegate.h"

#import "ReadingGamesViewController.h"
#import <conchRuntime.h>

@implementation JSBridge

// 1.要转换成JSON数据的OC对象*这里是一个字典或字典
+ (NSString *)dictArrayToJson:(id)dictArray {
    if (dictArray == nil) {
        return nil;
    }
    if (![NSJSONSerialization isValidJSONObject:dictArray]) {
        return nil;
    }
    //2.OC->JSON
    /*
     注意：可以通过+ (BOOL)isValidJSONObject:(id)obj;方法判断当前OC对象能否转换为JSON数据
     具体限制：
     1.obj 是NSArray 或 NSDictionay 以及他们派生出来的子类
     2.obj 包含的所有对象是NSString,NSNumber,NSArray,NSDictionary 或NSNull
     3.字典中所有的key必须是NSString类型的
     4.NSNumber的对象不能是NaN或无穷大
     第一个参数：要转换成JSON数据的OC对象，这里为一个字典
     第二个参数：NSJSONWritingPrettyPrinted对转换之后的JSON对象进行排版，无意义
     */
    // OC对象 -> JSON数据 [数据传输只能以进制流方式传输,所以传输给我们的是进制流,但是本质是JSON数据
    NSData *data = [NSJSONSerialization dataWithJSONObject:dictArray options:kNilOptions error:nil];
    NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return jsonString;
}

// 1.要转换成JSON数据的OC对象*这里是一个字典或字典
+ (id)jsonToDictArray:(NSString *)json {
    if (json == nil) {
        return nil;
    }
    if (json.length == 0) {
        return nil;
    }
    NSJSONReadingOptions opt = NSJSONReadingAllowFragments | NSJSONReadingMutableLeaves | NSJSONReadingMutableContainers;
    id tmp = [NSJSONSerialization JSONObjectWithData:[json dataUsingEncoding:NSUTF8StringEncoding] options:opt error:nil];
    if (tmp) {
        if ([tmp isKindOfClass:[NSArray class]]) {
            return tmp;
        } else if([tmp isKindOfClass:[NSString class]] || [tmp isKindOfClass:[NSDictionary class]]) {
            return [NSArray arrayWithObject:tmp];
        } else {
            return nil;
        }
    } else {
        return nil;
    }
}
//
//+(void)hideSplash {
//    AppDelegate * appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
//    [appDelegate.launchView hide];
//}
//
//+(void)setTips:(NSArray*)tips {
//    AppDelegate * appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
//    appDelegate.launchView.tips = tips;
//}
//
//+(void)setFontColor:(NSString*)color {
//    AppDelegate * appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
//    [appDelegate.launchView setFontColor:color];
//}
//
//+(void)bgColor:(NSString*)color {
//    AppDelegate * appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
//    [appDelegate.launchView setBackgroundColor:color];
//}
//
//+(void)loading:(NSNumber*)percent {
//    AppDelegate * appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
//    [appDelegate.launchView setPercent:percent.integerValue];
//}
//
//+(void)showTextInfo:(NSNumber*)show {
//    AppDelegate * appDelegate = (AppDelegate*)[UIApplication sharedApplication].delegate;
//    [appDelegate.launchView showTextInfo:show.intValue > 0];
//}

/**
 9.获取开始阅读信息
 * 返回阅读信息Json
 fun getReadInfo(): String
 @param name novelid     Int，小说ID
 @param name chapterid   Int，章节id
 @param name sceneid     Int，场景id
 @param name conid       int，内容id
 @param name ispre    boolean，是否预览
 */
+ (void)getReadInfo {
    ReadingGamesViewController *vc = [ReadingGamesViewController GetIOSViewController];
    NSString *novelID = @"5399";
    //1.要转换成JSON数据的OC对象*这里是一个字典
    NSDictionary *dictM = @{@"novelid": novelID};
    NSData *data = [NSJSONSerialization dataWithJSONObject:dictM options:kNilOptions error:nil];
    NSString *novelJson = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    //[[conchRuntime GetIOSConchRuntime] callbackToJSWithObject:self methodName:@"getReadInfo" ret:novelJson];
    [[conchRuntime GetIOSConchRuntime] callbackToJSWithClass:self methodName:@"getReadInfo" ret:novelJson];
}

@end
