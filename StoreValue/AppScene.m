//
//  AppScene.m
//  StoreValue
//
//  Created by wupeng on 2017/2/24.
//  Copyright © 2017年 wupeng. All rights reserved.
//

#import "AppScene.h"
#import "FastCoder.h"
static AppScene *appScene = nil;
static NSString *const AppSceneString = @"AppScene";

@implementation AppScene

+ (AppScene *)sharedInstance {
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        appScene = (AppScene *)AppSceneString;
        appScene = [[AppScene alloc] init];
    });
    //防止子类使用
    if (![NSStringFromClass([self class]) isEqualToString:AppSceneString]) {
        NSParameterAssert(nil);
    }

    return appScene;
}

- (void)serializeValue:(id)value withKey:(NSString *)key {
    NSParameterAssert(value);
    NSParameterAssert(key);
    //fastCoding是用来地点系统的NSCoding的协议 可以将对象序列化成NSData，也可以反序列化
    NSData *data = [FastCoder dataWithRootObject:value];
    if (data) {
        [[NSUserDefaults standardUserDefaults] setObject:data forKey:key];
    }
}

- (id)deserializeValueWithKey:(NSString *)key {
    NSParameterAssert(key);
    
    NSData *data = [[NSUserDefaults standardUserDefaults] valueForKey:key];
    return [FastCoder objectWithData:data];
}


#pragma mark - private

- (instancetype)init {
    NSString *string = (NSString *)appScene;
    if ([string isKindOfClass:[NSString class]] == YES && [string isEqualToString:AppSceneString]) {
        self = [super init];
        if (self) {
            // 防止子类使用
            NSString *classString = NSStringFromClass([self class]);
            if (![classString isEqualToString:AppSceneString]) {
                NSParameterAssert(nil);
            }
        }
        return self;
    } else {
        return nil;
    }
}

@end
