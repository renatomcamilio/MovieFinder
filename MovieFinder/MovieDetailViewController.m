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
@property (weak, nonatomic) IBOutlet MKMapView *countryMapView;

@end

@implementation MovieDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Session Data Delegate

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data {
    NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data
                                                        options:NSJSONReadingAllowFragments
                                                          error:nil];
    [Movie movieWithDictionary:result];
    [session finishTasksAndInvalidate];
}

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error {
    if (error) {
        NSLog(@"Oh sheeeiit! Something really bad happened! %@", [error userInfo]);
    }
}

@end
