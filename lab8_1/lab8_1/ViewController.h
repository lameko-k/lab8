//
//  ViewController.h
//  lab8_1
//
//  Created by robert on 5/15/17.
//  Copyright (c) 2017 di. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *cityFrom;

@property (weak, nonatomic) IBOutlet UITextField *cityTo;
@property (weak, nonatomic) IBOutlet MKMapView *map;
- (IBAction)showFlights:(id)sender;

@end

