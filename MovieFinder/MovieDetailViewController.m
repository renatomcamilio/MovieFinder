//
//  MovieDetailViewController.m
//  MovieFinder
//
//  Created by Renato Camilio on 2/5/15.
//  Copyright (c) 2015 Renato Camilio. All rights reserved.
//

#import "MovieDetailViewController.h"
#import <MapKit/MapKit.h>

@interface MovieDetailViewController ()

@property (nonatomic, strong) Movie *movie;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *releaseDateLabel;
@property (weak, nonatomic) IBOutlet UIImageView *posterImageView;
@property (weak, nonatomic) IBOutlet UILabel *directorLabel;
@property (weak, nonatomic) IBOutlet UILabel *actorsLabel;
@property (weak, nonatomic) IBOutlet UILabel *synopsisLabel;

@property (weak, nonatomic) IBOutlet MKMapView *countryMapView;

@end

@implementation MovieDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Getter & Setter

- (void)setMovie:(Movie *)movie {
    _movie = movie;
    
    _titleLabel.text = movie.title;
    _releaseDateLabel.text = [@"Release date: " stringByAppendingString:movie.releaseDate];
    _posterImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:movie.posterURL]];
    _directorLabel.text = [@"Director: " stringByAppendingString:movie.director];
    _actorsLabel.text = [@"Actors: " stringByAppendingString:movie.actors];
    _synopsisLabel.text = [@"Synopsis: " stringByAppendingString:movie.synopsis];
}

#pragma mark - Session Data Delegate

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data {
    NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data
                                                        options:NSJSONReadingAllowFragments
                                                          error:nil];
    self.movie = [Movie movieWithDictionary:result];
    [session invalidateAndCancel];
}

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error {
    if (error) {
        NSLog(@"Oh sheeeiit! Something really bad happened! %@", [error userInfo]);
    }
}

@end
