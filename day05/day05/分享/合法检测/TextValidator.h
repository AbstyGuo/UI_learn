//
//  TextValidator.h
//  TPSApp
//
//  Created by xiating on 14/10/29.
//  Copyright (c) 2014年 YY. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, ValidationType) {
    TextValidatorPhoneNumValidation, //固定电话合法性校验
    TextValidatorTelephoneNumValidation,//移动电话合法性校验
    TextValidatorEmailValidation,//电子邮件合法性校验
    TextValidatorAccountValidation,//账号合法性校验(1-20位字母、下划线、数字组成，不能为纯数字或纯下划线)
    TextValidatorWxnoValidation,  //微信账号合法性校验
    TextValidatorIDCardVaidation // 身份证号码合法性校验,支持15或18位身份证号码,支持尾号为X.
};




@interface TextValidator : NSObject

+ (BOOL)validateText:(NSString *)text forType:(ValidationType)type;

+ (BOOL)validatePwd:(NSString *)pwd indentityToAnotherPwd:(NSString *)anotherPwd;


@end


@interface PhoneNumValidator : NSObject


+ (BOOL)validatePhoneNum:(NSString *)phoneNum;

@end


@interface TelephoneValidator : NSObject

+ (BOOL)validateTelephoneNum:(NSString *)telephoneNum;

@end


@interface EmailValidator : NSObject

+ (BOOL)validateEmailAddress:(NSString *)email;

@end

@interface UsernameValidator : NSObject

+ (BOOL)validateUsername:(NSString *)username;

@end

@interface PasswordValidator : NSObject

+ (BOOL)validatePassword:(NSString *)pwd identityToAnotherPassword:(NSString *)anotherPwd;

@end

@interface WxnoValidator : NSObject

+ (BOOL)validateWxno:(NSString *)wxno;

@end


@interface IDCardValidator : NSObject

+ (BOOL)validateIDCard:(NSString *)idcard;
@end


