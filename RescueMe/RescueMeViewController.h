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

@interface RescueMeViewController : UIViewController <CoreLocationControllerDelegate,MFMessageComposeViewControllerDelegate> {
    
    RescueMe *rescue;
    IBOutlet UILabel *lblStatus;
    IBOutlet UIButton *sendLocation;
    NSString *userLocation;
}

@property (nonatomic, retain) RescueMe *__rescue;
@property (nonatomic, retain) NSString *userLocation;
@property (nonatomic, retain) UILabel *lblStatus;

@end

