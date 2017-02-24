//
//  ViewController.m
//  StoreValue
//
//  Created by wupeng on 2017/2/24.
//  Copyright © 2017年 wupeng. All rights reserved.
//

#import "ViewController.h"
#import "AppScene.h"
#import "Dog.h"
#import "NSObject+StoreValue.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //打印app所在目录，打开所在目录，可以清楚的看到在Library/Perferences下创建了一个Plist文件
    NSLog(@"%@", NSHomeDirectory());
    [self test1];
    [self test2];
    [self test3];
}

- (void)test1 {
    [[AppScene sharedInstance] serializeValue:@{@"A":@"B"} withKey:@"test"];
    NSLog(@"------------test1------------");
    NSLog(@"%@", [[AppScene sharedInstance] deserializeValueWithKey:@"test"]);
}

- (void)test2 {
    Dog *dog = [[Dog alloc] init];
    dog.name = @"旺财";
    dog.identify = @{@"color" : @"black", @"weight" : @"20kg", @"height" : @"50cm"};
    
    [[AppScene sharedInstance] serializeValue:dog withKey:dog.name];
    NSLog(@"-----------test2-------------");
    Dog *wangcai = [[AppScene sharedInstance] deserializeValueWithKey:@"旺财"];
    NSLog(@"%@", wangcai.identify);
}

//test3在test2的基础上增加了category,在单例提供接口的基础上进行上层封装，隔离所有细节
- (void)test3 {
    Dog *dog = [[Dog alloc] init];
    dog.name = @"旺旺";
    dog.identify = @{@"color" : @"red", @"weight" : @"30kg", @"height" : @"60cm"};

    [dog serializeValueWithKey:dog.name];
    NSLog(@"-----------test3-------------");
    Dog *wangwang = [Dog deserializeValueWithKey:@"旺旺"];
    NSLog(@"%@", wangwang.identify);

}

@end
