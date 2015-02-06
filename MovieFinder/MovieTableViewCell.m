//
//  MovieTableViewCell.m
//  MovieFinder
//
//  Created by Renato Camilio on 2/5/15.
//  Copyright (c) 2015 Renato Camilio. All rights reserved.
//

#import "MovieTableViewCell.h"

@implementation MovieTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

#pragma mark - Getter & Setter

- (void)setMovie:(Movie *)movie {
    _movie = movie;
    self.textLabel.text = _movie.title;
    self.detailTextLabel.text = [NSString stringWithFormat:@"%li", _movie.year];
}

@end
