//
//  ViewController.h
//  TestCaseDemo
//
//  Created by Abc on 15/06/17.
//  Copyright © 2017 Websmith Solution. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *txt_UserName;

@property (weak, nonatomic) IBOutlet UITextField *txt_Email;
@property (weak, nonatomic) IBOutlet UITextField *txt_MobileNumber;
@property (weak, nonatomic) IBOutlet UILabel *lbl_TitleName;


- (NSString *)reverseString:(NSString *)stringToReverse;
- (void)doSomethingThatTakesSomeTimesWithCompletionBlock:(void (^)(NSString *result))completion;
-(BOOL)validateEmail:(NSString *)emailStr;
-(BOOL)validateMobile:(NSString*)number;
-(BOOL)validateUsernameForCharsOnly:(NSString *)username;


@end

