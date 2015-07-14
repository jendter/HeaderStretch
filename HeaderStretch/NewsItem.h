//
//  NewsItem.h
//  HeaderStretch
//
//  Created by Josh Endter on 7/14/15.
//  Copyright (c) 2015 Josh Endter. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, NewsCategory) {
    NewsCategoryWorld,
    NewsCategoryAmericas,
    NewsCategoryEurope,
    NewsCategoryMiddleEast,
    NewsCategoryAfrica,
    NewsCategoryAsiaPacific
};

@interface NewsItem : NSObject

- (instancetype)initWithNewsCategory:(NewsCategory)newsCategory headline:(NSString *)headline;

@property (assign, nonatomic) NewsCategory newsCategory;
- (NSString *)newsCategoryStringRepresentation;
@property (strong, nonatomic) NSString *headline;

@end
