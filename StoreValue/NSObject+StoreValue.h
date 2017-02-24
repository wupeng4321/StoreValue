//
//  NSObject+StoreValue.h
//  StoreValue
//
//  Created by wupeng on 2017/2/24.
//  Copyright © 2017年 wupeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (StoreValue)

- (void)serializeValueWithKey:(NSString *)key;

+ (id)deserializeValueWithKey:(NSString *)key;


@end
