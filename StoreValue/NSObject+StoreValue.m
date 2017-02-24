//
//  NSObject+StoreValue.m
//  StoreValue
//
//  Created by wupeng on 2017/2/24.
//  Copyright © 2017年 wupeng. All rights reserved.
//

#import "NSObject+StoreValue.h"
#import "AppScene.h"

@implementation NSObject (StoreValue)

- (void)serializeValueWithKey:(NSString *)key {
    
    [[AppScene sharedInstance] serializeValue:self withKey:key];
}

+ (id)deserializeValueWithKey:(NSString *)key {
    
    return [[AppScene sharedInstance] deserializeValueWithKey:key];
}


@end
