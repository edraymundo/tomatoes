//
//  Movie.m
//  tomatoes2
//
//  Created by kex on 1/12/14.
//  Copyright (c) 2014 kex. All rights reserved.
//

#import "Movie.h"

@implementation Movie

- (id)setValues:(NSDictionary *) values{

    // set title
    self.title = [values objectForKey:@"title"];
    
    //set synopsis
    self.synopsis = [values objectForKey:@"synopsis"];
 
    //set image
    NSDictionary* posters = [values objectForKey:@"posters"]; //pointer for the object posters
    NSURL* imageUrl = [NSURL URLWithString:[posters objectForKey:@"thumbnail"]]; //get url and set to imageUrl
    NSData *imageData = [NSData dataWithContentsOfURL:imageUrl]; //
    UIImage * image = [UIImage imageWithData:imageData];
    self.imageData = image;
    
    //set casts
    NSMutableArray* actorsArray = [NSMutableArray array];
    NSArray* casts = [values objectForKey:@"abridged_cast"]; // get all casts
    for (int i=0;i < casts.count; i++) { // loop through casts one at a time
        NSDictionary* cast = [casts objectAtIndex:i]; //pointer for the array
        NSString* actor = [cast objectForKey:@"name"]; // set cast name to string actor
        [actorsArray addObject:actor]; // push/append actor to array actors
    }
    self.actors = [actorsArray componentsJoinedByString:@", "];
    
    return self;
}

@end
