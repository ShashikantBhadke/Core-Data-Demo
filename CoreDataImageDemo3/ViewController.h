//
//  ViewController.h
//  CoreDataImageDemo3
//
//  Created by Student-002 on 26/10/16.
//  Copyright © 2016 Felix-its. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (nonatomic, retain)UIImage *img;
@property (weak, nonatomic) IBOutlet UITextField *empidtf;

@property (weak, nonatomic) IBOutlet UITextField *empnametf;

@property (weak, nonatomic) IBOutlet UIImageView *image1;

@property (weak, nonatomic) IBOutlet UIImageView *image2;

@property (weak, nonatomic) IBOutlet UIImageView *image3;

- (IBAction)Savedatabase:(id)sender;

- (IBAction)segmentcontrolclicked:(id)sender;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;
- (IBAction)deletealldatabseclicked:(id)sender;

- (IBAction)findfromdatabse:(id)sender;
- (IBAction)updatedatabse:(id)sender;

@end

