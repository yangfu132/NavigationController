//
//  OCForwardingProtocol.h
//  SwiftCrashDemo
//
//  Created by yangfl on 2025/2/28.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol OCForwardingProtocol <NSObject>
@required
- (void) forwarding_method_name;
- (void) protocol_forwarding_method_name;
@end

NS_ASSUME_NONNULL_END
