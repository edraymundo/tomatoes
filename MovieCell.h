//
//  MovieCell.h
//  tomatoes2
//
//  Created by kex on 1/11/14.
//  Copyright (c) 2014 kex. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MovieCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *movieTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *movieSummaryLabel;
@property (weak, nonatomic) IBOutlet UILabel *movieCastLabel;
@property (weak, nonatomic) IBOutlet UIImageView *movieImageLabel;

@end
