//
//  OCForwardingDemo.h
//  SwiftCrashDemo
//
//  Created by yangfl on 2025/2/28.
//

#import <Foundation/Foundation.h>
#import "OCSubForwardingDemo.h"
#import "OCSuperForwardingDemo.h"
NS_ASSUME_NONNULL_BEGIN

@interface OCForwardingDemo : OCSuperForwardingDemo
@property (nonatomic, strong) OCSubForwardingDemo* subDemo;
- (void) testMain;
@end

NS_ASSUME_NONNULL_END
