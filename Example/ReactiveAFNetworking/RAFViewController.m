//
//  RAFViewController.m
//  ReactiveAFNetworking
//
//  Created by ibnu.sina009@gmail.com on 09/10/2018.
//  Copyright (c) 2018 ibnu.sina009@gmail.com. All rights reserved.
//

#import "RAFViewController.h"
#import <ReactiveAFNetworking/ReactiveAFNetworking.h>
#import <ReactiveObjC/ReactiveObjC.h>

@interface RAFViewController ()

@end

@implementation RAFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
    RACSignal *signal = [sessionManager rac_GET:@"https://jsonplaceholder.typicode.com/todos/1" parameters:nil];
    RACSignal *mappedSignal = [signal map:^id (RACTuple *tuple) {
        NSLog(@"on map: %@", tuple.second);
        return tuple;
    }];
    [mappedSignal subscribeNext:^(RACTuple *tuple) {
        NSLog(@"on subscribe: %@", tuple.first);
    } error:^(NSError * _Nullable error) {
        NSLog(@"on error: %@", error);
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
