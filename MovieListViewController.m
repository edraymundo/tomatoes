//
//  MovieListViewController.m
//  tomatoes2
//
//  Created by kex on 1/11/14.
//  Copyright (c) 2014 kex. All rights reserved.
//

#import "MovieListViewController.h"
#import "MovieCell.h"

@interface MovieListViewController ()



@property (nonatomic,strong) NSArray *movies;

@end

@implementation MovieListViewController

//- (id)initWithStyle:(UITableViewStyle)style
//{
  //  self = [super initWithStyle:style];
    //if (self) {
      //  self.movies = [NSArray array]; // empty array
   // }
    
    //NSLog(@"testing123");
    //return self;
//}

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSLog(@"testing123");
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

    //set movie title
    cell.movieTitleLabel.text = [movie objectForKey:@"title"];
    cell.movieTitleLabel.numberOfLines = 2;
    
    //set movie description
    cell.movieSummaryLabel.numberOfLines = 5;
    cell.movieSummaryLabel.text = [movie objectForKey:@"synopsis"];

    //set movie image
    NSDictionary* posters = [movie objectForKey:@"posters"]; //pointer for the object posters
    NSURL* imageUrl = [NSURL URLWithString:[posters objectForKey:@"thumbnail"]]; //get url and set to imageUrl
    NSData *imageData = [NSData dataWithContentsOfURL:imageUrl]; //
    UIImage * image = [UIImage imageWithData:imageData];
    cell.movieImageLabel.image = image;
    
    //set movie casts
    NSMutableArray* actors = [NSMutableArray array];
    NSArray* casts = [movie objectForKey:@"abridged_cast"]; // get all casts
    for (int i=0;i < casts.count; i++) { // loop through casts one at a time
        NSDictionary* cast = [casts objectAtIndex:i]; //pointer for the array
        NSString* actor = [cast objectForKey:@"name"]; // set cast name to string actor
        [actors addObject:actor]; // push/append actor to array actors
    }
    cell.movieCastLabel.numberOfLines = 3;
    cell.movieCastLabel.text = [actors componentsJoinedByString:@", "];
    
    return cell;
}


@end
