//
//  ViewController.m
//  lab8_1
//
//  Created by robert on 5/15/17.
//  Copyright (c) 2017 di. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    int isCity;
    MKPointAnnotation *annotatiionFrom;
    MKPointAnnotation *annotatiionTo;
}

@end

@implementation ViewController 
- (void)viewDidLoad {
    [super viewDidLoad];
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UILongPressGestureRecognizer *longPressGesture =
    [[UILongPressGestureRecognizer alloc] initWithTarget:self
                                                  action:@selector(handleLongPressGesture:)];
    [self.map addGestureRecognizer:longPressGesture];
    
    // Do any additional setup after loading the view, typically from a /Users/robert/Desktop/lab8/lab8_1/lab8_1/ViewController.mnib.
}

-(void)handleLongPressGesture:(UIGestureRecognizer*)sender
{
    if (sender.state == UIGestureRecognizerStateEnded)
    {
        CGPoint point = [sender locationInView:self.map];
        CLGeocoder *geocoder = [[CLGeocoder alloc] init];
        CLLocationCoordinate2D coord = [self.map convertPoint:point
                                         toCoordinateFromView:self.map];
        CLLocation *location = [[CLLocation alloc]
                                initWithLatitude:coord.latitude longitude:coord.longitude];
        [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error)
         {
             if (error)
             {
                 NSLog(@"Geocode failed with error: %@", error);
                 return;
             }
             for (CLPlacemark * placemark in placemarks) {
                 [self setAnnotationToMap:isCity :placemark.locality
                                         :coord];
             }
         }];
    }
}

-(void)setAnnotationToMap:(int)type :(NSString *)title
                         :(CLLocationCoordinate2D)coordinate
{
    if (type == 0) {
        [_map removeAnnotation:annotationFrom];
        annotationFrom = [[MKPointAnnotation alloc] init];
        annotationFrom.title = title;
        annotationFrom.coordinate = coordinate;
        [_map addAnnotation:annotationFrom];
        self.cityFrom.text = title;
    }
    else
    {
        [_map removeAnnotation:annotationTo];
        annotationTo = [[MKPointAnnotation alloc] init];
        annotationTo.title = title;
        annotationTo.coordinate = coordinate;
        [_map addAnnotation:annotationTo];
        self.cityTo.text = title;
    }
}

-(void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField == self.cityFrom)
        isCity = 0;
    else if (textField == self.cityTo)
        isCity = 1;
    [textField resignFirstResponder];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)showFlights:(id)sender {
    FlithsViewController *flights =[[FlithsViewController
                                     alloc]initWithBothCity:self.textFrom.text :self.textTo.text];
    [self presentViewController:flights animated:YES completion:nil];}
@end
