//
//  ECBScan_infoViewController.m
//  MyEchainBusiness
//
//  Created by maxcon8 on 07/01/15.
//  Copyright (c) 2015 Esolz. All rights reserved.
//

#import "ECBScan_infoViewController.h"
#import "ECBCust_infoViewController.h"
#import "ECBLoginViewController.h"

@interface ECBScan_infoViewController ()

@end

@implementation ECBScan_infoViewController

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
    
    
    UIView *upperview=[[UIView alloc]initWithFrame:CGRectMake(0, 0,  [[UIScreen mainScreen]bounds].size.width, 128/2)];
    upperview.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"topbar"]];
    //upperview.backgroundColor=[UIColor redColor];
    [mainview addSubview:upperview];
    
 /*   UILabel *header=[[UILabel alloc]initWithFrame:CGRectMake(0, 10, [[UIScreen mainScreen]bounds].size.width, 50)];
    header.text=@"SCANNING INFORMATION";
    header.textColor=[UIColor blackColor];
    header.font=[UIFont systemFontOfSize:16];
    header.textAlignment=NSTextAlignmentCenter;
    [upperview addSubview:header];
  
  */
    
    //logo image of header...
    
    UIImageView *logoimage = [[UIImageView alloc]initWithFrame:CGRectMake(([[UIScreen mainScreen]bounds].size.width/2)-50, 25, 183/2, 30)];
    [logoimage setImage:[UIImage imageNamed:@"Myechainbusinesslogo_logo"]];
    [upperview addSubview:logoimage];
    
    
    UIButton *logout = [UIButton buttonWithType:UIButtonTypeCustom];
    [logout setFrame:CGRectMake([[UIScreen mainScreen]bounds].size.width-40, 25, 25, 25)];
    [logout setBackgroundImage:[UIImage imageNamed:@"logoutthree"] forState:UIControlStateNormal];
    [logout addTarget:self action:@selector(logout) forControlEvents:UIControlEventTouchUpInside];
    [upperview addSubview:logout];
    
    
    UIView *log_view=[[UIView alloc]initWithFrame:CGRectMake([[UIScreen mainScreen]bounds].size.width-80, 10, 80, 60)];
    log_view.backgroundColor=[UIColor clearColor];
    [upperview addSubview:log_view];
    
    
UITapGestureRecognizer *log_tap= [[UITapGestureRecognizer alloc] initWithTarget:self
                                        
                                                                               action:@selector(logout)];
    
    log_tap.numberOfTapsRequired=1;
    
    [log_view addGestureRecognizer:log_tap];
    
    
