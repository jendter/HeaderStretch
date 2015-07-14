//
//  NewsItem.m
//  HeaderStretch
//
//  Created by Josh Endter on 7/14/15.
//  Copyright (c) 2015 Josh Endter. All rights reserved.
//

#import "NewsItem.h"

@implementation NewsItem

- (instancetype)initWithNewsCategory:(NewsCategory)newsCategory headline:(NSString *)headline
{
    self = [super init];
    if (self) {
        _newsCategory = newsCategory;
        _headline = headline;
    }
    return self;
}

/*
NewsCategoryWorld,
NewsCategoryAmericas,
NewsCategoryEurope,
NewsCategoryMiddleEast,
NewsCategoryAfrica,
NewsCategoryAsiaPacific
*/



- (NSString *)newsCategoryStringRepresentation{
    switch (self.newsCategory) {
        case NewsCategoryWorld:
            return @"World";
            break;
            
        case NewsCategoryAmericas:
            return @"Americas";
            break;
        
        case NewsCategoryEurope:
            return @"Europe";
            break;
        
        case NewsCategoryMiddleEast:
            return @"Middle East";
            break;
        
        case NewsCategoryAfrica:
            return @"Africa";
            break;
            
        case NewsCategoryAsiaPacific:
            return @"Asia Pacific";
            break;
            
        default:
            break;
    }
}

@end
