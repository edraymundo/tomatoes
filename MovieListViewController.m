//
//  MovieListViewController.m
//  tomatoes2
//
//  Created by kex on 1/11/14.
//  Copyright (c) 2014 kex. All rights reserved.
//

#import "MovieListViewController.h"
#import "MovieCell.h"
#import "Movie.h"

@interface MovieListViewController ()

@property (nonatomic,strong) NSArray *movies;

@end

@implementation MovieListViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
     //self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (id) initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if(self){
        NSString *url = @"http://api.rottentomatoes.com/api/public/v1.0/lists/dvds/top_rentals.json?apikey=g9au4hv6khv6wzvzgt55gpqs";
        
        NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
        [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
            id object = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
            
            self.movies = [object valueForKeyPath:@"movies"];
            
            //NSLog(@"%@", object);
            [self.tableView reloadData]; // call tableView again
        }];
    }
    return self;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.movies.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MovieCell";
    MovieCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    NSDictionary *movie = [self.movies objectAtIndex:indexPath.row];
    
    Movie* movieModel = [[Movie alloc] init];
    [movieModel getValues:movie];

    //set movie title
    cell.movieTitleLabel.numberOfLines = 2;
    cell.movieTitleLabel.text = movieModel.title;
    
    //set movie description
    cell.movieSummaryLabel.numberOfLines = 5;
    cell.movieSummaryLabel.text = movieModel.synopsis;

    //set movie image
    cell.movieImageLabel.image = movieModel.imageData;
    
    //set movie casts
    cell.movieCastLabel.numberOfLines = 3;
    cell.movieCastLabel.text = movieModel.actors;
    
    return cell;
}


@end
