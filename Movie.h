//
//  Movie.h
//  tomatoes2
//
//  Created by kex on 1/12/14.
//  Copyright (c) 2014 kex. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Movie : NSObject

@property (strong,nonatomic) NSString *title;
@property (strong,nonatomic) NSString *synopsis;
@property (strong,nonatomic) UIImage *imageData;
@property (strong,nonatomic) NSString *actors;

- (id) setValues: (NSDictionary *) values;

@end
