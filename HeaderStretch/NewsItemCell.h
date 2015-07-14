//
//  NewsItemCell.h
//  HeaderStretch
//
//  Created by Josh Endter on 7/14/15.
//  Copyright (c) 2015 Josh Endter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsItemCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;
@property (weak, nonatomic) IBOutlet UILabel *headlineLabel;

@end
