/* Part of Cosmos by OpenGenus Foundation */

//
//  shell_sort.m
//  oc_for_cosmos
//
//  Created by DaiPei on 2017/10/9.
//  Copyright © 2017年 DaiPei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShellSort : NSObject

- (void)shellSort:(NSMutableArray<NSNumber *> *)array;

@end

@implementation ShellSort

- (void)shellSort:(NSMutableArray<NSNumber *> *)array {
    for (int h = (int)array.count / 2; h > 0; h /= 2) {
        for (int i = h; i < array.count; i++) {
            NSNumber *k = array[i];
            int j;
            for (j = i; j >= h && [k compare:array[j - h]] == NSOrderedAscending; j -= h) {
                array[j] = array[j - h];
            }
            array[j] = k;
        }
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int n = 0;
        NSLog(@"What is the size of the array?");
        scanf("%d", &n);
        NSMutableArray *array = [NSMutableArray arrayWithCapacity:n];
        NSLog(@"Enter elements of the array one by one:");
        for (int i = 0; i < n; i++) {
            int tmp;
            scanf("%d", &tmp);
            [array addObject:@(tmp)];
        }
        ShellSort *ss = [[ShellSort alloc] init];
        [ss shellSort:array];
        NSLog(@"%@", array);
    }
    return 0;
}

@end
