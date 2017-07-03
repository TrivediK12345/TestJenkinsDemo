//
//  TestCaseDemoTests.m
//  TestCaseDemoTests
//
//  Created by Abc on 15/06/17.
//  Copyright © 2017 Websmith Solution. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "ViewController.h"

@interface TestCaseDemoTests : XCTestCase

@property (nonatomic) ViewController *vcToTest;

//@testable import TestCaseDemo

@end

@interface ViewController (Test)



- (NSString *)reverseString:(NSString *)stringToReverse;
- (void)doSomethingThatTakesSomeTimesWithCompletionBlock:(void (^)(NSString *))completion;
- (BOOL)validateEmail:(NSString *)emailStr;
- (BOOL)validateMobile:(NSString*)number;
- (BOOL)validateUsernameForCharsOnly:(NSString *)username;

@end

@implementation TestCaseDemoTests

- (void)setUp
{
    [super setUp];
    self.vcToTest = [[ViewController alloc] init];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testReverseString
{
    NSString *originalString = @"himynameisandy";
    NSString *reversedString = [self.vcToTest reverseString:originalString];
    NSString *expectedReversedString = @"ydnasiemanymih";
    XCTAssertEqualObjects(expectedReversedString, reversedString, @"The reversed string did not match the expected reverse");
}
-(void)testEmailString
{
    NSString *originalString = @"test@gmail.com";
    BOOL res = [self.vcToTest validateEmail:originalString];
    BOOL expectedRes = 1;
    XCTAssertEqual(res,expectedRes,@"Invalid Email");
    
    originalString = @"";
    res = [self.vcToTest validateEmail:originalString];
    XCTAssertEqual(res,expectedRes,@"Invalid Email");
    
    originalString = @"dfgfdgfdgdgfdg";
    res = [self.vcToTest validateEmail:originalString];
    XCTAssertEqual(res,expectedRes,@"Invalid Email");
}
- (void)testPerformanceReverseString
{
    NSString *originalString = @"himynameisandy";
    [self measureBlock:^{
        [self.vcToTest reverseString:originalString];
    }];
}
-(void)testMobileString
{
    NSString *enteredMobile = @"9874563210";
    BOOL res = [self.vcToTest validateMobile:enteredMobile];
    BOOL expectedRes = 1;
    XCTAssertEqual(res,expectedRes,@"Invalid Mobile");
    
    enteredMobile = @"543545";
    res = [self.vcToTest validateMobile:enteredMobile];
    expectedRes = 1;
    XCTAssertEqual(res,expectedRes,@"Invalid Mobile");
    
    enteredMobile = @"gdfgdfgfdgfdg";
    res = [self.vcToTest validateMobile:enteredMobile];
    expectedRes = 1;
    XCTAssertEqual(res,expectedRes,@"Invalid Mobile");
}
-(void)testUserName
{
    NSString *enteredUsername = @"ffdffdffsfdsf";
    BOOL res = [self.vcToTest validateUsernameForCharsOnly:enteredUsername];
    BOOL expectedRes = 1;
    XCTAssertEqual(res,expectedRes,@"Invalid Username");
    
    enteredUsername = @"543545";
    res = [self.vcToTest validateMobile:enteredUsername];
    expectedRes = 1;
    XCTAssertEqual(res,expectedRes,@"Invalid Username");
}
- (void)testDoSomethingThatTakesSomeTime
{
    XCTestExpectation *completionExpectation = [self expectationWithDescription:@"Long method"];
    [self.vcToTest doSomethingThatTakesSomeTimesWithCompletionBlock:^(NSString *result) {
        XCTAssertEqualObjects(@"result", result, @"Result was not correct!");
        [completionExpectation fulfill];
    }];
    [self waitForExpectationsWithTimeout:5.0 handler:nil];
}
@end
