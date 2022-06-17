//
//  ViewController.h
//  MyGreeter
//
//  Created by 夏杭 on 2022/6/14.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController

- (BOOL) goodMorningTime:(NSString *)currentTime;
- (BOOL) goodEveningTime:(NSString *)currentTime;
- (BOOL) goodAfternoonTime:(NSString *)currentTime;

- (CGFloat)getCustomDateWithCurrentTime:(NSString *)currentTime;

@end

