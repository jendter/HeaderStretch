//
//  DetailViewController.h
//  HeaderStretch
//
//  Created by Josh Endter on 7/14/15.
//  Copyright (c) 2015 Josh Endter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end

