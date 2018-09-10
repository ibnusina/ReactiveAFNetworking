# ReactiveAFNetworking

[![CI Status](https://img.shields.io/travis/ibnu.sina009@gmail.com/ReactiveAFNetworking.svg?style=flat)](https://travis-ci.org/ibnu.sina009@gmail.com/ReactiveAFNetworking)
[![Version](https://img.shields.io/cocoapods/v/ReactiveAFNetworking.svg?style=flat)](https://cocoapods.org/pods/ReactiveAFNetworking)
[![License](https://img.shields.io/cocoapods/l/ReactiveAFNetworking.svg?style=flat)](https://cocoapods.org/pods/ReactiveAFNetworking)
[![Platform](https://img.shields.io/cocoapods/p/ReactiveAFNetworking.svg?style=flat)](https://cocoapods.org/pods/ReactiveAFNetworking)

ReactiveAFNetworking is an extension of AFNetworking 3 by adding reactive capability, inpired by 
[AFNetworking-RACExtension](https://github.com/codafi/AFNetworking-RACExtensions) which still use AFNetworking 2. 
This library is build on top of 
[AFNetworking 3.0+](https://github.com/AFNetworking/AFNetworking) and
[ReactiveObjC](https://github.com/ReactiveCocoa/ReactiveObjC), 
so if you want to use the same code interface as 
[AFNetworking-RACExtension](https://github.com/codafi/AFNetworking-RACExtensions)
but need the latest version of AFNetworking and ReactiveObjC please feel free to use ReactiveAFNetworking.

## Installation

ReactiveAFNetworking is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'ReactiveAFNetworking'
```

## Usage

Request signals work in much the same way you would expect them to. Any request that is subscribed to is automatically enqueued and the results, be they errors or JSON, are sent back to you the subscriber. For example

```Objective-C
AFHTTPSessionManager *sessionManager = [AFHTTPSessionManager manager];
RACSignal *signal = [sessionManager rac_GET:@"https://api.reddit.com/r/cat/hot" parameters:nil];
[signal subscribeNext:^(RACTuple *tuple) {
        NSLog(@"response: %@, task: %@", tuple.second, tuple.first);
    } error:^(NSError * error) {
        NSLog(@"on error: %@", error);
    }];
```

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

ReactiveAFNetworking support iOS 8.0+.

## Author

Ibnu Sina: ibnu.sina009@gmail.com

## License

ReactiveAFNetworking is available under the MIT license. See the LICENSE file for more info.
