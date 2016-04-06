//
//  DeviceViewController.h
//  Core_Data
//
//  Created by Armor on 06/04/16.
//  Copyright © 2016 Armor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DeviceViewController : UIViewController

@property (strong) NSMutableArray *devices;
@property(nonatomic,strong)IBOutlet UITableView * tableView;

@property(nonatomic,strong)IBOutlet UILabel *lbl1,*lbl2,*lbl3;

@end
