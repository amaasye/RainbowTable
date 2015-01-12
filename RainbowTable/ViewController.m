//
//  ViewController.m
//  RainbowTable
//
//  Created by Syed Amaanullah on 1/12/15.
//  Copyright (c) 2015 Syed Amaanullah. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
//This is a mutable array because we want our button to be able to add random colors to the array of colors
@property NSMutableArray *colors;
@property (weak, nonatomic) IBOutlet UITableView *colorTableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.colors = [NSMutableArray arrayWithObjects:[UIColor redColor], [UIColor orangeColor], [UIColor yellowColor], [UIColor greenColor], [UIColor blueColor], [UIColor colorWithRed:75/255.0 green:0.0/255.0 blue:130.0/255.0 alpha:1], [UIColor purpleColor], nil];
}


//This pragma mark is simply to highlight the UITableViewDataSource in the organizational layout
#pragma UITableViewDataSource

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.colors.count;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ColorCellID"];
    cell.textLabel.text = [NSString stringWithFormat:@"row %li", (long)indexPath.row];

    cell.backgroundColor = [self.colors objectAtIndex:indexPath.row];

    return cell;
    }

- (IBAction)onAddRandomColor:(id)sender {
    //rand returns an integer,so we cast it as a float
    //using rand and RAND_MAX ensure that the number will always be between 0 and 1.
    CGFloat red = (float)rand() / RAND_MAX;
    CGFloat green = (float)rand() / RAND_MAX;
    CGFloat blue = (float)rand() / RAND_MAX;

    UIColor *randomColor = [UIColor colorWithRed:red green:green blue:blue alpha:1];

    [self.colors addObject:randomColor];
    [self.colorTableView reloadData];
    

}


@end
