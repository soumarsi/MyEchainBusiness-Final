//
//  ECBCust_infoViewController.m
//  MyEchainBusiness
//
//  Created by maxcon8 on 07/01/15.
//  Copyright (c) 2015 Esolz. All rights reserved.
//

#import "ECBCust_infoViewController.h"
#import "ViewController.h"
#import "ECBScan_infoViewController.h"
#import "ECBLoginViewController.h"
#import "UIImageView+WebCache.h"
@interface ECBCust_infoViewController ()

@end

@implementation ECBCust_infoViewController
@synthesize emailstr,usernamestr;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    mainview=[[UIView alloc]initWithFrame:CGRectMake([[UIScreen mainScreen]bounds].origin.x, [[UIScreen mainScreen]bounds].origin.y, [[UIScreen mainScreen]bounds].size.width , [[UIScreen mainScreen]bounds].size.height )];
    mainview.backgroundColor = [UIColor clearColor];
    //mainview.backgroundColor=[UIColor redColor];
    [self.view addSubview:mainview];
    
    
    UIImageView *backimage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen]bounds].size.width, [[UIScreen mainScreen]bounds].size.height )];
    [backimage setImage:[UIImage imageNamed:@"1-splashbg"]];
    [mainview addSubview:backimage];
    
    
    headview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen]bounds].size.width , 70)];
    headview.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"topbar"]];
    [mainview addSubview:headview];
    
    
    UILabel *head_lb=[[UILabel alloc]initWithFrame:CGRectMake(0,30, [[UIScreen mainScreen]bounds].size.width, 29.5f)];
    head_lb.text=@"User Details";
    head_lb.textAlignment=NSTextAlignmentCenter;
    head_lb.textColor=[UIColor whiteColor];
    head_lb.font=[UIFont fontWithName:@"HelveticaNeueLTStd-Bd" size:20];
    [headview addSubview:head_lb];
    
    
    //    UILabel *header=[[UILabel alloc]initWithFrame:CGRectMake(0, 18, [[UIScreen mainScreen]bounds].size.width, 50)];
    //    header.text=@"USER DETAILS";
    //    header.textColor=[UIColor blackColor];
    //    header.font=[UIFont fontWithName:@"Helvetica" size:20];
    //    header.textAlignment=NSTextAlignmentCenter;
    //    [headview addSubview:header];
    
    
    
    UIImageView *back=[[UIImageView alloc]initWithFrame:CGRectMake(15, 32, 23/2, 41/2)];
    back.image=[UIImage imageNamed:@"back_arrow"];
    [headview addSubview:back];
    
    
    UIView *backview=[[UIView alloc]initWithFrame:CGRectMake(0, 15, 60, 45)];
    backview.backgroundColor=[UIColor clearColor];
    [headview addSubview:backview];
    
    ////////////////////////////////
    UITapGestureRecognizer *back_tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(back)];
    [backview addGestureRecognizer:back_tap];
    backview.userInteractionEnabled=YES;
    
    
    
    UIButton *logout = [UIButton buttonWithType:UIButtonTypeCustom];
    [logout setFrame:CGRectMake([[UIScreen mainScreen]bounds].size.width-40, 25, 25, 25)];
    [logout setBackgroundImage:[UIImage imageNamed:@"logoutthree"] forState:UIControlStateNormal];
    [logout addTarget:self action:@selector(logout) forControlEvents:UIControlEventTouchUpInside];
    [headview addSubview:logout];
    
     UIView *log_view=[[UIView alloc]initWithFrame:CGRectMake([[UIScreen mainScreen]bounds].size.width-80, 10, 80, 60)];
    log_view.backgroundColor=[UIColor clearColor];
    [headview addSubview:log_view];
    
    
    UITapGestureRecognizer *log_tap= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(logout)];
    log_tap.numberOfTapsRequired=1;
    [log_view addGestureRecognizer:log_tap];
    
    
    
    dispatch_queue_t queue = dispatch_queue_create("com.example.MyQueue", NULL);
    dispatch_async(queue, ^{
        
        // Do some computation here.
        // Update UI after computation.
        
        dispatch_async(dispatch_get_main_queue(), ^{
            ///////////////////////////////
            
            
            UIImageView   *imgspin = [[UIImageView alloc] initWithFrame:CGRectMake(110, 180, 100, 100)];
            [imgspin setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:.56]];
            // imgspin.backgroundColor=[UIColor blackColor];
            [imgspin setUserInteractionEnabled:NO];
            imgspin.clipsToBounds=YES;
            imgspin.layer.cornerRadius=20;
            [[imgspin layer] setZPosition:2];
            [mainview addSubview:imgspin];
            [imgspin setHidden:YES];
            
            //start loader animation
            
            UIActivityIndicatorView  *spinnern = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
            spinnern.hidesWhenStopped = YES;
            spinnern.backgroundColor=[UIColor clearColor];
            
            spinnern.frame=CGRectMake(25,25,50,50);
            [imgspin addSubview: spinnern];
            
            
            
            
            NSError *error;
            
         
            
            
            NSString *urlString = [NSString stringWithFormat:@"http://esolz.co.in/lab1/Web/myEchain/Iosapp/cust_details.php?email=%@",emailstr];
            
            NSData *dataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
            
            NSLog(@"dataurl is %@",urlString);
            
            detailsarray = [NSJSONSerialization JSONObjectWithData:dataURL options:kNilOptions error:&error];
            if (detailsarray.count==0) {
                NSLog(@"show alert");
                
                UIAlertView *chosseSource = [[UIAlertView alloc] initWithTitle:@"Sorry!!!"
                                                                       message:@"Not a valid customer"
                                                                      delegate:self
                                                             cancelButtonTitle:@"OK"
                                                             otherButtonTitles:nil, nil];
                [chosseSource show];
                
                ECBScan_infoViewController *scan=[[ECBScan_infoViewController alloc]init];
                [self.navigationController pushViewController:scan animated:NO];
                
            }
            else
            {
            
                
                NSLog(@"company id====>%@",[[NSUserDefaults    standardUserDefaults]objectForKey:@"company_id"]);
                
                
                 NSString *urlString1 = [NSString stringWithFormat:@"http://www.esolz.co.in/lab1/Web/myEchain/Iosapp/deal_details.php?company_id=%@&user_id=%@",[[NSUserDefaults    standardUserDefaults]objectForKey:@"company_id"],[[detailsarray objectAtIndex:0]objectForKey:@"id"]];
                
                NSData *dataURL1 = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString1]];
                
                NSLog(@"dataurl is %@",urlString1);
                
                redm_dict = [NSJSONSerialization JSONObjectWithData:dataURL1 options:kNilOptions error:&error];
                
                
                
                
                
                NSLog(@"pic url  :%@",[[detailsarray objectAtIndex:0]objectForKey:@"user_pic_normal"]);
                
                
                if (![[[detailsarray objectAtIndex:0]objectForKey:@"facebookid"]isEqualToString:@""]) {
                    
                    
                    NSLog(@"fb theke");
                    profimg=[[UIImageView alloc]initWithFrame:CGRectMake([[UIScreen mainScreen]bounds].size.width/2-62.5, headview.frame.origin.y+headview.frame.size.height+30, 250/2, 250/2)];
                    
                    [profimg sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://graph.facebook.com/%@/picture?type=large",[[detailsarray objectAtIndex:0]objectForKey:@"facebookid"]]] placeholderImage:[UIImage imageNamed:@"profile-pic"] options:/* DISABLES CODE */ (0) == 0?SDWebImageRefreshCached : 0];
                    profimg.layer.cornerRadius=125/2;
                    profimg.clipsToBounds=YES;
                    [mainview addSubview:profimg];
                    
                }
                
                
                else
                {
                    
                    if ([[[detailsarray objectAtIndex:0]objectForKey:@"user_pic_normal"] rangeOfString:@"http"].location == NSNotFound)
                    {
                        
                        profimg=[[UIImageView alloc]initWithFrame:CGRectMake([[UIScreen mainScreen]bounds].size.width/2-62.5, headview.frame.origin.y+headview.frame.size.height+30, 250/2, 250/2)];
                        
                        
                        
                        
                        [profimg sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://www.esolz.co.in/lab1/Web/myEchain/userimage/thumb/%@",[[detailsarray objectAtIndex:0]objectForKey:@"user_pic_normal"]]] placeholderImage:[UIImage imageNamed:@"profile-pic"] options:/* DISABLES CODE */ (0) == 0?SDWebImageRefreshCached : 0];
                        profimg.layer.cornerRadius=125/2;
                        profimg.clipsToBounds=YES;
                        [mainview addSubview:profimg];
                        
                    }
                    else {
                        
                        profimg=[[UIImageView alloc]initWithFrame:CGRectMake([[UIScreen mainScreen]bounds].size.width/2-62.5, headview.frame.origin.y+headview.frame.size.height+30, 250/2, 250/2)];
                        [profimg sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://www.esolz.co.in/lab1/Web/myEchain/userimage/thumb/%@",[[detailsarray objectAtIndex:0]objectForKey:@"user_pic_normal"]]] placeholderImage:[UIImage imageNamed:@"profile-pic"] options:/* DISABLES CODE */ (0) == 0?SDWebImageRefreshCached : 0];
                        profimg.layer.cornerRadius=125/2;
                        profimg.clipsToBounds=YES;
                        [mainview addSubview:profimg];
                    }
                }
                UILabel *namelb=[[UILabel alloc]initWithFrame:CGRectMake(0,  profimg.frame.origin.y+profimg.frame.size.height+5, [[UIScreen mainScreen]bounds].size.width, 50)];
                namelb.text=[[NSString stringWithFormat:@"%@",usernamestr]uppercaseString];
                namelb.textColor=[UIColor whiteColor];
                namelb.font=[UIFont boldSystemFontOfSize:18];
                namelb.textAlignment=NSTextAlignmentCenter;
                [mainview addSubview:namelb];
                
                
                back_bg=[[UIImageView alloc]initWithFrame:CGRectMake(0, 280, [[UIScreen mainScreen]bounds].size.width, 50)];
                back_bg.image=[UIImage imageNamed:@"rowbg_profile" ];
                [mainview addSubview:back_bg];
                
                
                if ([[UIScreen mainScreen]bounds].size.width==320) {
                    info_img=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 30, 30)];
                }
                else
                {
                
                    info_img=[[UIImageView alloc]initWithFrame:CGRectMake(20, 10, 30, 30)];
                
                }
                info_img=[[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 30, 30)];
                info_img.image=[UIImage imageNamed:@"info_prof"];
                [back_bg addSubview:info_img];
                
              
                infolb=[[UILabel alloc]initWithFrame:CGRectMake(50, 0, 80, 50)];
                
                infolb.text=@"INFO";
                infolb.textColor=[UIColor grayColor];
                infolb.font=[UIFont systemFontOfSize:16];
                infolb.textAlignment=NSTextAlignmentLeft;
                [back_bg addSubview:infolb];
                
                UITapGestureRecognizer *info_tap= [[UITapGestureRecognizer alloc] initWithTarget:self
                                                   
                                                                                          action:@selector(info_fn)];
                
                info_tap.numberOfTapsRequired=1;
                infolb.userInteractionEnabled=YES;
                [back_bg setUserInteractionEnabled:YES];
                [infolb addGestureRecognizer:info_tap];
                
                
                
               if ([[UIScreen mainScreen]bounds].size.width==320) {
                hist_img=[[UIImageView alloc]initWithFrame:CGRectMake(95, 10, 25, 30)];
               }
                else
                {
                  hist_img=[[UIImageView alloc]initWithFrame:CGRectMake(110, 10, 25, 30)];
                
                }
                hist_img.image=[UIImage imageNamed:@"history_prof"];
                [back_bg addSubview:hist_img];
                
                
                
                 if ([[UIScreen mainScreen]bounds].size.width==320) {
                histlb=[[UILabel alloc]initWithFrame:CGRectMake(130,  0, 100, 50)];
                 }
                else
                {
                histlb=[[UILabel alloc]initWithFrame:CGRectMake(150,  0, 100, 50)];
                }
                histlb.text=@"HISTORY";
                histlb.textColor=[UIColor grayColor];
                histlb.font=[UIFont systemFontOfSize:16];
                histlb.textAlignment=NSTextAlignmentLeft;
                [back_bg addSubview:histlb];
                
                
                UITapGestureRecognizer *hist_tap= [[UITapGestureRecognizer alloc] initWithTarget:self
                                                   
                                                                                          action:@selector(hist_fn)];
                
                hist_tap.numberOfTapsRequired=1;
                histlb.userInteractionEnabled=YES;
                [back_bg setUserInteractionEnabled:YES];
                [histlb addGestureRecognizer:hist_tap];
                
                
                
                
                
                if ([[UIScreen mainScreen]bounds].size.width==320) {
                reedm_back=[[UIImageView alloc]initWithFrame:CGRectMake([[UIScreen mainScreen]bounds].size.width-115, 0, 200, 50)];
                }
                else
                {
                
                    reedm_back=[[UIImageView alloc]initWithFrame:CGRectMake([[UIScreen mainScreen]bounds].size.width-130, 0, 200, 50)];
                
                }
                reedm_back.image=[UIImage imageNamed:@"redeem-bg-prof"];
                [back_bg addSubview:reedm_back];
                
                 if ([[UIScreen mainScreen]bounds].size.width==320) {
                redg_img=[[UIImageView alloc]initWithFrame:CGRectMake([[UIScreen mainScreen]bounds].size.width-105, 10, 30, 30)];
                 }
                else
                {
                redg_img=[[UIImageView alloc]initWithFrame:CGRectMake([[UIScreen mainScreen]bounds].size.width-120, 10, 30, 30)];
                }
                redg_img.image=[UIImage imageNamed:@"redeem-number-bg"];
                [back_bg addSubview:redg_img];
                
                
                if ([[redm_dict objectForKey:@"redeem_amount"]intValue]>0) {
                    
                    redeem_tap= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(redeem_fn)];
                    
                    redeem_tap.numberOfTapsRequired=1;
                    reedm_back.userInteractionEnabled=YES;
                    [reedm_back addGestureRecognizer:redeem_tap];
                    
                    
                    
                    
                    
                }
                else
                {
                    redg_img.image=[UIImage imageNamed:@""];
                    
                    
                }
                
                
                
                reedm_cnt=[[UILabel alloc]initWithFrame:CGRectMake(0,  5, 30, 20)];
                reedm_cnt.text=[NSString stringWithFormat:@"%@",[redm_dict objectForKey:@"redeem_amount"]];
                reedm_cnt.textColor=[UIColor whiteColor];
                reedm_cnt.font=[UIFont systemFontOfSize:13];
                reedm_cnt.textAlignment=NSTextAlignmentCenter;
                [redg_img addSubview:reedm_cnt];
                
                
                
                
               if ([[UIScreen mainScreen]bounds].size.width==320) {
                redglb=[[UILabel alloc]initWithFrame:CGRectMake([[UIScreen mainScreen]bounds].size.width-70,  0, [[UIScreen mainScreen]bounds].size.width, 50)];
               }
                else
                {
                 redglb=[[UILabel alloc]initWithFrame:CGRectMake([[UIScreen mainScreen]bounds].size.width-80,  0, [[UIScreen mainScreen]bounds].size.width, 50)];
                }
                redglb.text=@"REDEEM";
                redglb.textColor=[UIColor grayColor];
                redglb.font=[UIFont systemFontOfSize:16];
                redglb.textAlignment=NSTextAlignmentLeft;
                [back_bg addSubview:redglb];
                
                
                
                
                
                
                
                incr_btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
                incr_btn.frame=CGRectMake(([[UIScreen mainScreen]bounds].size.width-280)/2,400, 80, 50);
                [incr_btn setBackgroundImage:[UIImage imageNamed:@"plus_prof"] forState:UIControlStateNormal];
                [incr_btn setBackgroundImage:[UIImage imageNamed:@"plus_prof"] forState:UIControlStateSelected];
                [incr_btn setBackgroundImage:[UIImage imageNamed:@"plus_prof"] forState:UIControlStateHighlighted];
                [incr_btn addTarget:self action:@selector(incrfn) forControlEvents:UIControlEventTouchUpInside];
                [mainview addSubview:incr_btn];
                
                
                //    UIView *lineview5 = [[UIView alloc]initWithFrame:CGRectMake(lineview1.frame.origin.x, lineview1.frame.origin.y+180, self.view.frame.size.width/2-20, 1)];
                //    [lineview5 setBackgroundColor:[UIColor whiteColor]];
                //    [mainview addSubview:lineview5];
                
                
                incr_cnt=[[UILabel alloc]initWithFrame:CGRectMake(incr_btn.frame.origin.x+incr_btn.frame.size.width+10, 400, 100, 50)];
                incr_cnt.text=[NSString stringWithFormat:@"%@",[redm_dict objectForKey:@"buy_count"]];
                incr_cnt.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"numberbg_prof"]];
                incr_cnt.textColor=[UIColor grayColor];
                incr_cnt.font=[UIFont systemFontOfSize:25];
                incr_cnt.textAlignment=NSTextAlignmentCenter;
                [mainview addSubview:incr_cnt];
                
                
                
                decr_btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
                decr_btn.frame=CGRectMake(incr_cnt.frame.origin.x+incr_cnt.frame.size.width+10,400, 80, 50);
                [decr_btn setBackgroundImage:[UIImage imageNamed:@"minus_prof"] forState:UIControlStateNormal];
                [decr_btn setBackgroundImage:[UIImage imageNamed:@"minus_prof"] forState:UIControlStateSelected];
                [decr_btn setBackgroundImage:[UIImage imageNamed:@"minus_prof"] forState:UIControlStateHighlighted];
                [decr_btn addTarget:self action:@selector(decrfn) forControlEvents:UIControlEventTouchUpInside];
                [mainview addSubview:decr_btn];
                
                
                UIButton *donebutton = [UIButton buttonWithType:UIButtonTypeCustom];
                [donebutton setFrame:CGRectMake(0, [[UIScreen mainScreen]bounds].size.height-60, [[UIScreen mainScreen]bounds].size.width, 60)];
                [donebutton setBackgroundColor:[UIColor whiteColor]];
                [donebutton setTitle:@"DONE" forState:UIControlStateNormal];
                [donebutton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
                [donebutton addTarget:self action:@selector(donebutton:) forControlEvents:UIControlEventTouchUpInside];
                [mainview addSubview:donebutton];
                
                
                
                
                //    UIView *lineview = [[UIView alloc]initWithFrame:CGRectMake(self.view.frame.origin.x+20, 280, self.view.frame.size.width-40, 1)];
                //    [lineview setBackgroundColor:[UIColor whiteColor]];
                //    [mainview addSubview:lineview];
                //
                //
                //    UIView *lineview1 = [[UIView alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2, 280, 1, 230)];
                //    [lineview1 setBackgroundColor:[UIColor whiteColor]];
                //    [mainview addSubview:lineview1];
                
                //
                //
                //    info_img=[[UIImageView alloc]initWithFrame:CGRectMake(30, namelb.frame.origin.y+namelb.frame.size.height+15, 25, 25)];
                //    info_img.image=[UIImage imageNamed:@"scan_icon"];
                //    [mainview addSubview:info_img];
                //
                //    UILabel *infolb=[[UILabel alloc]initWithFrame:CGRectMake(60,  namelb.frame.origin.y+namelb.frame.size.height+2, [[UIScreen mainScreen]bounds].size.width, 50)];
                //    infolb.text=@"Information";
                //    infolb.textColor=[UIColor blackColor];
                //    infolb.font=[UIFont boldSystemFontOfSize:18];
                //    infolb.textAlignment=NSTextAlignmentLeft;
                //    [mainview addSubview:infolb];
                //
                //    UITapGestureRecognizer *info_tap= [[UITapGestureRecognizer alloc] initWithTarget:self
                //
                //                                                                            action:@selector(info_fn)];
                //
                //    info_tap.numberOfTapsRequired=1;
                //    infolb.userInteractionEnabled=YES;
                //    [infolb addGestureRecognizer:info_tap];
                //
                //
                //    UIView *lineview2 = [[UIView alloc]initWithFrame:CGRectMake(self.view.frame.origin.x+20, namelb.frame.origin.y+namelb.frame.size.height+53, self.view.frame.size.width/2-20, 1)];
                //    [lineview2 setBackgroundColor:[UIColor whiteColor]];
                //    [mainview addSubview:lineview2];
                //
                //
                //    hist_img=[[UIImageView alloc]initWithFrame:CGRectMake(25, info_img.frame.origin.y+info_img.frame.size.height+24, 32, 32)];
                //    hist_img.image=[UIImage imageNamed:@"eich"];
                //    [mainview addSubview:hist_img];
                //
                //    UILabel *histlb=[[UILabel alloc]initWithFrame:CGRectMake(60,  infolb.frame.origin.y+infolb.frame.size.height+2, [[UIScreen mainScreen]bounds].size.width, 50)];
                //    histlb.text=@"History";
                //    histlb.textColor=[UIColor blackColor];
                //    histlb.font=[UIFont boldSystemFontOfSize:18];
                //    histlb.textAlignment=NSTextAlignmentLeft;
                //    [mainview addSubview:histlb];
                //
                //
                //    UIView *lineview3 = [[UIView alloc]initWithFrame:CGRectMake(self.view.frame.origin.x+20, infolb.frame.origin.y+infolb.frame.size.height+53, self.view.frame.size.width/2-20, 1)];
                //    [lineview3 setBackgroundColor:[UIColor whiteColor]];
                //    [mainview addSubview:lineview3];
                //
                //    redg_img=[[UIImageView alloc]initWithFrame:CGRectMake(30, hist_img.frame.origin.y+hist_img.frame.size.height+30, 20, 20)];
                //    redg_img.image=[UIImage imageNamed:@"doortag"];
                //    [mainview addSubview:redg_img];
                //
                //    UILabel *redglb=[[UILabel alloc]initWithFrame:CGRectMake(60,  histlb.frame.origin.y+histlb.frame.size.height+5, [[UIScreen mainScreen]bounds].size.width, 50)];
                //    redglb.text=@"Redeem";
                //    redglb.textColor=[UIColor blackColor];
                //    redglb.font=[UIFont boldSystemFontOfSize:18];
                //    redglb.textAlignment=NSTextAlignmentLeft;
                //    [mainview addSubview:redglb];
                //
                //
                //    UIView *lineview4 = [[UIView alloc]initWithFrame:CGRectMake(self.view.frame.origin.x+20, histlb.frame.origin.y+histlb.frame.size.height+53, self.view.frame.size.width/2-20, 1)];
                //    [lineview4 setBackgroundColor:[UIColor whiteColor]];
                //    [mainview addSubview:lineview4];
                
                
                //==========history
                
                hist_arr=[[NSMutableArray alloc]init];
                
                //  NSString *userid=[[NSUserDefaults standardUserDefaults]objectForKey:@"id"];
                
                //url fetching according to current location
                
                NSString *url2 = [NSString stringWithFormat:@"http://www.esolz.co.in/lab1/Web/myEchain/Iosapp/history_deals.php?user_id=%@&company_id=%@",[[detailsarray objectAtIndex:0]objectForKey:@"id"],[[NSUserDefaults standardUserDefaults]objectForKey:@"company_id"]];
                
                
                //   NSString *url2 = [NSString stringWithFormat:@"http://www.esolz.co.in/lab1/Web/myEchain/Iosapp/cust_form_details.php?user_id=30521&company_id=3959"];
                
                
                NSLog(@"url2===%@",url2);
                
                //fetching data returning from url to the array
                
                
                
                NSURL *requestURL1 = [NSURL URLWithString:url2];
                
                NSData *signeddataURL1 =  [NSData dataWithContentsOfURL:requestURL1 options:NSDataReadingUncached error:&error];
                
                
                
                
                hist_arr = [NSJSONSerialization
                            
                            JSONObjectWithData:signeddataURL1
                            
                            
                            
                            options:kNilOptions
                            
                            error:&error];
                
                
                //    for(NSMutableDictionary *dict_news1 in [result objectForKey:@"list"])
                //
                //    {
                //        if ([[dict_news1 objectForKey:@"required"] isEqualToString:@"1"]) {
                //
                //            [hist_arr addObject:dict_news1];
                //        }
                //
                //
                //
                //    }
                
                NSLog(@"hist_arr===%@",hist_arr);
                
                ////////////////////////////////////////////////////////////
                
                //////////////////////////info
                
                //array initalization for fetching all data
                
                data_arr=[[NSMutableArray alloc]init];
                
                //  NSString *userid=[[NSUserDefaults standardUserDefaults]objectForKey:@"id"];
                
                //url fetching according to current location
                
                url2 = [NSString stringWithFormat:@"http://www.esolz.co.in/lab1/Web/myEchain/Iosapp/cust_form_details.php?user_id=%@&company_id=%@",[[detailsarray objectAtIndex:0]objectForKey:@"id"],[[NSUserDefaults standardUserDefaults]objectForKey:@"company_id"]];
                
                
                //   NSString *url2 = [NSString stringWithFormat:@"http://www.esolz.co.in/lab1/Web/myEchain/Iosapp/cust_form_details.php?user_id=30521&company_id=3959"];
                
                
                NSLog(@"url2===%@",url2);
                
                //fetching data returning from url to the array
                
                
                
                requestURL1 = [NSURL URLWithString:url2];
                
                signeddataURL1 =  [NSData dataWithContentsOfURL:requestURL1 options:NSDataReadingUncached error:&error];
                
                
                
                
                result = [NSJSONSerialization
                          
                          JSONObjectWithData:signeddataURL1
                          
                          
                          
                          options:kNilOptions
                          
                          error:&error];
                
                temp_index=0;
 
                for(NSMutableDictionary *dict_news1 in [result objectForKey:@"list"])
                    
                {
                    
                    if ([[dict_news1 objectForKey:@"required"] isEqualToString:@"1"]) {
                        
                        
                        NSLog(@"-------%@",[dict_news1 objectForKey:@"name"]);
                        if ([[dict_news1 objectForKey:@"name"] isEqualToString:@"address"]) {
                            temp_index1=temp_index;
                           
                        }
                        else
                            temp_index++;
                        
                        [data_arr addObject:dict_news1];
                        
                    }
                    
                    
                    
                }
                
                NSMutableDictionary *temp_dict=[data_arr objectAtIndex:data_arr.count-1];
                NSMutableDictionary *temp_dict2=[data_arr objectAtIndex:temp_index1];
                
                [data_arr replaceObjectAtIndex:temp_index1 withObject:temp_dict];
                [data_arr replaceObjectAtIndex:data_arr.count-1 withObject:temp_dict2];
                
                
                NSLog(@"temp_index isss===%d",temp_index1);
                NSLog(@"data_arr===%@",data_arr);
                
                /////////////////////////////////////////////////////////////////
            }
            
            [spinnern stopAnimating];
        });
    });
    
    
}
-(void)hist_fn
{
    
    
    
    
    
    
    black_bg_hist=[[UIView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen]bounds].size.width, [[UIScreen mainScreen]bounds].size.height)];
    black_bg_hist.backgroundColor=[UIColor blackColor];
    black_bg_hist.alpha=0.5;
    //  [self.view addSubview:black_bg_hist];
    
    
    hist_view=[[UIView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen]bounds].size.width, [[UIScreen mainScreen]bounds].size.height)];
    //hist_view.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"dark_bg"]];
    hist_view.backgroundColor=[UIColor whiteColor];
    
    [self.view addSubview:hist_view];
    
    
    headview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen]bounds].size.width , 70)];
    headview.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"topbar"]];
    
    [hist_view addSubview:headview];
    
    UILabel *head_lb=[[UILabel alloc]initWithFrame:CGRectMake(0,30, [[UIScreen mainScreen]bounds].size.width, 29.5f)];
    head_lb.text=@"History";
    head_lb.textAlignment=NSTextAlignmentCenter;
    head_lb.textColor=[UIColor whiteColor];
    head_lb.font=[UIFont fontWithName:@"HelveticaNeueLTStd-Bd" size:20];
    [headview addSubview:head_lb];
    
    
    UIImageView *back=[[UIImageView alloc]initWithFrame:CGRectMake(15, 32, 23/2, 41/2)];
    back.image=[UIImage imageNamed:@"back_arrow"];
    [headview addSubview:back];
    
    
    UIView *backview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 80, 50)];
    backview.backgroundColor=[UIColor clearColor];
    [headview addSubview:backview];
    
    ////////////////////////////////
    UITapGestureRecognizer *back_tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(back_hist)];
    [backview addGestureRecognizer:back_tap];
    backview.userInteractionEnabled=YES;
    
    
    
    //create table view to show data
    
    hist_tableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 80,[[UIScreen mainScreen]bounds].size.width,[[UIScreen mainScreen]bounds].size.height-100)];
    hist_tableview.delegate = self;
    hist_tableview.dataSource = self;
    hist_tableview.backgroundColor=[UIColor clearColor];
    hist_tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [hist_view addSubview:hist_tableview];
    
    [hist_tableview reloadData];
    
    
    
    
    
    
}
-(void)back_hist
{
    [black_bg_hist removeFromSuperview];
    [hist_view removeFromSuperview];
    
}
-(void)redeem_fn
{
    
    
    
    NSLog(@"in redeem");
    
    NSError *error;
    
    redeem_url =[NSString stringWithFormat:@"http://www.esolz.co.in/lab1/Web/myEchain/Iosapp/update_redeem.php?company_id=%@&user_id=%@",[[NSUserDefaults standardUserDefaults]objectForKey:@"company_id"],[[detailsarray objectAtIndex:0]objectForKey:@"id"]];
    
    
    NSLog(@"eta holo category:  %@",redeem_url);
    
    NSURL *requestURL1 = [NSURL URLWithString:redeem_url];
    
    NSData *signeddataURL1 =  [NSData dataWithContentsOfURL:requestURL1 options:NSDataReadingUncached error:&error];
    
    NSString *ret_str = [[NSString alloc] initWithData:signeddataURL1 encoding:NSUTF8StringEncoding];
    
    
    NSLog(@"dictionary====%@",ret_str);
    
    
    reedm_cnt.text=[NSString stringWithFormat:@"%d",[ret_str intValue]];
    
    if (([ret_str intValue])>0) {
        
        redeem_tap= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(redeem_fn)];
        
        redeem_tap.numberOfTapsRequired=1;
        reedm_back.userInteractionEnabled=YES;
        [reedm_back addGestureRecognizer:redeem_tap];
        
        redg_img.image=[UIImage imageNamed:@"redeem-number-bg"];
        
        
        
    }
    else
        
    {
        
        reedm_back.userInteractionEnabled=NO;
        redg_img.image=[UIImage imageNamed:@""];
        
        
    }
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Redeem added successfully"
                                                    message:@""
                                                   delegate:self
                                          cancelButtonTitle:nil
                                          otherButtonTitles:@"OK", nil];
    
    [alert show];
    
    
    
    
}
-(void)donebutton:(UIButton*)sender
{
    NSError *error;
    
    done_str = [NSString stringWithFormat:@"http://www.esolz.co.in/lab1/Web/myEchain/Iosapp/user_deal_history.php?company_id=%@&user_id=%@&buy_count=%@",[[NSUserDefaults    standardUserDefaults]objectForKey:@"company_id"],[[detailsarray objectAtIndex:0]objectForKey:@"id"],incr_cnt.text];
    
    NSData *done_url = [NSData dataWithContentsOfURL:[NSURL URLWithString:done_str]];
    
    NSLog(@"dataurl is %@",done_str);
    
    redm_dict = [NSJSONSerialization JSONObjectWithData:done_url options:kNilOptions error:&error];
    if (!error)
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Buying details added successfully"
                                                        message:@""
                                                       delegate:self
                                              cancelButtonTitle:nil
                                              otherButtonTitles:@"OK", nil];
        
        [alert show];
        
        incr_cnt.text=[NSString stringWithFormat:@"%@",[redm_dict objectForKey:@"buy_count"]];
        if ([[redm_dict objectForKey:@"redeem_amount"]intValue]>0) {
            
            redeem_tap= [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(redeem_fn)];
            
            redeem_tap.numberOfTapsRequired=1;
            reedm_back.userInteractionEnabled=YES;
            [reedm_back addGestureRecognizer:redeem_tap];
            
            
            
            reedm_cnt.text=[NSString stringWithFormat:@"%@",[redm_dict objectForKey:@"redeem_amount"]];
            redg_img.image=[UIImage imageNamed:@"redeem-number-bg"];
            
            
        }
        else
            
        {
            
            reedm_back.userInteractionEnabled=NO;
            redg_img.image=[UIImage imageNamed:@""];
            
            
            
        }
        
        
        ECBScan_infoViewController *scan=[[ECBScan_infoViewController alloc]init];
        [self.navigationController pushViewController:scan animated:NO];
        
        
    }
    else{
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sorry!!!"
                                                        message:@"Error occured"
                                                       delegate:self
                                              cancelButtonTitle:nil
                                              otherButtonTitles:@"OK", nil];
        
        [alert show];
        
        
        
    }
    
    
    
}
-(void)info_fn
{
    
    
    
    black_bg=[[UIView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen]bounds].size.width, [[UIScreen mainScreen]bounds].size.height)];
    black_bg.backgroundColor=[UIColor blackColor];
    black_bg.alpha=0.5;
    //[self.view addSubview:black_bg];
    
    
    info_view=[[UIImageView alloc]initWithFrame:CGRectMake([[UIScreen mainScreen]bounds].origin.x, [[UIScreen mainScreen]bounds].origin.y, [[UIScreen mainScreen]bounds].size.width , [[UIScreen mainScreen]bounds].size.height)];
    info_view.image=[UIImage imageNamed:@"info_custbg"];
    //mainview.backgroundColor=[UIColor redColor];
    [self.view addSubview:info_view];
    
    
    headview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, info_view.frame.size.width , 70)];
     headview.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"topbar"]];
   // headview.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@""]];
    [info_view addSubview:headview];
    
    
    UILabel *head_lb=[[UILabel alloc]initWithFrame:CGRectMake(0,30, [[UIScreen mainScreen]bounds].size.width, 29.5f)];
    head_lb.text=@"Information";
    head_lb.textAlignment=NSTextAlignmentCenter;
    head_lb.textColor=[UIColor whiteColor];
    head_lb.font=[UIFont fontWithName:@"HelveticaNeueLTStd-Bd" size:20];
    [headview addSubview:head_lb];
    
    
    
    UIImageView *back=[[UIImageView alloc]initWithFrame:CGRectMake(15, 32, 23/2, 41/2)];
    back.image=[UIImage imageNamed:@"back_arrow"];
    [headview addSubview:back];
    
    
    UIView *backview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 80, 60)];
    backview.backgroundColor=[UIColor clearColor];
    [info_view addSubview:backview];
    
    ////////////////////////////////
    UITapGestureRecognizer *back_tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(back_info)];
    [backview addGestureRecognizer:back_tap];
    backview.userInteractionEnabled=YES;
    info_view.userInteractionEnabled=YES;
    
    
    //****************************
    
    if (![[[detailsarray objectAtIndex:0]objectForKey:@"facebookid"]isEqualToString:@""]) {
        
        
        NSLog(@"fb theke");
        if ([[UIScreen mainScreen]bounds].size.height==568) {
            profimg=[[UIImageView alloc]initWithFrame:CGRectMake([[UIScreen mainScreen]bounds].size.width/2-62.5, headview.frame.origin.y+headview.frame.size.height+10, 250/2, 250/2)];
        }
        else
        {
        profimg=[[UIImageView alloc]initWithFrame:CGRectMake([[UIScreen mainScreen]bounds].size.width/2-62.5, headview.frame.origin.y+headview.frame.size.height+30, 250/2, 250/2)];
        }
        
        [profimg sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://graph.facebook.com/%@/picture?type=large",[[detailsarray objectAtIndex:0]objectForKey:@"facebookid"]]] placeholderImage:[UIImage imageNamed:@"profile-pic"] options:/* DISABLES CODE */ (0) == 0?SDWebImageRefreshCached : 0];
        profimg.layer.cornerRadius=125/2;
        profimg.clipsToBounds=YES;
        [info_view addSubview:profimg];
        
    }
    
    
    else
    {
        
        if ([[[detailsarray objectAtIndex:0]objectForKey:@"user_pic_normal"] rangeOfString:@"http"].location == NSNotFound)
        {
             if ([[UIScreen mainScreen]bounds].size.height==568) {
            profimg=[[UIImageView alloc]initWithFrame:CGRectMake([[UIScreen mainScreen]bounds].size.width/2-62.5, headview.frame.origin.y+headview.frame.size.height+10, 250/2, 250/2)];
             }
            else
            {
             profimg=[[UIImageView alloc]initWithFrame:CGRectMake([[UIScreen mainScreen]bounds].size.width/2-62.5, headview.frame.origin.y+headview.frame.size.height+30, 250/2, 250/2)];
            
            }
            
            
            
            [profimg sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://www.esolz.co.in/lab1/Web/myEchain/userimage/thumb/%@",[[detailsarray objectAtIndex:0]objectForKey:@"user_pic_normal"]]] placeholderImage:[UIImage imageNamed:@"profile-pic"] options:/* DISABLES CODE */ (0) == 0?SDWebImageRefreshCached : 0];
            profimg.layer.cornerRadius=125/2;
            profimg.clipsToBounds=YES;
            [info_view addSubview:profimg];
            
        }
        else {
            
            if ([[UIScreen mainScreen]bounds].size.height==568) {
            profimg=[[UIImageView alloc]initWithFrame:CGRectMake([[UIScreen mainScreen]bounds].size.width/2-62.5, headview.frame.origin.y+headview.frame.size.height+10, 250/2, 250/2)];
            }
            else
            {
             profimg=[[UIImageView alloc]initWithFrame:CGRectMake([[UIScreen mainScreen]bounds].size.width/2-62.5, headview.frame.origin.y+headview.frame.size.height+30, 250/2, 250/2)];
            
            }
            [profimg sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://www.esolz.co.in/lab1/Web/myEchain/userimage/thumb/%@",[[detailsarray objectAtIndex:0]objectForKey:@"user_pic_normal"]]] placeholderImage:[UIImage imageNamed:@"profile-pic"] options:/* DISABLES CODE */ (0) == 0?SDWebImageRefreshCached : 0];
            profimg.layer.cornerRadius=125/2;
            profimg.clipsToBounds=YES;
            [info_view addSubview:profimg];
        }
    }
    
    //****************************
    //create table view to show data
    if ([[UIScreen mainScreen]bounds].size.height==568) {
    ListTableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 250,[[UIScreen mainScreen]bounds].size.width,[[UIScreen mainScreen]bounds].size.height-250)];
    }
    else
    {
       ListTableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 300,[[UIScreen mainScreen]bounds].size.width,[[UIScreen mainScreen]bounds].size.height-300)];
    
    }
    ListTableview.delegate = self;
    ListTableview.dataSource = self;
    ListTableview.backgroundColor=[UIColor clearColor];
    ListTableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    [info_view addSubview:ListTableview];
    
    [ListTableview reloadData];
    
    
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

