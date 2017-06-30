//
//  ViewController.m
//  TestCaseDemo
//
//  Created by Abc on 15/06/17.
//  Copyright © 2017 Websmith Solution. All rights reserved.
//

#import "ViewController.h"

#define ACCEPTABLE_DATE @"0123456789/"
#define ACCEPTABLE_DIGITS_ONLY_WITH_DOT @"0123456789."
#define ACCEPTABLE_DIGITS @"0123456789"
#define ACCEPTABLE_CHARS_ONLY @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ "

@interface ViewController ()

@end

@implementation ViewController

//view did load
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSString *)reverseString:(NSString *)stringToReverse
{
    NSMutableString *reversedString = [NSMutableString stringWithCapacity:[stringToReverse length]];
    
    [stringToReverse enumerateSubstringsInRange:NSMakeRange(0,[stringToReverse length])
                                        options:(NSStringEnumerationReverse | NSStringEnumerationByComposedCharacterSequences)
                                     usingBlock:^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
                                         [reversedString appendString:substring];
                                     }];
    return reversedString;
}

- (void)doSomethingThatTakesSomeTimesWithCompletionBlock:(void (^)(NSString *result))completion
{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:2.0f];
        dispatch_sync(dispatch_get_main_queue(), ^{
            completion(@"result");
        });
    });
}
//validate email
-(BOOL)validateEmail:(NSString *)emailStr
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:emailStr];
}
//validate mobile
-(BOOL)validateMobile:(NSString*)number
{
    NSString *numberRegEx1 = @"[0-9]{10}";
    NSPredicate *numberTest1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", numberRegEx1];
    return [numberTest1 evaluateWithObject:number];
}
//validate username
-(BOOL)validateUsernameForCharsOnly:(NSString *)username
{
    NSCharacterSet *cs = [[NSCharacterSet characterSetWithCharactersInString:ACCEPTABLE_CHARS_ONLY] invertedSet];
    NSString *filtered = [[username componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];
    
    return [username isEqualToString:filtered];
}
@end
