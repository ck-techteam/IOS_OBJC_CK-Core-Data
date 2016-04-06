//
//  DeviceViewController.m
//  Core_Data
//
//  Created by Armor on 06/04/16.
//  Copyright © 2016 Armor. All rights reserved.
//

#import "DeviceViewController.h"
#import "AppDelegate.h"
#import "DeviceTableViewCell.h"

@interface DeviceViewController ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation DeviceViewController

- (NSManagedObjectContext *)managedObjectContext
{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)])
    {
        context = [delegate managedObjectContext];
    }
    return context;
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // Fetch the devices from persistent data store
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Device"];
    self.devices = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
    [self.tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.devices.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    DeviceTableViewCell *cell = (DeviceTableViewCell*)[_tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
   // NSUInteger row=indexPath.row;
    
    if (cell == nil)
    {
        NSArray *nib;
        
        nib= [[NSBundle mainBundle] loadNibNamed:@"DeviceTableViewCell" owner:self options:nil];
        cell = [nib objectAtIndex:0];
        
          }
    
    // Configure the cell...
    NSManagedObject *device = [self.devices objectAtIndex:indexPath.row];
    
    cell.lbl.text = [device valueForKeyPath:@"name"];
    
//    [cell.textLabel setText:[NSString stringWithFormat:@"%@              %@", [device valueForKey:@"name"], [device valueForKey:@"version"]]];
//    [cell.detailTextLabel setText:[device valueForKey:@"company"]];
    
    return cell;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
