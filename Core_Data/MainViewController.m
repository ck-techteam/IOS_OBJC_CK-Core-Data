//
//  MainViewController.m
//  Core_Data
//
//  Created by Armor on 06/04/16.
//  Copyright © 2016 Armor. All rights reserved.
//

#import "MainViewController.h"
#import "AppDelegate.h"
#import "DeviceViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

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
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"Core Data";
}


- (IBAction)save:(id)sender
{
    NSManagedObjectContext *context = [self managedObjectContext];
    
    // Create a new managed object
    NSManagedObject *newDevice = [NSEntityDescription insertNewObjectForEntityForName:@"Device" inManagedObjectContext:context];
    [newDevice setValue:self.nameTextField.text forKey:@"name"];
    [newDevice setValue:self.versionTextField.text forKey:@"version"];
    [newDevice setValue:self.companyTextField.text forKey:@"company"];
    
    self.nameTextField.text=nil;
    self.versionTextField.text=nil;
    self.companyTextField.text=nil;
    
    NSLog(@"Saved data is : %@",newDevice);

    NSError *error = nil;
    // Save the object to persistent store
    if (![context save:&error])
    {
        NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
    }
    
    //[self dismissViewControllerAnimated:YES completion:nil];
    DeviceViewController *deviceObj = [[DeviceViewController alloc]initWithNibName:@"DeviceViewController" bundle:nil];
    [self.navigationController pushViewController:deviceObj animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
