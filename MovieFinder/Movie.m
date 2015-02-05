//
//  Movie.m
//  MovieFinder
//
//  Created by Renato Camilio on 2/4/15.
//  Copyright (c) 2015 Renato Camilio. All rights reserved.
//

#import "Movie.h"

@interface Movie ()

@property (nonatomic, strong) NSString *title, *synopsis, *genre, *awards, *actors, *director;
@property (assign) NSInteger year;

@end

@implementation Movie

+ (instancetype)movieWithDictionary:(NSDictionary *)movieDictionary {
    Movie *newMovie = [[self alloc] init];
    
    newMovie.title = [movieDictionary valueForKey:@"Title"];
    newMovie.synopsis = [movieDictionary valueForKey:@"Plot"];
    newMovie.genre = [movieDictionary valueForKey:@"Genre"];
    
    return newMovie;
}

@end
