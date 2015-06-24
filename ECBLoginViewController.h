//
//  ECBLoginViewController.h
//  MyEchainBusiness
//
//  Created by maxcon8 on 07/01/15.
//  Copyright (c) 2015 Esolz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ECBLoginViewController : UIViewController<UITextFieldDelegate>
{

    UIView *mainview;
    UITextField *emailtxt,*passwrdtxt;
    UIButton *chkbox;
    BOOL termBoxSelected;
    UIAlertView *alert;
    UIImageView *imgspin;
    NSDictionary *loginjson;
    UIActivityIndicatorView *spinnern;
    NSMutableDictionary *user_det;

}
@end
