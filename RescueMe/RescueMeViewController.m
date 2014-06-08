//
//  ViewController.m
//  RescueMe
//
//  Created by Ahmad Samra on 6/7/14.
//  Copyright (c) 2014 Ahmad Samra. All rights reserved.
//

#import "RescueMeViewController.h"

@interface RescueMeViewController ()

@end

@implementation RescueMeViewController
@synthesize lblStatus,userLocation,manager;


//Initialising the application to get use location
            
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    rescue =[RescueMe sharedManager];
    [rescue start];
    rescue.delegate = self;
    
}

-(void)isLocationManagerDelegateTriggered:(CLLocation *) location
{
    // works only first time, but gets triggered every time
    [rescue stop];
    rescue.delegate = nil;
    NSString * str = [NSString stringWithFormat:@"latitude = %f longitude = %f",location.coordinate.latitude, location.coordinate.longitude];
    if(str == nil)
    {
        lblStatus.text = [NSString stringWithFormat:@"غير متصل"];

    }else{
        userLocation =[NSString stringWithFormat:@"موقعي هو: %@",str];
        lblStatus.text = [NSString stringWithFormat:@"متصل "];
    }
}


//Sending SMS notification to one short code

-(IBAction)sendResueMe{
    
    [self sendSMS:userLocation recipientList:[NSArray arrayWithObjects:@"1234", nil]];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


//Preparing the SMS message with proper attributes

- (void)sendSMS:(NSString *)bodyOfMessage recipientList:(NSArray *)recipients
{
    MFMessageComposeViewController *controller = [[MFMessageComposeViewController alloc] init];
    if([MFMessageComposeViewController canSendText])
    {
        controller.body = bodyOfMessage;
        controller.recipients = recipients;
        controller.messageComposeDelegate = self;
        [self presentViewController:controller animated:YES completion:nil];
    }
}


//Message sending status

- (void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result
{
    switch (result) {
        case MessageComposeResultCancelled:
            NSLog(@"Message was cancelled");
            lblStatus.text = [NSString stringWithFormat:@"الغي الارسال"];
            [self dismissViewControllerAnimated:YES completion:NULL];
            break;
        case MessageComposeResultFailed:
            NSLog(@"Message failed");
            lblStatus.text = [NSString stringWithFormat:@"فشل في الارسال"];
            [self dismissViewControllerAnimated:YES completion:NULL];
            break;
        case MessageComposeResultSent:
            NSLog(@"Message was sent");
            lblStatus.text = [NSString stringWithFormat:@"تم الارسال"];
            [self dismissViewControllerAnimated:YES completion:NULL];
            break;
        default:
            break;
    }
}

@end