{
    
    if (tableView==ListTableview) {
        
        return [data_arr count];
    }
    
    else
    {
        
        return [hist_arr count];
        
    }
    
    
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 1;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if (tableView==ListTableview) {
        
        if ([[[data_arr objectAtIndex:indexPath.row] objectForKey:@"name"]isEqualToString:@"address"])
        {
            return 70;
        }
        else
        {
        return 50;
        }
        
    }
    
    else
        return 180;
    
    
    
    
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell.backgroundColor =[UIColor clearColor];
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    
    
    if (tableView==ListTableview) {
        
        NSLog(@"listtableview");
        
        if (indexPath.row==0) {
            UILabel *titledata=[[UILabel alloc]initWithFrame:CGRectMake(0,  0, [[UIScreen mainScreen]bounds].size.width, cell.frame.size.height-5)];
            titledata.backgroundColor=[UIColor clearColor];
            titledata.lineBreakMode=NSLineBreakByWordWrapping;
            titledata.numberOfLines=2;
            titledata.textAlignment=NSTextAlignmentCenter;
            titledata.textColor=[UIColor whiteColor];
           // titledata.text=[NSString stringWithFormat:@"%@",[result objectForKey:[NSString stringWithFormat:@"%@",[[data_arr objectAtIndex:indexPath.row]objectForKey:@"name"]]]];
        
            titledata.text=[[NSString stringWithFormat:@"%@",usernamestr]uppercaseString];
            titledata.font=[UIFont fontWithName:@"HelveticaNeueLTStd-Bd" size:20];
            [cell addSubview:titledata];
        }
        else
        {
            
        if ([[[data_arr objectAtIndex:indexPath.row] objectForKey:@"name"]isEqualToString:@"address"])
            {
            
            
                UILabel *TitleLbl=[[UILabel alloc]initWithFrame:CGRectMake(0,  cell.frame.origin.y, [[UIScreen mainScreen]bounds].size.width, cell.frame.size.height-5)];
                TitleLbl.backgroundColor=[UIColor clearColor];
                TitleLbl.lineBreakMode=NSLineBreakByWordWrapping;
                TitleLbl.numberOfLines=2;
                TitleLbl.textAlignment=NSTextAlignmentCenter;
                TitleLbl.textColor=[UIColor whiteColor];
                TitleLbl.text=[NSString stringWithFormat:@"%@ :",[[[data_arr objectAtIndex:indexPath.row] objectForKey:@"name"]capitalizedString]];
                TitleLbl.font=[UIFont fontWithName:@"HelveticaNeueLTStd-Bd" size:16];
                [cell addSubview:TitleLbl];
            
                
                UILabel *titledata=[[UILabel alloc]initWithFrame:CGRectMake(0,  cell.frame.origin.y+25, [[UIScreen mainScreen]bounds].size.width, cell.frame.size.height-5)];
                        titledata.backgroundColor=[UIColor clearColor];
                        titledata.lineBreakMode=NSLineBreakByWordWrapping;
                        titledata.numberOfLines=2;
                        titledata.textAlignment=NSTextAlignmentCenter;
                        titledata.textColor=[UIColor whiteColor];
                        titledata.text=[NSString stringWithFormat:@"%@",[result objectForKey:[NSString stringWithFormat:@"%@",[[data_arr objectAtIndex:indexPath.row]objectForKey:@"name"]]]];
                        titledata.font=[UIFont fontWithName:@"HelveticaNeueLTStd-Lt" size:16];
                        [cell addSubview:titledata];
                
            
            }
            else
            {
     
                
                
           ////////****************
                
                NSDictionary *titleAttributes = @{NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeueLTStd-Bd" size:16],
                                                  NSForegroundColorAttributeName: [UIColor whiteColor]};
                
                NSMutableAttributedString *aAttrString1 = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@ :",[[[data_arr objectAtIndex:indexPath.row] objectForKey:@"name"]capitalizedString]] attributes: titleAttributes];
                
                
                
                NSDictionary *arialDict2 = @{NSFontAttributeName:              [UIFont fontWithName:@"HelveticaNeueLTStd-Lt" size:16],
                                             NSForegroundColorAttributeName:   [UIColor whiteColor],
                                             NSUnderlineStyleAttributeName:  @(NSUnderlineStyleSingle)};
                
                NSMutableAttributedString *aAttrString2;
                aAttrString2= [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@" %@",[result objectForKey:[NSString stringWithFormat:@"%@",[[data_arr objectAtIndex:indexPath.row]objectForKey:@"name"]]]] attributes: arialDict2];
               // [aAttrString2 addAttribute:NSLinkAttributeName value:@"myurl://tapped" range:NSMakeRange(0, 12)];
                
                
                
                
                UILabel *TitleLbl=[[UILabel alloc]initWithFrame:CGRectMake(0,  cell.frame.origin.y, [[UIScreen mainScreen]bounds].size.width, cell.frame.size.height-5)];
                TitleLbl.backgroundColor=[UIColor clearColor];
                TitleLbl.lineBreakMode=NSLineBreakByWordWrapping;
                TitleLbl.numberOfLines=2;
                TitleLbl.textAlignment=NSTextAlignmentCenter;
                TitleLbl.textColor=[UIColor whiteColor];
               // TitleLbl.text=[NSString stringWithFormat:@"%@ : %@",[[[data_arr objectAtIndex:indexPath.row] objectForKey:@"name"]capitalizedString],[result objectForKey:[NSString stringWithFormat:@"%@",[[data_arr objectAtIndex:indexPath.row]objectForKey:@"name"]]]];
                //TitleLbl.font=[UIFont fontWithName:@"HelveticaNeueLTStd-Lt" size:20];
                [aAttrString1 appendAttributedString:aAttrString2];
                
                TitleLbl.attributedText=aAttrString1;
                [cell addSubview:TitleLbl];
                
                
                
                
                
                
                
          ///////*******************
            }
        
        //         UIView *line_vw=[[UIView alloc]initWithFrame:CGRectMake(0, cell.frame.size.height-1, cell.frame.size.width-40, 1)];
        //         line_vw.backgroundColor=[UIColor blackColor];
        //         [cell addSubview:line_vw];
        
        
//        UILabel *titledata=[[UILabel alloc]initWithFrame:CGRectMake(125,  cell.frame.origin.y, 150, cell.frame.size.height-5)];
//        titledata.backgroundColor=[UIColor clearColor];
//        titledata.lineBreakMode=NSLineBreakByWordWrapping;
//        titledata.numberOfLines=2;
//        titledata.textAlignment=NSTextAlignmentLeft;
//        titledata.textColor=[UIColor whiteColor];
//        titledata.text=[NSString stringWithFormat:@": %@",[result objectForKey:[NSString stringWithFormat:@"%@",[[data_arr objectAtIndex:indexPath.row]objectForKey:@"name"]]]];
//        titledata.font=[UIFont fontWithName:@"HelveticaNeueLTStd-Lt" size:15];
//        [cell addSubview:titledata];
        }
        
    }
    else
    {
        NSLog(@"histtableview");
        
        UIView *line_vw=[[UIView alloc]initWithFrame:CGRectMake(0, 0, cell.frame.size.width,170)];
        line_vw.backgroundColor=[UIColor whiteColor];
        [cell addSubview:line_vw];
        
        UIView *line_vw1=[[UIView alloc]initWithFrame:CGRectMake(0, 165, hist_tableview.frame.size.width,1)];
        line_vw1.backgroundColor=[UIColor lightGrayColor];
        [cell addSubview:line_vw1];
        
        
       
        
        UILabel *TitleLbl=[[UILabel alloc]initWithFrame:CGRectMake(20,  cell.frame.origin.y+5, 100, 20)];
        TitleLbl.backgroundColor=[UIColor clearColor];
        TitleLbl.lineBreakMode=NSLineBreakByWordWrapping;
        TitleLbl.numberOfLines=2;
        TitleLbl.textAlignment=NSTextAlignmentLeft;
        TitleLbl.textColor=[UIColor blackColor];
        TitleLbl.text=@"Deal Date";
        TitleLbl.font=[UIFont fontWithName:@"HelveticaNeueLTStd-Bd" size:15];
        [cell addSubview:TitleLbl];
        
        
        NSArray* foo = [[[hist_arr objectAtIndex:indexPath.row]objectForKey:@"issue_date"]componentsSeparatedByString: @" "];
       
        
        UILabel *titledata=[[UILabel alloc]initWithFrame:CGRectMake(20,  cell.frame.origin.y+20, 200, 20)];
        titledata.backgroundColor=[UIColor clearColor];
        titledata.lineBreakMode=NSLineBreakByWordWrapping;
        titledata.numberOfLines=2;
        titledata.textAlignment=NSTextAlignmentLeft;
        titledata.textColor=[UIColor orangeColor];
        titledata.text=[NSString stringWithFormat:@"%@",[foo objectAtIndex: 0]];
        titledata.font=[UIFont fontWithName:@"HelveticaNeueLTStd-Lt" size:13];
        [cell addSubview:titledata];
   
        
        
        UIImageView *clck=[[UIImageView alloc]initWithFrame:CGRectMake([[UIScreen mainScreen]bounds].size.width-100,  cell.frame.origin.y+5, 19, 19)];
        clck.image=[UIImage imageNamed:@"clock"];
        [cell addSubview:clck];
        
    UILabel *timelb=[[UILabel alloc]initWithFrame:CGRectMake([[UIScreen mainScreen]bounds].size.width-80,  cell.frame.origin.y+5, 200, 20)];
        timelb.backgroundColor=[UIColor clearColor];
        timelb.lineBreakMode=NSLineBreakByWordWrapping;
        timelb.numberOfLines=2;
        timelb.textAlignment=NSTextAlignmentLeft;
        timelb.textColor=[UIColor blackColor];
        timelb.text=[NSString stringWithFormat:@"%@",[foo objectAtIndex: 1]];
        timelb.font=[UIFont fontWithName:@"HelveticaNeueLTStd-Bd" size:15];
        [cell addSubview:timelb];

        
        
        
        UILabel *TitleLbl1=[[UILabel alloc]initWithFrame:CGRectMake(20,  cell.frame.origin.y+40, 120, 20)];
        TitleLbl1.backgroundColor=[UIColor clearColor];
        TitleLbl1.lineBreakMode=NSLineBreakByWordWrapping;
        TitleLbl1.numberOfLines=2;
        TitleLbl1.textAlignment=NSTextAlignmentLeft;
        TitleLbl1.textColor=[UIColor blackColor];
        TitleLbl1.text=@"Redeem Got";
        TitleLbl1.font=[UIFont fontWithName:@"HelveticaNeueLTStd-Bd" size:15];
        [cell addSubview:TitleLbl1];
        
        
        UILabel *titledata1=[[UILabel alloc]initWithFrame:CGRectMake(20,  cell.frame.origin.y+60, 100, 20)];
        titledata1.backgroundColor=[UIColor clearColor];
        titledata1.lineBreakMode=NSLineBreakByWordWrapping;
        titledata1.numberOfLines=2;
        titledata1.textAlignment=NSTextAlignmentLeft;
        titledata1.textColor=[UIColor orangeColor];
        titledata1.text=[NSString stringWithFormat:@"%@",[[hist_arr objectAtIndex:indexPath.row]objectForKey:@"redeem_amount"]];
        titledata1.font=[UIFont fontWithName:@"HelveticaNeueLTStd-Lt" size:13];
        [cell addSubview:titledata1];
        
        
        UILabel *TitleLbl2=[[UILabel alloc]initWithFrame:CGRectMake(20,  cell.frame.origin.y+80, 150, 20)];
        TitleLbl2.backgroundColor=[UIColor clearColor];
        TitleLbl2.lineBreakMode=NSLineBreakByWordWrapping;
        TitleLbl2.numberOfLines=2;
        TitleLbl2.textAlignment=NSTextAlignmentLeft;
        TitleLbl2.textColor=[UIColor blackColor];
        TitleLbl2.text=@"Deal Desc.";
        TitleLbl2.font=[UIFont fontWithName:@"HelveticaNeueLTStd-Bd" size:15];
        [cell addSubview:TitleLbl2];
        
        
        UILabel *titledata2=[[UILabel alloc]initWithFrame:CGRectMake(20,  cell.frame.origin.y+100, 200, 20)];
        titledata2.backgroundColor=[UIColor clearColor];
        titledata2.lineBreakMode=NSLineBreakByWordWrapping;
        titledata2.numberOfLines=2;
        titledata2.textAlignment=NSTextAlignmentLeft;
        titledata2.textColor=[UIColor orangeColor];
        titledata2.text=[NSString stringWithFormat:@"%@",[[hist_arr objectAtIndex:indexPath.row]objectForKey:@"deal_desc"]];
        titledata2.font=[UIFont fontWithName:@"HelveticaNeueLTStd-Lt" size:13];
        [cell addSubview:titledata2];
        
        UILabel *TitleLbl3=[[UILabel alloc]initWithFrame:CGRectMake(20,  cell.frame.origin.y+120, 150, 20)];
        TitleLbl3.backgroundColor=[UIColor clearColor];
        TitleLbl3.lineBreakMode=NSLineBreakByWordWrapping;
        TitleLbl3.numberOfLines=2;
        TitleLbl3.textAlignment=NSTextAlignmentLeft;
        TitleLbl3.textColor=[UIColor blackColor];
        TitleLbl3.text=@"Already Bought";
        TitleLbl3.font=[UIFont fontWithName:@"HelveticaNeueLTStd-Bd" size:15];
        [cell addSubview:TitleLbl3];
        
        
        UILabel *titledata3=[[UILabel alloc]initWithFrame:CGRectMake(20,  cell.frame.origin.y+140, 100, 20)];
        titledata3.backgroundColor=[UIColor clearColor];
        titledata3.lineBreakMode=NSLineBreakByWordWrapping;
        titledata3.numberOfLines=2;
        titledata3.textAlignment=NSTextAlignmentLeft;
        titledata3.textColor=[UIColor orangeColor];
        titledata3.text=[NSString stringWithFormat:@"%@",[[hist_arr objectAtIndex:indexPath.row]objectForKey:@"last_redeemed_value"]];
        titledata3.font=[UIFont fontWithName:@"HelveticaNeueLTStd-Lt" size:13];
        [cell addSubview:titledata3];
        
        
        
        
        
        
        
    }
    
    
    
    
    
    cell.backgroundColor=[UIColor clearColor];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}



