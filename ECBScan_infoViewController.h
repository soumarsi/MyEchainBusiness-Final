//
//  ECBScan_infoViewController.h
//  MyEchainBusiness
//
//  Created by maxcon8 on 07/01/15.
//  Copyright (c) 2015 Esolz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RMScannerView.h"
#import "RMOutlineBox.h"

@interface ECBScan_infoViewController : UIViewController<RMScannerViewDelegate>
{
    UIView *mainview;
RMScannerView *scannerView;
    NSString *usernamestring;
    NSString *emailstring;
    UILabel *cancel_lb;
    UIView *white_line;
    UIImageView *scanbar;

}
@end
