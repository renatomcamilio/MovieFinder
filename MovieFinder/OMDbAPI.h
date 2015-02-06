//
//  OMDbAPI.h
//  MovieFinder
//
//  Created by Renato Camilio on 2/5/15.
//  Copyright (c) 2015 Renato Camilio. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, OMDbAPIRequestType) {
    OMDbAPIRequestTypeSearch,
    OMDbAPIRequestTypeID,
    OMDbAPIRequestTypeTitle,
};

@interface OMDbAPI : NSObject

+ (void)requestWithOMDbAPIRequestType:(OMDbAPIRequestType)requestType andRequestParam:(NSString *)requestParam andDelegate:(id<NSURLSessionDataDelegate>)sessionDataDelegate;

@end
