//
//  ECBCust_infoViewController.h
//  MyEchainBusiness
//
//  Created by maxcon8 on 07/01/15.
//  Copyright (c) 2015 Esolz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ECBScan_infoViewController.h"
@interface ECBCust_infoViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    
    UIView *mainview;
     UIView *headview;
    UIImageView *profimg,*info_img,*hist_img,*redg_img,*reedm_back,*info_view;
    UIButton *incr_btn,*decr_btn;
    UILabel *incr_cnt,*reedm_cnt;
    NSMutableArray *data_arr;
    NSMutableArray *detailsarray;
    NSMutableDictionary *result;
    UIView *black_bg,*black_bg_hist,*hist_view;
    NSMutableDictionary *redm_dict;
    NSString *done_str,*redeem_url;
    UITapGestureRecognizer *redeem_tap;
    UIImageView *back_bg;
    NSMutableArray *hist_arr;
    UITableView  *hist_tableview,*ListTableview;
    UILabel *infolb,*histlb,*redglb;
    int temp_index,temp_index1;
    
}

@property(nonatomic,retain)NSString *emailstr;
@property(nonatomic,retain)NSString *usernamestr;


@end
