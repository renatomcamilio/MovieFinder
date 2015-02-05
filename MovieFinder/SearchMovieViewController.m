//
//  ViewController.m
//  MovieFinder
//
//  Created by Renato Camilio on 2/4/15.
//  Copyright (c) 2015 Renato Camilio. All rights reserved.
//

#import "SearchMovieViewController.h"
#import "MovieResultsTableViewController.h"

@interface SearchMovieViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *searchMovieField;

@end

@implementation SearchMovieViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.searchMovieField.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showMovieResults"]) {
        UIViewController *destinationViewController;
        if ([segue.destinationViewController isKindOfClass:[UINavigationController class]]) {
            destinationViewController = [segue.destinationViewController topViewController];
        } else {
            destinationViewController = segue.destinationViewController;
        }
        
        [self searchMovies:(MovieResultsTableViewController *)destinationViewController];
    }
}

#pragma mark - Search Field

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    
    [self performSegueWithIdentifier:@"showMovieResults" sender:self];
    
    return NO;
}

#pragma mark - API Request

- (void)searchMovies:(id<NSURLSessionDataDelegate>)sessionDataDelegate {
    NSString *escapedURLString = [[NSString stringWithFormat:@"http://www.omdbapi.com/?s=%@&r=json", self.searchMovieField.text] stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *omdbURL = [NSURL URLWithString:escapedURLString];
    NSURLRequest *omdbURLRequest = [NSURLRequest requestWithURL:omdbURL];
    
    NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:@"com.renatocamilio.MovieFinder.horse"];
    
    NSURLSession *omdbURLSession = [NSURLSession sessionWithConfiguration:sessionConfig
                                                                 delegate:sessionDataDelegate
                                                            delegateQueue:[NSOperationQueue mainQueue]];
    [[omdbURLSession dataTaskWithRequest:omdbURLRequest] resume];
}

@end
