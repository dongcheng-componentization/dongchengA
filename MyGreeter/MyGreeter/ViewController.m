//
//  ViewController.m
//  MyGreeter
//
//  Created by 夏杭 on 2022/6/14.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    BOOL morning = [self isBetweenFromHour:6 toHour:12];
    BOOL afternoon = [self isBetweenFromHour:12 toHour:18];
    BOOL night1 = [self isBetweenFromHour:18 toHour:24];
    BOOL night2 = [self isBetweenFromHour:0 toHour:6];
    BOOL night3 = [self isBetweenFromHour:18 toHour:6];

    if (morning) {
        NSLog(@"上午好");
    }
    if (afternoon) {
        NSLog(@"下午好");
    }
    if (night1 || night2) {
        NSLog(@"晚上好");
    }
    
}

- (BOOL)isBetweenFromHour:(NSInteger)fromHour toHour:(NSInteger)toHour {
      
    NSDate *dateFrom = [self getCustomDateWithHour:fromHour];
    NSDate *dateTo = [self getCustomDateWithHour:toHour];
      
    NSDate *currentDate = [NSDate date];
    if ([currentDate compare:dateFrom]==NSOrderedDescending && [currentDate compare:dateTo]==NSOrderedAscending) {
        // 当前时间在9点和10点之间
        return YES;
    }
    return NO;
}
  
/**
 * @brief 生成当天的某个点（返回的是伦敦时间，可直接与当前时间[NSDate date]比较）
 * @param hour 如hour为“8”，就是上午8:00（本地时间）
 */
- (NSDate *)getCustomDateWithHour:(NSInteger)hour {
    //获取当前时间
    NSDate *currentDate = [NSDate date];
    NSCalendar *currentCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *currentComps = [[NSDateComponents alloc] init];
      
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
      
    currentComps = [currentCalendar components:unitFlags fromDate:currentDate];
      
    //设置当天的某个点
    NSDateComponents *resultComps = [[NSDateComponents alloc] init];
    [resultComps setYear:[currentComps year]];
    [resultComps setMonth:[currentComps month]];
    [resultComps setDay:[currentComps day]];
    [resultComps setHour:hour];
      
    NSCalendar *resultCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    return [resultCalendar dateFromComponents:resultComps];
}


@end
