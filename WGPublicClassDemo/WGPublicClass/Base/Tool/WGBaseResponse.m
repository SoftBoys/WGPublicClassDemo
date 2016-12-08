//
//  WGBaseResponse.m
//  WGPublicClassDemo
//
//  Created by dfhb@rdd on 16/12/2.
//  Copyright © 2016年 guojunwei. All rights reserved.
//

#import "WGBaseResponse.h"

@implementation WGBaseResponse

- (instancetype)initWithStatusCode:(NSInteger)statusCode responseData:(NSData *)responseData responseString:(NSString *)responseString responseJSON:(id)responseJSON error:(NSError *)error {
    if (self = [super init]) {
        _statusCode = statusCode;
        _responseData = responseData;
        _responseString = responseString;
        _responseJSON = responseJSON;
        _errorType = kWGResponseErrorTypeNone;
        if (error) {
            _errorType = [error code];
        }
    }
    return self;
}

@end
