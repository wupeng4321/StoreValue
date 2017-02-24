//
//  AppScene.h
//  StoreValue
//
//  Created by wupeng on 2017/2/24.
//  Copyright © 2017年 wupeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppScene : NSObject


/**
 单例

 @return self
 */
+ (AppScene *)sharedInstance;


/**
 序列化value，通过key标记

 @param value value
 @param key key
 */
- (void)serializeValue:(id)value withKey:(NSString *)key;


/**
 反序列化value

 @param key key
 @return 返回反序列化结果
 */
- (id)deserializeValueWithKey:(NSString *)key;

@end
