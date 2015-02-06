//
//  Movie.h
//  MovieFinder
//
//  Created by Renato Camilio on 2/4/15.
//  Copyright (c) 2015 Renato Camilio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject

@property (nonatomic, strong) NSString *title, *synopsis, *genre, *awards, *actors, *director, *releaseDate, *imdbID;
@property (assign) NSInteger year, metaScore, imdbVotes;
@property (assign) NSDecimal imdbRating;
@property (nonatomic, strong) NSURL *posterURL;

+ (instancetype)movieWithDictionary:(NSDictionary *)movieDictionary;

@end
