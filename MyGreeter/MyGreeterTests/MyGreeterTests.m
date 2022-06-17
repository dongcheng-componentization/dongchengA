//
//  MyGreeterTests.m
//  MyGreeterTests
//
//  Created by 夏杭 on 2022/6/14.
//

#import <XCTest/XCTest.h>
#import "ViewController.h"

@interface MyGreeterTests : XCTestCase
@end

@implementation MyGreeterTests

- (void)setUp {
    [super setUp];
    // 开始测试
    
}

- (void)tearDown {
    [super tearDown];
    // 测试结束

}
// 请使用 testfunc1
- (void) testFunc1 {
    ViewController *ctl = [[ViewController alloc] init];
    // 测试当前系统是
    CGFloat currentHour = [ctl getCustomDateWithCurrentTime:nil];
    XCTAssert((currentHour > 6 && currentHour < 12), @"当前时间不是Good morning ");
    NSLog(@"%@",(currentHour > 6 && currentHour < 12) ? @"Good morning" : @"");

    XCTAssert((currentHour > 12 && currentHour < 18), @"当前时间不是Good afternoon ");
    NSLog(@"%@",(currentHour > 12 && currentHour < 18) ? @"Good afternoon" : @"");

    XCTAssert(((currentHour > 18 && currentHour < 24) || (currentHour > 0 && currentHour < 6)), @"当前时间不是 Good evening ");
    NSLog(@"%@",((currentHour > 18 && currentHour < 24) || (currentHour > 0 && currentHour < 6)) ? @"Good evening" : @"");

}

- (void) testFunc2 {
    // 实例化测试对象 
    ViewController *ctl = [[ViewController alloc] init];
    BOOL morning = [ctl goodMorningTime:@"2022-06-17 09:33:22"];
    XCTAssert(morning, @"Good morning 测试不通过"); //当expression求值为TRUE时通过；
    NSLog(@"%@",morning ? @"Good morning" : @"");
    
    
    BOOL afternoon = [ctl goodAfternoonTime:@"2022-06-17 15:33:22"];
    XCTAssert(afternoon, @"Good afternoon 测试不通过"); //当expression求值为TRUE时通过；
    NSLog(@"%@",afternoon ? @"Good afternoon" : @"");

    BOOL evening = [ctl goodEveningTime:@"2022-06-17 21:33:22"];
    XCTAssert(evening, @"Good evening 测试不通过"); //当expression求值为TRUE时通过；
    NSLog(@"%@",evening ? @"Good evening" : @"");

    

}



- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        //实例化测试对象
        ///#测试那个类里的方法就要引入那个类
        ViewController *vc = [[ViewController alloc] init];
        //#调用测试方法获取测试结果
        [vc getCustomDateWithCurrentTime:nil];
        
    }];
}

@end
