//
//  MovieCell.m
//  tomatoes2
//
//  Created by kex on 1/11/14.
//  Copyright (c) 2014 kex. All rights reserved.
//

#import "MovieCell.h"

@interface MovieCell ()

@end

@implementation MovieCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
