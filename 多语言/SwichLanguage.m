//
//  SwichLanguage.m
//  多语言
//
//  Created by coder on 2018/4/6.
//  Copyright © 2018年 coder. All rights reserved.
//

#import "SwichLanguage.h"
static NSString*LocalLanguageKey = @"SwitchLanguage";
@implementation SwichLanguage
static NSBundle *bundle = nil;
+(NSBundle*)bundle {
    return bundle;
}
//首次加载的时候先检查语言是否存在
+(void)initUserLanguage {
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSString *currLanguage = [def objectForKey:LocalLanguageKey];
    if (!currLanguage) {
        NSArray *preferredLanguages = [NSLocale preferredLanguages];
        currLanguage = preferredLanguages[0];
        if ([currLanguage hasPrefix:@"zh"]) {
            currLanguage = @"zh-Hans";
        } else if ([currLanguage hasPrefix:@"ja"]) {
            currLanguage = @"ja";
        } else {
            currLanguage = @"en";
        }
        [def setValue:currLanguage forKey:LocalLanguageKey];
        [def synchronize];
    }
    //获取路径
    NSString *path = [[NSBundle mainBundle] pathForResource:currLanguage ofType:@"lproj"];
    
    bundle = [NSBundle bundleWithPath:path];//生成path
}

//获取当前语言
+(NSString *)userLanguage {
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    NSString *language = [def valueForKey:LocalLanguageKey];
    return language;
}
//设置语言
+(void)setUserlanguage:(NSString *)language {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSString *currLanguage = [userDefaults valueForKey:LocalLanguageKey];
    if ([currLanguage isEqualToString:language]) {
        return;
    }
    [userDefaults setValue:language forKey:LocalLanguageKey];
    
    [userDefaults synchronize];
    NSString *path = [[NSBundle mainBundle] pathForResource:language ofType:@"lproj" ];
    bundle = [NSBundle bundleWithPath:path];
}
@end
