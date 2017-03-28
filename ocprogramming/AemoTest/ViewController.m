//
//  ViewController.m
//  AemoTest
//
//  Created by Nigel Lee on 27/03/2017.
//  Copyright © 2017 Apress. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // dispatch_barrier_async是在前面的任务执行结束后它才执行，而且它后面的任务等它执行完成之后才会执行.
    // 依赖线程的执行顺序跟dispatch_barrier_async添加的时机有关
    [NSThread currentThread].name = @"mainThread";
    dispatch_queue_t queue = dispatch_queue_create("NIGEL", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        [NSThread currentThread].name = @"task0";
        [NSThread sleepForTimeInterval:0];
        NSLog(@"task0");});
    
    dispatch_async(queue,  ^{
        [NSThread currentThread].name=@"task1";
        [NSThread sleepForTimeInterval:5];
        NSLog(@"task1");});
    
    dispatch_barrier_async(queue, ^{NSLog(@"dispatch_barrier");
        
        [NSThread sleepForTimeInterval:1];
        
    });
    
    dispatch_async(queue, ^{
        
        [NSThread currentThread].name=@"task2";
        
        [NSThread sleepForTimeInterval:1];
        
        NSLog(@"task2");});
    
    NSLog(@"hello"); //最先得到执行
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
