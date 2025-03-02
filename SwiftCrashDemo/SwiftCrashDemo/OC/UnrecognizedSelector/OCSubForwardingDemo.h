//
//  OCSubForwardingDemo.h
//  SwiftCrashDemo
//
//  Created by yangfl on 2025/3/1.
//

#import <Foundation/Foundation.h>
#import "OCForwardingProtocol.h"

NS_ASSUME_NONNULL_BEGIN

@interface OCSubForwardingDemo : NSObject<OCForwardingProtocol>
- (void) instance_forwarding_method_name;
- (void) handleUnrecognizedSelector;
- (void) selectUnrecognizedSelector:(id)sender;
@end

NS_ASSUME_NONNULL_END
