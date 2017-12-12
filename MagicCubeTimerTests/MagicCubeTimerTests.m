//
//  MagicCubeTimerTests.m
//  MagicCubeTimerTests
//
//  Created by  zcating on 11/12/2017.
//  Copyright © 2017 Zcating. All rights reserved.
//


#define UNIT_TEST_NOTIFY_KEY @"UnitTest"

#define UNIT_TEST_WAIT_WITH_KEY(key)\
{\
[self expectationForNotification:(key) object:nil handler:nil];\
[self waitForExpectationsWithTimeout:30 handler:nil];\
}

#define UNIT_TEST_NOTIFY_WITH_KEY(key)\
{\
dispatch_async(dispatch_get_main_queue(), ^{ \
[[NSNotificationCenter defaultCenter] postNotificationName:(key) object:nil];\
});\
}

// If want to do asynchronization test, add this marco to your code.
#define UNIT_TEST_WAIT      UNIT_TEST_WAIT_WITH_KEY(UNIT_TEST_NOTIFY_KEY)
#define UNIT_TEST_NOTIFY     UNIT_TEST_NOTIFY_WITH_KEY(UNIT_TEST_NOTIFY_KEY)

#import <XCTest/XCTest.h>
#import "MCTimer.h"
#import "DisruptionMaker.h"
#import "ColorMatrix.h"

@interface MagicCubeTimerTests : XCTestCase

@end

@implementation MagicCubeTimerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
    [self timingTest];
    [self disruptionTest];
    [self rotateTest];
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
//        [self timingTest];
//        [self disruptionTest];
    }];
}

- (void)timingTest {
    [[MCTimer main] start:^(NSString *countString, NSTimeInterval time) {
        NSLog(@"%@", countString);
        if (time > 1) {
            UNIT_TEST_NOTIFY
        }
    }];
    UNIT_TEST_WAIT
    [[MCTimer main] stop];
}


- (void)disruptionTest {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    DisruptionMaker *maker = [[DisruptionMaker alloc] init];
    
    XCTAssertTrue([maker respondsToSelector:@selector(randomDirection)], @"Error of Selector for randomDirection");
    // get random step
    for (size_t count = 0; count < 100; count++) {
        NSString *direction = [maker performSelector:@selector(randomDirection)];
        XCTAssertNotNil(direction, @"Error of direction!!!");
        NSLog(@"direction is : %@", direction);
    }
    
    // get full steps
    for (size_t count = 0; count < 10; count++) {
        NSString *disruptionStep = [maker disruptionSteps];
        XCTAssertNotNil(disruptionStep, @"Error of disruption step.");
        NSLog(@"%@", disruptionStep);
    }
#pragma clang diagnostic pop
}


- (void)rotateTest {
    
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    
    ColorMatrix *matrix = [[ColorMatrix alloc] init];
    XCTAssertTrue([matrix respondsToSelector:@selector(clockwiseRotate:)], @"Error of Selector for clockwiseRotate:");
    XCTAssertTrue([matrix respondsToSelector:@selector(antiClockwiseRotate:)], @"Error of Selector for antiClockwiseRotate:");
    /*
     1 2 3
     4 5 6
     7 8 9
     */
    NSUInteger count = 1;
    for (NSMutableArray *array in matrix.blueSide) {
        for (size_t index = 0; index < 3; index++) {
            array[index] = @(count);
            count++;
        }
    }
    NSLog(@"%@", matrix.blueSide);
    /*
     7 4 1
     8 5 2
     9 6 3
     */
    [matrix performSelector:@selector(clockwiseRotate:) withObject:matrix.blueSide];
    NSLog(@"%@", matrix.blueSide);
    
    XCTAssertTrue([matrix.blueSide[0][0] isEqualToNumber:@(7)], @"error!!!");
    XCTAssertTrue([matrix.blueSide[0][1] isEqualToNumber:@(4)], @"error!!!");
    XCTAssertTrue([matrix.blueSide[0][2] isEqualToNumber:@(1)], @"error!!!");
    XCTAssertTrue([matrix.blueSide[1][0] isEqualToNumber:@(8)], @"error!!!");
    XCTAssertTrue([matrix.blueSide[1][1] isEqualToNumber:@(5)], @"error!!!");
    XCTAssertTrue([matrix.blueSide[1][2] isEqualToNumber:@(2)], @"error!!!");
    XCTAssertTrue([matrix.blueSide[2][0] isEqualToNumber:@(9)], @"error!!!");
    XCTAssertTrue([matrix.blueSide[2][1] isEqualToNumber:@(6)], @"error!!!");
    XCTAssertTrue([matrix.blueSide[2][2] isEqualToNumber:@(3)], @"error!!!");
    
    
    /*
     1 2 3
     4 5 6
     7 8 9
     */
    [matrix performSelector:@selector(antiClockwiseRotate:) withObject:matrix.blueSide];
    NSLog(@"%@", matrix.blueSide);
    
    XCTAssertTrue([matrix.blueSide[0][0] isEqualToNumber:@(1)], @"error!!!");
    XCTAssertTrue([matrix.blueSide[0][1] isEqualToNumber:@(2)], @"error!!!");
    XCTAssertTrue([matrix.blueSide[0][2] isEqualToNumber:@(3)], @"error!!!");
    XCTAssertTrue([matrix.blueSide[1][0] isEqualToNumber:@(4)], @"error!!!");
    XCTAssertTrue([matrix.blueSide[1][1] isEqualToNumber:@(5)], @"error!!!");
    XCTAssertTrue([matrix.blueSide[1][2] isEqualToNumber:@(6)], @"error!!!");
    XCTAssertTrue([matrix.blueSide[2][0] isEqualToNumber:@(7)], @"error!!!");
    XCTAssertTrue([matrix.blueSide[2][1] isEqualToNumber:@(8)], @"error!!!");
    XCTAssertTrue([matrix.blueSide[2][2] isEqualToNumber:@(9)], @"error!!!");
    
    
#pragma clang diagnostic pop
}

@end
