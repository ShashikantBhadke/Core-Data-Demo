//
//  ViewController.m
//  CoreDataImageDemo3
//
//  Created by Student-002 on 26/10/16.
//  Copyright © 2016 Felix-its. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "Employee.h"
#import "CollectionViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)Savedatabase:(id)sender
{
    UIApplication *myapplication=[UIApplication sharedApplication];
    AppDelegate *myappdelegate= (AppDelegate *)myapplication.delegate;
    NSManagedObjectContext *context= myappdelegate.managedObjectContext;
    
    
    Employee *emp=[NSEntityDescription insertNewObjectForEntityForName:@"Employee" inManagedObjectContext:context];
    emp.empid=[NSNumber numberWithInteger:[_empidtf.text intValue]];
    emp.empname=_empnametf.text;
    emp.empimg=[NSData dataWithData:UIImagePNGRepresentation(_img)];
    
    //For collection view controller
    
    CollectionViewController *cvc=[[CollectionViewController alloc]init];
    [cvc.collectionarray addObject:_img];
    
    
    [context save:nil];
}

- (IBAction)segmentcontrolclicked:(id)sender
{
    UISegmentedControl *segment = (UISegmentedControl *)sender;
    
    if(segment.selectedSegmentIndex==0)
    {
        _img=[UIImage imageNamed:@"1"];
        _image1.image=[UIImage imageNamed:@"1"];
        _image2.image=nil;
        _image3.image=nil;
    }
    else if(segment.selectedSegmentIndex==1)
    {
        _img=[UIImage imageNamed:@"3"];
        _image2.image=[UIImage imageNamed:@"3"];
        _image1.image=nil;
        _image3.image=nil;
        
    }
    else if(segment.selectedSegmentIndex==2)
    {
        _img=[UIImage imageNamed:@"India"];
        _image3.image=[UIImage imageNamed:@"India"];
        _image2.image=nil;
        _image1.image=nil;
    }
    }
- (IBAction)deletealldatabseclicked:(id)sender
{
    UIApplication *myapplication=[UIApplication sharedApplication];
    AppDelegate *myappdelegate= (AppDelegate *)myapplication.delegate;
    NSManagedObjectContext *context= myappdelegate.managedObjectContext;
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:[NSEntityDescription entityForName:@"Employee" inManagedObjectContext:context]];
    
    NSError *error = nil;
    
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"eno == %@", _txtEno.text];
//    [request setPredicate:predicate];
    
    NSArray *results = [context executeFetchRequest:request error:&error];
    
    
    for( Employee *temp  in   results )
    {
        [context deleteObject:temp];
    }
    
}

- (IBAction)findfromdatabse:(id)sender
{
    if([_empidtf hasText])
    {
        UIApplication *myapplication=[UIApplication sharedApplication];
        AppDelegate *myappdelegate= (AppDelegate *)myapplication.delegate;
        NSManagedObjectContext *context= myappdelegate.managedObjectContext;
        
        NSFetchRequest *request = [[NSFetchRequest alloc] init];
        [request setEntity:[NSEntityDescription entityForName:@"Employee" inManagedObjectContext:context]];
        
        NSError *error = nil;
        
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"empid == %@", _empidtf.text];
        [request setPredicate:predicate];
        
        NSArray *results = [context executeFetchRequest:request error:&error];
        
        
        for( Employee *temp  in   results )
        {
            _empnametf.text=temp.empname;
        }
        if(YES == [context save:nil])
        {
            NSLog(@"Record Find successfully");
            [self.navigationController popViewControllerAnimated:YES];
        }
        else
        {
            NSLog(@"Failed to find record");
        }
        
    }
}

- (IBAction)updatedatabse:(id)sender
{
    UIApplication *myapplication=[UIApplication sharedApplication];
    AppDelegate *myappdelegate= (AppDelegate *)myapplication.delegate;
    NSManagedObjectContext *context= myappdelegate.managedObjectContext;
    
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:[NSEntityDescription entityForName:@"Employee" inManagedObjectContext:context]];
    
    NSError *error = nil;
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"empid == %@", _empidtf.text];
    [request setPredicate:predicate];
    
    NSArray *results = [context executeFetchRequest:request error:&error];
    
    
    for( Employee *temp  in   results )
    {
        temp.empname = _empnametf.text;
        temp.empimg=[NSData dataWithData:UIImagePNGRepresentation(_img)];;;
    }
    if(YES == [context save:nil])
    {
        NSLog(@"Record Updated successfully");
        [self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        NSLog(@"Failed to update record");
    }

}
@end
