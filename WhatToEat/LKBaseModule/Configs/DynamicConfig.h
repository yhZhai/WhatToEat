//
//  DynamicConfig.h
//  LKBaseModule
//
//  Created by Yunpeng on 2016/12/12.
//  Copyright © 2016年 Yunpeng. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kServerURL kServerURLFunc()
//#define kLinkDefaultServerURL @"https://link.xjtu.edu.cn/api"
#define kLinkDefaultServerURL @"http://10.30.1.142:9576/api"

NSString * kServerURLFunc();

// 不要轻易调用这个函数
void __CHANGE_SERVER_URL(NSString *url);
