//
//  main.m
//  ocprogramming
//
//  Created by Nigel Lee on 10/22/16.
//  Copyright © 2016 Apress. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "A.h"
#import "B.h"
#import "C.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
//        NSLog(@"Hello, World!");
        id b = [[B alloc] init];
        id c = [[C alloc] init];
        
        printf("execute [b method1]\n");
        [b method1];
        printf("execute [b method2]\n");
        [b method2];
        printf("execute [c method1]\n");
        [c method1];
        printf("execute [c method2]\n");
        [c method2];
    }
    return 0;
}
