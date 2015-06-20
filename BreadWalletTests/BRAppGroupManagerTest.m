//
//  BRAppGroupManagerTest.m
//  BreadWallet
//
//  Created by Henry Tsai on 6/13/15.
//  Copyright (c) 2013 Aaron Voisine <voisine@gmail.com>
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

#import <XCTest/XCTest.h>
#import "NSUserDefaults+AppGroup.h"
#import "BRAppGroupManager.h"
#import "BRAppGroupConstants.h"
#import "BRPaymentRequest.h"

static NSString *const kBRTestReceiveAddress = @"---------test address----------";

@interface BRAppGroupManager()
- (void)copyDataToNSUserDefaultInSharedContainer;
@end

@interface BRAppGroupManagerHelper : BRAppGroupManager
@end

@implementation BRAppGroupManagerHelper
- (NSString*)paymentCeceiveAddress {
    return kBRTestReceiveAddress;
}
@end

@interface BRAppGroupManagerTest : XCTestCase
@end

@implementation BRAppGroupManagerTest

- (void)testCopyAddressToContainer {
    BRAppGroupManagerHelper *appGroupManager = [[BRAppGroupManagerHelper alloc] init];
    [appGroupManager copyDataToNSUserDefaultInSharedContainer];
    XCTAssertEqualObjects([[NSUserDefaults appGroupUserDefault] objectForKey:kBRSharedContainerDataWalletReceiveAddressKey], kBRTestReceiveAddress);
}
@end
