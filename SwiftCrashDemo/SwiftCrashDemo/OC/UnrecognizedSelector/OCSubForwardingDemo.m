//
//  OCSubForwardingDemo.m
//  SwiftCrashDemo
//
//  Created by yangfl on 2025/3/1.
//

#import "OCSubForwardingDemo.h"
#import "OCForwardingProtocol.h"

//@interface OCSubForwardingDemo<OCForwardingProtocol>
//
//@end

@implementation OCSubForwardingDemo

- (void)forwarding_method_name { 
    NSLog(@"forwarding_method_name");
}


- (void) dynamicForwardingTargetForSelector:(id) sender {
    NSLog(@"dynamicForwardingTargetForSelector%@",sender);
}

- (void) protocol_forwarding_method_name {
    NSLog(@"protocol_forwarding_method_name");
}

- (void) instance_forwarding_method_name {
    NSLog(@"instance_forwarding_method_name");
}


- (void) selectUnrecognizedSelector:(id)sender {
    NSLog(@"selectUnrecognizedSelector");
}

- (void) handleUnrecognizedSelector {
    NSLog(@"handleUnrecognizedSelector");
}
@end