-(void)back_info
{
    NSLog(@"ffffff");
    [info_view removeFromSuperview];
    [black_bg removeFromSuperview];
    
}

-(void)decrfn
{
    
    if ([redm_dict objectForKey:@"redeem_value"]!=[NSNull null]) {
        
        if ([incr_cnt.text intValue]<=[[redm_dict objectForKey:@"buy_count"] intValue]) {
            
            
            
        }
        else
        {
            int value=[incr_cnt.text intValue]-1;
            
            incr_cnt.text=[NSString stringWithFormat:@"%d",value];
        }
    }
    
}
-(void)incrfn
{
    NSLog(@"increment func");
    
    if ([redm_dict objectForKey:@"redeem_value"]!=[NSNull null]) {
        if ([incr_cnt.text intValue]>=[[redm_dict objectForKey:@"redeem_value"] intValue]) {
            
            NSLog(@"barbe na");
            
        }
        
        else
        {
            int value=[incr_cnt.text intValue]+1;
            
            incr_cnt.text=[NSString stringWithFormat:@"%d",value];
        }
        
    }
    
    
}
-(void)back
{
    
    ECBScan_infoViewController *view = [[ECBScan_infoViewController alloc]init];
    [self.navigationController pushViewController:view animated:NO];
    
}
-(void)logout{
    
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"remember"] == 1)
    {
        NSString *email = [[NSUserDefaults standardUserDefaults] stringForKey:@"email"];
        NSString *password = [[NSUserDefaults standardUserDefaults] stringForKey:@"password"];
        
        
        
        NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
        [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        [[NSUserDefaults standardUserDefaults]setObject:email forKey:@"email"];
        [[NSUserDefaults standardUserDefaults]setObject:password forKey:@"password"];
        //[[NSUserDefaults standardUserDefaults]setObject:lockstr forKey:@"lock_key"];
        [[NSUserDefaults standardUserDefaults]setBool:YES forKey:@"remember"];
        [[NSUserDefaults standardUserDefaults]synchronize];
        
        
    }
    else
    {
        NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
        [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        //         [[NSUserDefaults standardUserDefaults]setObject:lockstr forKey:@"lock_key"];
        //         [[NSUserDefaults standardUserDefaults]synchronize];
    }
    
    
    
    
    
    //    NSString *logout=[[NSBundle mainBundle] bundleIdentifier];
    //    
    //    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:logout];
    //    
    //    [[NSUserDefaults standardUserDefaults] synchronize];
    
    ECBLoginViewController *login = [[ECBLoginViewController alloc]init];
    [self.navigationController pushViewController:login animated:NO];
    
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
