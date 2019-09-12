//
//  day01.m
//  AV_Study
//
//  Created by aStudyer on 2019/9/11.
//  Copyright © 2019 aStudyer. All rights reserved.
//

#import "day01.h"

@interface day01 ()

@end

@implementation day01

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.dataList enumerateObjectsUsingBlock:^(TableSectionModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        switch (obj.section) {
            case 0:
                obj.operation = ^(UITableView * _Nonnull tableView, NSInteger section) {
                    NSLog(@"section = %zd", section);
                };
                break;
                
            default:
                break;
        }
        
        [obj.items enumerateObjectsUsingBlock:^(TableRowModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            obj.operation = ^(UITableView * _Nonnull tableView, NSIndexPath * _Nonnull indexPath) {
                NSLog(@"section = %zd, row = %zd", indexPath.section, indexPath.row);
            };
        }];
    }];
}

@end
