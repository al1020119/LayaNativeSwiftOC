#import <UIKit/UIKit.h>
#import <GLKit/GLKit.h>

@interface ViewController : GLKViewController
+(ViewController*)GetIOSViewController;
-(id)init;

@property (nonatomic, copy) NSString *novelID;

@end

