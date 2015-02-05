//
//  Movie.h
//  MovieFinder
//
//  Created by Renato Camilio on 2/4/15.
//  Copyright (c) 2015 Renato Camilio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject

+ (instancetype)movieWithDictionary:(NSDictionary *)movieDictionary;

@end
