//
//  shipinTests.m
//  shipinTests
//
//  Created by Mapollo27 on 15/7/17.
//  Copyright (c) 2015年 dust.zhang. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "DramaServices.h"

@interface shipinTests : XCTestCase{

    XCTestExpectation *expectation;
}

@end

@implementation shipinTests

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
    //XCTAssert(YES, @"Pass");
    expectation=[self expectationWithDescription:@"test"];
    @try{


        [DramaServices pullAllDramaList:1 success:^(NSArray *array) {

            NSLog(@"coun=%d",[array count]);


//            [expectation fulfill];
        } failure:^(NSDictionary *error) {

        }];


        [self waitForExpectationsWithTimeout:10.0 handler:^(NSError *err){
            if(err){
                NSLog(@"Timeout Error:%@",err);
            }
        }];
    }@catch (NSException *exception) {

        NSLog(@"initFromServer error:%@", [exception description]);
    }

}

- (void)testDetail {
    // This is an example of a functional test case.
    //XCTAssert(YES, @"Pass");
    expectation=[self expectationWithDescription:@"test"];
    @try{


        [DramaServices getDramaTags];


        [self waitForExpectationsWithTimeout:10.0 handler:^(NSError *err){
            if(err){
                NSLog(@"Timeout Error:%@",err);
            }
        }];
    }@catch (NSException *exception) {

        NSLog(@"initFromServer error:%@", [exception description]);
    }

}





- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
