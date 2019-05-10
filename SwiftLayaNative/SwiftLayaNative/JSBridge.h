#import <Foundation/NSObject.h>

//public class MainView extends MainUI{
//    public function MainView(){
//        trace("---------------2");
//        testButton.on(Event.CLICK,this,share);
//    }
//
//    //没有回调的方法
//    public function toast():void{
//        var Test:IPlatformClass = Laya.PlatformClass.createClass("Test");
//        var a:Boolean =false;
//        Test.call("toast3:",a);
//        // alert("----hahah");
//    }
//
//    //带回调的方法
//    public function share():void{
//        var Test :IPlatformClass = Laya.PlatformClass.createClass("Test");
//        var testAdd:IPlatform =Test.newObject();
//        //  testAdd.callWithBack(function(n){},"setOp:","+");
//        // testAdd.callWithBack(function(n){alert("2+3="+n);},"operatorWith:and:",2,3);
//        testAdd.callWithBack(sb,"operatorWith:and:",2,3);
//    }
//
//    public function sb(sb:String):void{
//        alert("----------"+sb);
//    }
//}

//#import <Foundation/Foundation.h>
//
//NS_ASSUME_NONNULL_BEGIN
//
//@interface Test : NSObject
//
//+(void)toast3:(NSNumber *)open;
//
//-(void)operatorWith:(NSNumber *)x and:(NSNumber *)y;
//
//@end
//
//NS_ASSUME_NONNULL_END
//
//#import "Test.h"
//#import <conchRuntime.h>
//@implementation Test
//
//+(void)toast3:(NSNumber *)open{
//    NSLog(@"-----------");
//}
//
////点击按钮，会laya会调用次方法，返回回调
//-(void)operatorWith:(NSNumber *)x and:(NSNumber *)y{
//    [[conchRuntime GetIOSConchRuntime] callbackToJSWithObject:self methodName:@"operatorWith:and:" ret:@"5"];
//}
//@end

//https://ldc.layabox.com/doc/?nav=zh-ts-7-2-2
@interface JSBridge: NSObject

@end
