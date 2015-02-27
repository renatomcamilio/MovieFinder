//
//  MovieIMDbInfoViewController.m
//  MovieFinder
//
//  Created by Renato Camilio on 2/6/15.
//  Copyright (c) 2015 Renato Camilio. All rights reserved.
//

#import "MovieIMDbInfoViewController.h"

@interface MovieIMDbInfoViewController ()

@property (weak, nonatomic) IBOutlet UILabel *IMDbRatingLabel;
@property (weak, nonatomic) IBOutlet UILabel *IMDbVotesLabel;
@property (weak, nonatomic) IBOutlet UILabel *metascoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *awardsLabel;
@property (weak, nonatomic) IBOutlet UILabel *countriesLabel;

@property (weak, nonatomic) IBOutlet MKMapView *countryMapView;

@end

@implementation MovieIMDbInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.IMDbRatingLabel.text = [NSString stringWithFormat:@"%.1f", self.movie.imdbRating];
    self.IMDbVotesLabel.text = [NSString stringWithFormat:@"%li", self.movie.imdbVotes];
    self.metascoreLabel.text = [NSString stringWithFormat:@"%li", self.movie.metaScore];
    self.awardsLabel.text = self.movie.awards;
    self.countriesLabel.text = self.movie.country;
}

#pragma mark - Navigation

- (IBAction)movieDetailsWasPressed:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}


@end