//    UIImageView *back=[[UIImageView alloc]initWithFrame:CGRectMake(15, 32, 23/2, 41/2)];
//    back.image=[UIImage imageNamed:@"back_arrow"];
//    [upperview addSubview:back];
//    
//    
//    UIView *backview=[[UIView alloc]initWithFrame:CGRectMake(0, 15, 60, 45)];
//    backview.backgroundColor=[UIColor clearColor];
//    [upperview addSubview:backview];
//    
//    ////////////////////////////////
//    UITapGestureRecognizer *back_tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(back_scan)];
//    [backview addGestureRecognizer:back_tap];
//    backview.userInteractionEnabled=YES;

    
    
    
    
    
    if ([[UIScreen mainScreen]bounds].size.height==568) {
    scanbar=[[UIImageView alloc]initWithFrame:CGRectMake(([[UIScreen mainScreen]bounds].size.width/2)-50, 80, 100,100)];
    }
    else
    {
    scanbar=[[UIImageView alloc]initWithFrame:CGRectMake(([[UIScreen mainScreen]bounds].size.width/2)-50, 105, 100,100)];
    }
    scanbar.image=[UIImage imageNamed:@"barcodevejal"];
    scanbar.userInteractionEnabled=YES;
    [mainview addSubview:scanbar];
    
    if ([[UIScreen mainScreen]bounds].size.height==568) {
         white_line=[[UIView alloc]initWithFrame:CGRectMake(5, scanbar.frame.origin.y+scanbar.frame.size.height+20, [[UIScreen mainScreen]bounds].size.width-10, 2)];
    }
    else
    {
    white_line=[[UIView alloc]initWithFrame:CGRectMake(5, scanbar.frame.origin.y+scanbar.frame.size.height+40, [[UIScreen mainScreen]bounds].size.width-10, 2)];
    
    }
    
    white_line.backgroundColor=[UIColor whiteColor];
    [mainview addSubview:white_line];
    
    UIImageView *bullet1=[[UIImageView alloc]initWithFrame:CGRectMake(50-30, white_line.frame.origin.y+white_line.frame.size.height+33, 30,30)];
    bullet1.image=[UIImage imageNamed:@"arrowscan"];
    bullet1.userInteractionEnabled=YES;
    [mainview addSubview:bullet1];
    
    UILabel *bul1=[[UILabel alloc]initWithFrame:CGRectMake(80-20,white_line.frame.origin.y+white_line.frame.size.height+20, 250, 80)];
    bul1.numberOfLines=3;
    bul1.text=@"Scan the BarCode or QrCode. Place the code image at the centre frame of the scanner.";
    bul1.backgroundColor=[UIColor clearColor];
    bul1.textAlignment=NSTextAlignmentLeft;
    bul1.font=[UIFont systemFontOfSize:16];
    bul1.textColor=[UIColor whiteColor];
    [mainview addSubview:bul1];
    
    
    UIImageView *bullet2=[[UIImageView alloc]initWithFrame:CGRectMake(50-30, bul1.frame.origin.y+bul1.frame.size.height+20, 30,30)];
    bullet2.image=[UIImage imageNamed:@"arrowscan"];
    bullet2.userInteractionEnabled=YES;
    [mainview addSubview:bullet2];
    
    UILabel *bul2=[[UILabel alloc]initWithFrame:CGRectMake(80-20,bullet2.frame.origin.y-20, 250, 80)];
    bul2.numberOfLines=2;
    bul2.text=@"Try to keep your hand stady while scanning.";
    bul2.backgroundColor=[UIColor clearColor];
    bul2.textAlignment=NSTextAlignmentLeft;
    bul2.font=[UIFont systemFontOfSize:16];
    bul2.textColor=[UIColor whiteColor];
    [mainview addSubview:bul2];

    UIImageView *bullet3=[[UIImageView alloc]initWithFrame:CGRectMake(50-30, bul2.frame.origin.y+bul2.frame.size.height-5, 30,30)];
    bullet3.image=[UIImage imageNamed:@"arrowscan"];
    bullet3.userInteractionEnabled=YES;
    [mainview addSubview:bullet3];
    
    UILabel *bul3=[[UILabel alloc]initWithFrame:CGRectMake(80-20,bullet3.frame.origin.y-25, 250, 80)];
    bul3.numberOfLines=2;
    bul3.text=@"Press the below button to start.";
    bul3.backgroundColor=[UIColor clearColor];
    bul3.textAlignment=NSTextAlignmentLeft;
    bul3.font=[UIFont systemFontOfSize:16];
    bul3.textColor=[UIColor whiteColor];
    [mainview addSubview:bul3];
    
    
    UIView *white_line2=[[UIView alloc]initWithFrame:CGRectMake(5, bul3.frame.origin.y+bul3.frame.size.height+5, [[UIScreen mainScreen]bounds].size.width-10, 2)];
    white_line2.backgroundColor=[UIColor whiteColor];
    [mainview addSubview:white_line2];
    
    if ([[UIScreen mainScreen]bounds].size.width == 320)
    {
        
        UIImageView *scan_btn=[[UIImageView alloc]initWithFrame:CGRectMake(115, [[UIScreen mainScreen]bounds].size.height-120, 182/2,190/2)];
        scan_btn.image=[UIImage imageNamed:@"camera_new"];
        scan_btn.userInteractionEnabled=YES;
        [mainview addSubview:scan_btn];
        
        UITapGestureRecognizer *camera_tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(camera_fn)];
        [scan_btn addGestureRecognizer:camera_tap];
        scan_btn.userInteractionEnabled=YES;
    }
    else
    {
    UIImageView *scan_btn=[[UIImageView alloc]initWithFrame:CGRectMake(143, [[UIScreen mainScreen]bounds].size.height-145, 182/2,190/2)];
    scan_btn.image=[UIImage imageNamed:@"camera_new"];
    scan_btn.userInteractionEnabled=YES;
    [mainview addSubview:scan_btn];
    
    UITapGestureRecognizer *camera_tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(camera_fn)];
    [scan_btn addGestureRecognizer:camera_tap];
    mainview.userInteractionEnabled=YES;
    
    }
}
-(void)back_scan
{

    ECBScan_infoViewController *info=[[ECBScan_infoViewController alloc]init];
    [self.navigationController pushViewController:info animated:NO];
    
  //  [self.navigationController popViewControllerAnimated:NO];

}
-(void)camera_fn
{
   
    
    scannerView=[[RMScannerView alloc]initWithFrame:CGRectMake(0, 60, [[UIScreen mainScreen]bounds].size.width, [[UIScreen mainScreen]bounds].size.height-120)];
    scannerView.delegate=self;
    [self.view addSubview:scannerView];
    
    //////////////////////////////////////////
    
    [scannerView setVerboseLogging:YES];
    
    [scannerView setAnimateScanner:YES];
    
    [scannerView setDisplayCodeOutline:YES];
    
    [scannerView startCaptureSession];
    
cancel_lb=[[UILabel alloc]initWithFrame:CGRectMake(0, [[UIScreen mainScreen]bounds].size.height-60, [[UIScreen mainScreen]bounds].size.width, 60)];
    cancel_lb.backgroundColor=[UIColor whiteColor];
    cancel_lb.text=@"    Cancel";
    [self.view addSubview:cancel_lb];
    
    UITapGestureRecognizer *camera_tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(cancel_fn)];
   [cancel_lb addGestureRecognizer:camera_tap];
    cancel_lb.userInteractionEnabled=YES;

    
 
  //  ECBCust_infoViewController *custinfo=[[ECBCust_infoViewController alloc]init];
  //  custinfo.emailstr = @"nirag@esolzmail.com";
   // custinfo.usernamestr = @"norah goru";
   // [self.navigationController pushViewController:custinfo animated:YES];
   
    
}
-(void)cancel_fn
{
[scannerView stopScanSession];
    [scannerView removeFromSuperview];
    [cancel_lb removeFromSuperview];

}
-(BOOL) NSStringIsValidEmail:(NSString *)checkString
{
    BOOL stricterFilter = YES;
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".+@([A-Za-z0-9]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:checkString];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {

  if ([[alertView buttonTitleAtIndex:buttonIndex] isEqualToString:@"Okay"])
  {
  
//       if (emailstring!=nil)
//       {
//           
//           
//           if (![ self NSStringIsValidEmail:emailstring])
//           {
//               
//               UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"Scanned email is not valid" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
//               alert.tag=1;
//               
//               [alert show];
//               
//              [scannerView startScanSession];
//               
//           }
//
//         else
//         {
//        ECBCust_infoViewController *custinfo=[[ECBCust_infoViewController alloc]init];
//        custinfo.emailstr = emailstring;
//        custinfo.usernamestr = usernamestring;
//        [self.navigationController pushViewController:custinfo animated:YES];
//         }
//       }
//      else
//      {
//          UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sorry!"
//                                                          message:@"This code does not contain customer details"
//                                                         delegate:self
//                                                cancelButtonTitle:nil
//                                                otherButtonTitles:@"OK", nil];
//          [alert show];
//      [scannerView startScanSession];
//      
//      }
//      
      
      
  }
    if ([[alertView buttonTitleAtIndex:buttonIndex] isEqualToString:@"Re-Scan"])
    {
        [scannerView startScanSession];
    }
    
    if ([[alertView buttonTitleAtIndex:buttonIndex] isEqualToString:@"OK"])
    {
        
        [scannerView removeFromSuperview];
        
        scannerView=[[RMScannerView alloc]initWithFrame:CGRectMake(0, 60, [[UIScreen mainScreen]bounds].size.width, [[UIScreen mainScreen]bounds].size.height-120)];
        scannerView.delegate=self;
        [self.view addSubview:scannerView];
        
        //////////////////////////////////////////
        
        [scannerView setVerboseLogging:YES];
        
        [scannerView setAnimateScanner:YES];
        
        [scannerView setDisplayCodeOutline:YES];
        
        [scannerView startCaptureSession];

        [scannerView startScanSession];
    }
    
}
- (void)didScanCode:(NSString *)scannedCode onCodeType:(NSString *)codeType {
    
//                      UIAlertView *alert = [[UIAlertView alloc] initWithTitle:[NSString stringWithFormat:@"Scanned %@", [scannerView humanReadableCodeTypeForCode:codeType]] message:scannedCode delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:@"Re-Scan", nil];
//                    [alert show];
//        NSLog(@"code is===%@",[NSString stringWithFormat:@"%@",scannedCode]);
    
    
    
    if ([scannedCode containsString:@"##"])
    {
        
        NSLog(@"---- %@", scannedCode);
        
    NSArray *array = [scannedCode componentsSeparatedByString:@"##"];
    
    emailstring = [array objectAtIndex:1];
    usernamestring = [array objectAtIndex:0];
    }
    
    if (emailstring!=nil)
    {
        
        
        if (![ self NSStringIsValidEmail:emailstring])
        {
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"" message:@"Scanned email is not valid" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            alert.tag=1;
            
            [alert show];
            
            [scannerView startScanSession];
            
        }
        
        else
        {
            ECBCust_infoViewController *custinfo=[[ECBCust_infoViewController alloc]init];
            custinfo.emailstr = emailstring;
            custinfo.usernamestr = usernamestring;
            [self.navigationController pushViewController:custinfo animated:YES];
        }
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Sorry!"
                                                        message:@"This code does not contain customer details"
                                                       delegate:self
                                              cancelButtonTitle:nil
                                              otherButtonTitles:@"OK", nil];
        [alert show];
        [scannerView startScanSession];
        
    }
    

    
    
        //******
    
    
    
    

}

- (void)errorGeneratingCaptureSession:(NSError *)error {
        [scannerView stopCaptureSession];
    
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Unsupported Device" message:@"This device does not have a camera. Run this app on an iOS device that has a camera." delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
        [alert show];
        
    
    
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
