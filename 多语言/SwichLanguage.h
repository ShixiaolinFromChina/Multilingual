//
//  SwichLanguage.h
//  多语言
//
//  Created by coder on 2018/4/6.
//  Copyright © 2018年 coder. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SwichLanguage : NSObject

+(NSBundle *)bundle;//获取当前资源文件



+(void)initUserLanguage;//初始化语言文件



+(NSString *)userLanguage;//获取应用当前语言



+(void)setUserlanguage:(NSString *)language;//设置当前语言

@end
