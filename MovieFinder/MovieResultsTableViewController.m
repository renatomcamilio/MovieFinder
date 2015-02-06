//
//  MovieResultsTableViewController.m
//  MovieFinder
//
//  Created by Renato Camilio on 2/4/15.
//  Copyright (c) 2015 Renato Camilio. All rights reserved.
//

#import "MovieResultsTableViewController.h"

@interface MovieResultsTableViewController ()

@property (nonatomic, strong) NSMutableArray *movies;

@end

@implementation MovieResultsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.movies = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(MovieTableViewCell *)cell {
    if ([segue.identifier isEqualToString:@"showMovieDetail"]) {
        [OMDbAPI requestWithOMDbAPIRequestType:OMDbAPIRequestTypeID
                               andRequestParam:cell.movie.imdbID
                                   andDelegate:segue.destinationViewController];
    }
}

#pragma mark - Session Data Delegate

- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data {
    NSArray *results = [[NSJSONSerialization JSONObjectWithData:data
                                                        options:NSJSONReadingAllowFragments
                                                          error:nil] valueForKey:@"Search"];
    // I could just pass &type=movie and it would return movies only,
    // but I want to play with some predicates :D
    NSPredicate *moviesPredicate = [NSPredicate predicateWithBlock:^BOOL(id evaluatedObject, NSDictionary *bindings) {
        return [[evaluatedObject valueForKey:@"Type"] isEqualToString:@"movie"];
    }];
    
    self.movies = [NSMutableArray arrayWithArray:[results filteredArrayUsingPredicate:moviesPredicate]];
    
    [session finishTasksAndInvalidate];
    [self.tableView reloadData];
}

- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error {
    if (error) {
        NSLog(@"Oh sheeeiit! Something really bad happened! %@", [error userInfo]);
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.movies count];
}

- (MovieTableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MovieTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([MovieTableViewCell class]) forIndexPath:indexPath];
    
    // I should create a custom cell class for this guy right here!
    NSDictionary *movieDictionary = [self.movies objectAtIndex:indexPath.row];
    cell.movie = [Movie movieWithDictionary:movieDictionary];
    
    return cell;
}

#pragma mark - User interaction

- (IBAction)cancelWasPressed:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

@end
