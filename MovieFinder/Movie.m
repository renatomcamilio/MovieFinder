//
//  Movie.m
//  MovieFinder
//
//  Created by Renato Camilio on 2/4/15.
//  Copyright (c) 2015 Renato Camilio. All rights reserved.
//

#import "Movie.h"

@interface Movie ()

@end

@implementation Movie

+ (instancetype)movieWithDictionary:(NSDictionary *)movieDictionary {
    Movie *newMovie = [[self alloc] init];

    newMovie.imdbID = [movieDictionary valueForKey:@"imdbID"];
    newMovie.title = [movieDictionary valueForKey:@"Title"];
    newMovie.synopsis = [movieDictionary valueForKey:@"Plot"];
    newMovie.genre = [movieDictionary valueForKey:@"Genre"];
    newMovie.awards = [movieDictionary valueForKey:@"Awards"];
    newMovie.actors = [movieDictionary valueForKey:@"Actors"];
    newMovie.director = [movieDictionary valueForKey:@"Director"];
    newMovie.releaseDate = [movieDictionary valueForKey:@"Released"];
    newMovie.country = [movieDictionary valueForKey:@"Country"];
    newMovie.year = [[movieDictionary valueForKey:@"Year"] integerValue];
    newMovie.metaScore = [[movieDictionary valueForKey:@"Metascore"] integerValue];
    newMovie.imdbVotes = [[movieDictionary valueForKey:@"imdbVotes"] integerValue];
    newMovie.imdbRating = [[movieDictionary valueForKey:@"imdbRating"] floatValue];
    newMovie.posterURL = [NSURL URLWithString:[movieDictionary valueForKey:@"Poster"]];
    
    return newMovie;
}

@end
