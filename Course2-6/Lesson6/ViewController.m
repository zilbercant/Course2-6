//
//  ViewController.m
//  Lesson6
//
//  Created by Azat Almeev on 09.10.15.
//  Copyright © 2015 Azat Almeev. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.items = [NSMutableArray new];
}

- (IBAction)returnHere:(UIStoryboardSegue *)sender {
    SecondViewController *svc = sender.sourceViewController;
    NSInteger count = [svc.label.text integerValue];
    if (self.items.count > count)
        [self.items removeObjectsInRange:NSMakeRange(count, self.items.count - count)];
    else {
        NSInteger delta = count - self.items.count;
        for (NSInteger i = 0; i < delta; i++)
            [self.items addObject:@(self.items.count)];
    }
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    cell.textLabel.text = [NSString stringWithFormat:@"%@", @(indexPath.row)];
    return cell;
}

@end
