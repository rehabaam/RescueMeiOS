//
//  RescueMeTests.m
//  RescueMeTests
//
//  Created by Ahmad Samra on 6/7/14.
//  Copyright (c) 2014 Ahmad Samra. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface RescueMeTests : XCTestCase

@end

@implementation RescueMeTests

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
    XCTAssert(YES, @"Pass");
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
