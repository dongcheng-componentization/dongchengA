//
//  ViewController.m
//  MyGreeter
//
//  Created by 夏杭 on 2022/6/14.
//

#import "ViewController.h"
#import<CommonCrypto/CommonDigest.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}


// 获取时间的小时数
- (CGFloat)getCustomDateWithCurrentTime:(NSString *)currentTime {
    //获取当前时间
    NSDate *currentDate = [NSDate date];
    if (currentTime != nil) {
        NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        //设置时区  全球标准时间CUT 必须设置 我们要设置中国的时区
        NSTimeZone *zone = [[NSTimeZone alloc] initWithName:@"CUT"];
        [formatter setTimeZone:zone];
        //变回日期格式
        currentDate = [formatter dateFromString:currentTime];
    }

    NSCalendar *currentCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *currentComps = [[NSDateComponents alloc] init];
    NSInteger unitFlags = NSYearCalendarUnit | NSMonthCalendarUnit | NSDayCalendarUnit | NSWeekdayCalendarUnit | NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    currentComps = [currentCalendar components:unitFlags fromDate:currentDate];
    CGFloat hour = [currentComps hour];
    CGFloat minute = [currentComps minute];
    CGFloat second = [currentComps second];
    CGFloat sumSecond = (minute *60) + second;
    CGFloat ddhour = hour +(sumSecond / (60*60));
    return ddhour;
}


    
- (BOOL) goodMorningTime:(NSString *)currentTime {
    BOOL morning = [self isBetweenFromHour:6 toHour:12 andCurrentTime:currentTime];
    return morning;

}

- (BOOL) goodAfternoonTime:(NSString *)currentTime {
    BOOL afternoon = [self isBetweenFromHour:12 toHour:18 andCurrentTime:currentTime];
    return afternoon;

}
- (BOOL) goodEveningTime:(NSString *)currentTime {
    BOOL eveningTop = [self isBetweenFromHour:18 toHour:24 andCurrentTime:currentTime];
    BOOL eveningBottom = [self isBetweenFromHour:18 toHour:24 andCurrentTime:currentTime];
    if (!eveningTop && !eveningBottom) {
        return NO;
    }
    return YES;
}


- (BOOL)isBetweenFromHour:(NSInteger)fromHour toHour:(NSInteger)toHour andCurrentTime:(NSString *)currentTime {
      
    NSDate *dateFrom = [self getCustomDateWithHour:fromHour andCurrentTime:currentTime];
    NSDate *dateTo = [self getCustomDateWithHour:toHour andCurrentTime:currentTime];
      
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
- (NSDate *)getCustomDateWithHour:(NSInteger)hour andCurrentTime:(NSString *)currentTime {
    //获取当前时间
    NSDate *currentDate = [NSDate date];
    if (currentTime != nil) {
        NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
        [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        //设置时区  全球标准时间CUT 必须设置 我们要设置中国的时区
        NSTimeZone *zone = [[NSTimeZone alloc] initWithName:@"CUT"];
        [formatter setTimeZone:zone];
        //变回日期格式
        currentDate = [formatter dateFromString:currentTime];
    }
    
    
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
