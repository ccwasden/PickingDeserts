//
//  PDPickerViewController.m
//  PickingDesserts
//
//  Created by Joshua Howland on 6/5/14.
//  Copyright (c) 2014 DevMountain. All rights reserved.
//

#import "PDPickerViewController.h"
#import "UIPickerView+Blocks.h"

@interface PDPickerViewController ()

@end

@implementation PDPickerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    UILabel *picked = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 30)];
    picked.textAlignment = NSTextAlignmentCenter;
    picked.font = [UIFont boldSystemFontOfSize:20];
    [self.view addSubview:picked];
    
    
    UIPickerView *picker = [UIPickerView new];
    picker.frame = CGRectMake(0, (self.view.frame.size.height - picker.frame.size.height) / 2, picker.frame.size.width, picker.frame.size.height);
    [picker setTitles:[self data]];
    [picker handleSelectionWithBlock:^(UIPickerView *pickerView, NSInteger row, NSInteger component) {
        picked.text = [NSString stringWithFormat:@"%@ %@ %@", [self data][0][[pickerView selectedRowInComponent:0]], [self data][1][[pickerView selectedRowInComponent:1]], [self data][2][[pickerView selectedRowInComponent:2]]];
    }];
    [self.view addSubview:picker];
    
}

- (NSArray *)data {

    return @[
             [self fruits],
             [self liquids],
             [self desserts]
             ];
    
}

- (NSArray *)fruits {

    return @[@"banana",
             @"orange",
             @"apple"];
}

- (NSArray *)liquids {
    return @[@"milk",
             @"soda",
             @"coffee"];
}

- (NSArray *)desserts {
    return @[@"shake",
             @"sundae",
             @"cookie"];
}

@end