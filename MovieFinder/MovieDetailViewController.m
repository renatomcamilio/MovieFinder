//
//  MovieDetailViewController.m
//  MovieFinder
//
//  Created by Renato Camilio on 2/5/15.
//  Copyright (c) 2015 Renato Camilio. All rights reserved.
//

#import "MovieDetailViewController.h"
#import "MovieIMDbInfoViewController.h"


@interface MovieDetailViewController ()

@property (nonatomic, strong) Movie *movie;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *releaseDateLabel;
@property (weak, nonatomic) IBOutlet UIImageView *posterImageView;
@property (weak, nonatomic) IBOutlet UILabel *directorLabel;
@property (weak, nonatomic) IBOutlet UILabel *actorsLabel;
@property (weak, nonatomic) IBOutlet UILabel *synopsisLabel;

@end

@implementation MovieDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark - Getter & Setter

- (void)setMovie:(Movie *)movie {
    _movie = movie;
    
    _titleLabel.text = movie.title;
    _releaseDateLabel.text = [@"Released: " stringByAppendingString:movie.releaseDate];
    _posterImageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:movie.posterURL]];
    _directorLabel.text = [@"Director\n" stringByAppendingString:movie.director];
    _actorsLabel.text = [@"Actors\n" stringByAppendingString:movie.actors];
    _synopsisLabel.text = [@"Synopsis\n" stringByAppendingString:movie.synopsis];
    
    [self.view layoutIfNeeded];
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showIMDbInfo"]) {
        [(MovieIMDbInfoViewController *)[segue.destinationViewController topViewController] setMovie:self.movie];
    }
}

#pragma mark - Session Data Delegate

- (void)populateMovieDetails:(NSData *)data session:(NSURLSession *)session {
    NSDictionary *result = [NSJSONSerialization JSONObjectWithData:data
                                                           options:NSJSONReadingAllowFragments
                                                             error:nil];
    self.movie = [Movie movieWithDictionary:result];
    [session invalidateAndCancel];
}

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data {
    #warning May cause retain cycle
    dispatch_async(dispatch_get_main_queue(), ^{
        [self populateMovieDetails:data session:session];
    });
}

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error {
    if (error) {
        NSLog(@"Oh sheeeiit! Something really bad happened! %@", [error userInfo]);
    }
}

@end
