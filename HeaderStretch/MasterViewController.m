//
//  MasterViewController.m
//  HeaderStretch
//
//  Created by Josh Endter on 7/14/15.
//  Copyright (c) 2015 Josh Endter. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "NewsItemCell.h"
#import "NewsItem.h"

const CGFloat kTableHeaderHeight = 326.0;

@interface MasterViewController ()

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;
@property (weak, nonatomic) IBOutlet UIView *tableHeaderView;

@property (strong, nonatomic) UIView *headerView;


@property NSMutableArray *objects;
@end

@implementation MasterViewController

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Create Demo Data
    [self createDemoData];
    
    // Format and the date (in the header)
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setTimeZone:[NSTimeZone localTimeZone]];
    [formatter setDateFormat:@"MMMM dd"];
    self.dateLabel.text = [formatter stringFromDate:[NSDate date]];
    
    // Take the table view header out of being managed by the table
    self.tableView.tableHeaderView = nil;
    NSLog(@"%@", self.tableHeaderView);
    [self.tableView addSubview:self.tableHeaderView];
    
    // Set the table view insets and offsets
    // This allows the header view to stretch properly
    self.tableView.contentInset = UIEdgeInsetsMake(kTableHeaderHeight, 0, 0, 0);
    [self updateHeaderView];
    
    // Set the rows to automatically resize
    self.tableView.estimatedRowHeight = 40.0;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
}

-(void)updateHeaderView {
    NSLog(@"Current Offset: %f", self.tableView.contentOffset.y);
    CGRect headerRect = CGRectMake(0.0, -kTableHeaderHeight, self.tableView.bounds.size.width, kTableHeaderHeight);
    if (self.tableView.contentOffset.y < -kTableHeaderHeight) {
        headerRect.origin.y = 0;
        headerRect.size.height = self.tableView.contentOffset.y;
    }
    self.tableHeaderView.frame = headerRect;
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)prefersStatusBarHidden{
    return YES;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self updateHeaderView];
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDate *object = self.objects[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NewsItemCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    NewsItem *newsItem = self.objects[indexPath.row];
    
    UIColor *categoryColor;
    if (newsItem.newsCategory == NewsCategoryWorld) {
        categoryColor = [UIColor colorWithRed:0 green:0.75 blue:0.24 alpha:1];
    } else if (newsItem.newsCategory == NewsCategoryAmericas) {
        categoryColor = [UIColor colorWithRed:0.23 green:0.78 blue:0.84 alpha:1];
    } else if (newsItem.newsCategory == NewsCategoryEurope) {
        categoryColor = [UIColor colorWithRed:0.49 green:0.32 blue:0.82 alpha:1];
    } else if (newsItem.newsCategory == NewsCategoryMiddleEast) {
        categoryColor = [UIColor colorWithRed:0.47 green:0 blue:0.75 alpha:1];
    } else if (newsItem.newsCategory == NewsCategoryAfrica) {
        categoryColor = [UIColor colorWithRed:0.68 green:0.07 blue:0.24 alpha:1];
    } else if (newsItem.newsCategory == NewsCategoryAsiaPacific) {
        categoryColor = [UIColor colorWithRed:0.71 green:0.89 blue:0.4 alpha:1];
    } else {
        categoryColor = [UIColor blueColor];
    }
    
    // Set the cell attributes
    cell.categoryLabel.textColor = categoryColor;
    cell.categoryLabel.text = [newsItem newsCategoryStringRepresentation];
    cell.headlineLabel.text = newsItem.headline;
    
    // Make sure the cell resizes correctly
    self.tableView.estimatedRowHeight = 40.0;
    [cell layoutIfNeeded];

    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return NO;
}


#pragma mark - Create Demo Data

-(void)createDemoData {
    NewsItem *newsItem1 = [[NewsItem alloc] initWithNewsCategory:NewsCategoryWorld headline:@"Climate change protests, divestments meet fossil fuels realities"];
    NewsItem *newsItem2 = [[NewsItem alloc] initWithNewsCategory:NewsCategoryEurope headline:@"Scotland's 'Yes' leader says independence vote is 'once in a lifetime"];
    NewsItem *newsItem3 = [[NewsItem alloc] initWithNewsCategory:NewsCategoryMiddleEast headline:@"Airstrikes boost Islamic State, FBI director warns more hostages possible"];
    NewsItem *newsItem4 = [[NewsItem alloc] initWithNewsCategory:NewsCategoryAfrica headline:@"Nigeria says 70 dead in building collapse; questions S. Africa victim claim"];
    NewsItem *newsItem5 = [[NewsItem alloc] initWithNewsCategory:NewsCategoryAsiaPacific headline:@"Despite UN ruling, Japan seeks backing for whale hunting"];
    NewsItem *newsItem6 = [[NewsItem alloc] initWithNewsCategory:NewsCategoryAmericas headline:@"Officials: FBI is tracking 100 Americans who fought alongside IS in Syria"];
    NewsItem *newsItem7 = [[NewsItem alloc] initWithNewsCategory:NewsCategoryWorld headline:@"South Africa in $40 billion deal for Russian nuclear reactors"];
    NewsItem *newsItem8 = [[NewsItem alloc] initWithNewsCategory:NewsCategoryEurope headline:@"'One million babies' created by EU student exchanges"];
    
    NSArray *newsItems = @[newsItem1, newsItem2, newsItem3, newsItem4, newsItem5, newsItem6, newsItem7, newsItem8];
    
    self.objects = [newsItems mutableCopy];
}

@end
