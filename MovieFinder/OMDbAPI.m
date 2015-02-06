//
//  OMDbAPI.m
//  MovieFinder
//
//  Created by Renato Camilio on 2/5/15.
//  Copyright (c) 2015 Renato Camilio. All rights reserved.
//

#import "OMDbAPI.h"

@implementation OMDbAPI

+ (void)requestWithOMDbAPIRequestType:(OMDbAPIRequestType)requestType andRequestParam:(NSString *)requestParam andDelegate:(id<NSURLSessionDataDelegate>)sessionDataDelegate {
    NSString *escapedURLString;
    
    switch (requestType) {
        case OMDbAPIRequestTypeSearch:
            escapedURLString = [[NSString stringWithFormat:@"http://www.omdbapi.com/?s=%@&r=json", requestParam] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            break;
        case OMDbAPIRequestTypeTitle:
            escapedURLString = [[NSString stringWithFormat:@"http://www.omdbapi.com/?t=%@&r=json", requestParam] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            break;
        case OMDbAPIRequestTypeID:
            escapedURLString = [[NSString stringWithFormat:@"http://www.omdbapi.com/?i=%@&r=json", requestParam] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
            break;
        default:
            break;
    }
    
    NSURL *omdbURL = [NSURL URLWithString:escapedURLString];
    NSURLRequest *omdbURLRequest = [NSURLRequest requestWithURL:omdbURL];
    
    NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:@"com.renatocamilio.MovieFinder.horse"];
    
    NSURLSession *omdbURLSession = [NSURLSession sessionWithConfiguration:sessionConfig
                                                                 delegate:sessionDataDelegate
                                                            delegateQueue:[NSOperationQueue mainQueue]];
    [[omdbURLSession dataTaskWithRequest:omdbURLRequest] resume];
}

@end
