//
//  ViewController.h
//  RescueMe
//
//  Created by Ahmad Samra on 6/7/14.
//  Copyright (c) 2014 Ahmad Samra. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>
#import "RescueMe.h"

@interface RescueMeViewController : UIViewController <UINavigationControllerDelegate,MFMessageComposeViewControllerDelegate> {
    
    RescueMe *rescue;
    IBOutlet UILabel *lblStatus;
    IBOutlet UIButton *sendLocation;
    NSString *userLocation;
    CLLocationManager *manager;
}

@property (nonatomic, retain) RescueMe *__rescue;
@property (nonatomic, retain) NSString *userLocation;
@property (nonatomic, retain) UILabel *lblStatus;
@property (nonatomic, retain) CLLocationManager *manager;

@end

