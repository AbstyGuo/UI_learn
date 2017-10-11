//
//  TextValidator.m
//  TPSApp
//
//  Created by xiating on 14/10/29.
//  Copyright (c) 2014年 YY. All rights reserved.
//

#import "TextValidator.h"

@implementation TextValidator

+ (BOOL)validateText:(NSString *)text forType:(ValidationType)type
{
    switch (type) {
        case TextValidatorPhoneNumValidation:
            return [PhoneNumValidator validatePhoneNum:text];
        case TextValidatorTelephoneNumValidation:
            return [TelephoneValidator validateTelephoneNum:text];
        case TextValidatorEmailValidation:
            return [EmailValidator validateEmailAddress:text];
        case TextValidatorAccountValidation:
            return [UsernameValidator validateUsername:text];
        case TextValidatorWxnoValidation:
            return [WxnoValidator validateWxno:text];
        case TextValidatorIDCardVaidation:
            return [IDCardValidator validateIDCard:text];
    }
}


+ (BOOL)validatePwd:(NSString *)pwd indentityToAnotherPwd:(NSString *)anotherPwd
{
    return  [PasswordValidator validatePassword:pwd identityToAnotherPassword:anotherPwd];
}

@end


@implementation PhoneNumValidator

/**
 *  国内固定电话校验,支持 (+86)-(3至4位区号)-7至8位直播号-1至4位分机号.其中区号与直播号是必须，国家码可选、分机号可选、国家码与区号中的括号可选，分隔符限定为非字母数字符号.
 *
 *  @param phoneNum 待校验字符串
 *
 *  @return 是否为有效的固定电话
 */
+ (BOOL)validatePhoneNum:(NSString *)phoneNum
{
    //    NSString *isPhoneRegex = @"^((\\+86)|(\\(\\+86\\)))?\\D?((((010|021|022|023|024|025|026|027|028|029|852)|(\\(010\\)|\\(021\\)|\\(022\\)|\\(023\\)|\\(024\\)|\\(025\\)|\\(026\\)|\\(027\\)|\\(028\\)|\\(029\\)|\\(852\\)))\\D?\\d{8}|((0[3-9][1-9]{2})|(\\(0[3-9][1-9]{2}\\)))\\D?\\d{7,8}))(\\D?\\d{1,4})?$";
    NSString *isPhoneRegex1 = @"^((\\+86)|(\\(\\+86\\)))?\\W?((((010|021|022|023|024|025|026|027|028|029|852)|(\\(010\\)|\\(021\\)|\\(022\\)|\\(023\\)|\\(024\\)|\\(025\\)|\\(026\\)|\\(027\\)|\\(028\\)|\\(029\\)|\\(852\\)))\\W\\d{8}|((0[3-9][1-9]{2})|(\\(0[3-9][1-9]{2}\\)))\\W\\d{7,8}))(\\W\\d{1,4})?$";
    NSString *isPhoneRegex2 = @"^\\d{3,4}-\\d{7,8}$|^\\d{10,12}$|^\\d{7,8}$";
    NSPredicate *phoneRegex1 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", isPhoneRegex1];
    NSPredicate *phoneRegex2 = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", isPhoneRegex2];
    return ([phoneRegex1 evaluateWithObject:phoneNum] ||[phoneRegex2 evaluateWithObject:phoneNum]);
    
    if (([phoneRegex1 evaluateWithObject:phoneNum] == YES))
    {
        return YES;
    }else{
        return NO;
    }
}

@end

@implementation TelephoneValidator

/**
 *  国内手机号码校验
 *
 *  @param telephoneNum 待校验字符串
 *
 *  @return 是否为有效的手机号码
 */
+ (BOOL)validateTelephoneNum:(NSString *)telephoneNum
{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    //    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    
    
    /**
     * 中国移动：China Mobile
     * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     */
    //    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$"; // China Mobile phoneNum
    
    /**
     * 中国联通：China Unicom
     * 130,131,132,152,155,156,185,186
     */
    //    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$"; // China Unicom phoneNum
    
    
    /**
     * 中国电信：China Telecom
     * 133,1349,153,180,189
     */
    //    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$"; // China Telecom phoneNum
    
    /**
     *  The following 4 predicate can tell which carrier the number is from.
     */
    //    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    //    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    //    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    //    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    
    //Only Check if the string is a valid telephone number, ignoring the carrier info.
    
    NSString *isMobileRegex = @"^(((13[0-9]{1})|(15[0-9]{1})|(17[0-9]{1})|(18[0,5-9]{1}))+\\d{8})$";

    
//    NSString *isMobileRegex = @"^((\\+86)|(\\(\\+86\\)))?(((13[0-9]{1})|(15[0-9]{1})|(17[0-9]{1})|(18[0,5-9]{1}))+\\d{8})$";
    

    NSPredicate *mobileRegex = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", isMobileRegex];
    
    if (([mobileRegex evaluateWithObject:telephoneNum] == YES))
    {
        return YES;
        
    }else{
        return NO;
    }
    
}


@end


@implementation EmailValidator

/**
 *  Email Validate.
 *
 *  @param email The string to be validated.
 *
 *  @return return YES if the `email` is a valid email address, otherwise NO.
 */
+ (BOOL)validateEmailAddress:(NSString *)email
{
    NSString *emailRegEx = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    if ([emailTest evaluateWithObject:email] == YES) {
        return YES;
    }else {
        return NO;
    }
}

@end



@implementation UsernameValidator

+ (BOOL)validateUsername:(NSString *)username
{
   
    NSString *usernameRegEx = @"^(?!((^[0-9]+$)|(^[_]+$)))([a-zA-Z0-9_]{1,20})$";

    NSPredicate *usernameTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", usernameRegEx];
    
    return [usernameTest evaluateWithObject:username];
}

@end

@implementation PasswordValidator

+ (BOOL)validatePassword:(NSString *)pwd identityToAnotherPassword:(NSString *)anotherPwd
{
    return [pwd isEqualToString:anotherPwd];
}

@end


@implementation WxnoValidator

+ (BOOL)validateWxno:(NSString *)wxno
{
    //TODO: empty wxno validator implementation
    NSString *wxnoRegEx = @"^[a-zA-Z0-9_\\-]{6,30}$";
    NSPredicate *wxnoTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", wxnoRegEx];

    return [wxnoTest evaluateWithObject:wxno];
}

@end


@implementation IDCardValidator

+ (BOOL)validateIDCard:(NSString *)idcard
{
    NSString *idcardRegEx = @"(\\d{14}[0-9X])|(\\d{17}[0-9X])";
    NSPredicate *idcardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",idcardRegEx];
    return [idcardPredicate evaluateWithObject:idcard];
}

@end




