//
//  ECBLoginViewController.m
//  MyEchainBusiness
//
//  Created by maxcon8 on 07/01/15.
//  Copyright (c) 2015 Esolz. All rights reserved.
//

#import "ECBLoginViewController.h"
#import "ECBScan_infoViewController.h"
#import "ViewController.h"
@interface ECBLoginViewController ()

@end

@implementation ECBLoginViewController

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
    
    
    UILabel *header=[[UILabel alloc]initWithFrame:CGRectMake(0, 20, [[UIScreen mainScreen]bounds].size.width, 35)];
    header.text=@"SIGN IN";
    header.textColor=[UIColor blackColor];
    header.font=[UIFont systemFontOfSize:16];
    header.textAlignment=NSTextAlignmentCenter;
    [upperview addSubview:header];
    
    
    UILabel *donelb=[[UILabel alloc]initWithFrame:CGRectMake([[UIScreen mainScreen]bounds].size.width-105, 20, 150, 35)];
    donelb.textAlignment=NSTextAlignmentCenter;
    donelb.backgroundColor=[UIColor clearColor];
    donelb.text=@"DONE";
    donelb.textColor=[UIColor blueColor];
    [upperview addSubview:donelb];
    
    
    UITapGestureRecognizer *done_tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(done_fn)];
    [donelb addGestureRecognizer:done_tap];
    donelb.userInteractionEnabled=YES;
    
    
    
    UIImageView *back=[[UIImageView alloc]initWithFrame:CGRectMake(15, 32, 23/2, 41/2)];
    back.image=[UIImage imageNamed:@"left-arrow_new"];
    [upperview addSubview:back];
    
    
    UIView *backview=[[UIView alloc]initWithFrame:CGRectMake(0, 15, 60, 45)];
    backview.backgroundColor=[UIColor clearColor];
    [upperview addSubview:backview];
    
    ////////////////////////////////
    UITapGestureRecognizer *back_tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(back)];
    [backview addGestureRecognizer:back_tap];
    backview.userInteractionEnabled=YES;

    
    
    
    
    //inputfield image for username text
    UIImageView *mail_pas=[[UIImageView alloc]initWithFrame:CGRectMake(0,upperview.frame.origin.y+upperview.frame.size.height , [[UIScreen mainScreen]bounds].size.width, 160/2)];
    mail_pas.image=[UIImage imageNamed:@"email-password-bg"];
    mail_pas.userInteractionEnabled=YES;
    [mainview addSubview:mail_pas];
    
    emailtxt=[[UITextField alloc]initWithFrame:CGRectMake(50,0 , 270, 40)];
    emailtxt.backgroundColor=[UIColor clearColor];
    emailtxt.delegate=self;
    emailtxt.text=@"";
    emailtxt.font= [UIFont fontWithName:@"HelveticaNeueLTStd-Lt" size:14];
    UIColor *color = [UIColor grayColor];
    emailtxt.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Enter email address" attributes:@{NSForegroundColorAttributeName: color}];
    emailtxt.textAlignment=NSTextAlignmentLeft;
    emailtxt.delegate=self;
    emailtxt.keyboardType = UIKeyboardTypeEmailAddress;
    [mail_pas addSubview:emailtxt];
    if ([[NSUserDefaults standardUserDefaults]boolForKey:@"remember"]) {
        emailtxt.text=[[NSUserDefaults standardUserDefaults]objectForKey:@"email"];
    }
    
    
    
    //password textfield
    passwrdtxt=[[UITextField alloc]initWithFrame:CGRectMake(50,40 , 270, 40)];
    passwrdtxt.backgroundColor=[UIColor clearColor];
    passwrdtxt.delegate=self;
    passwrdtxt.text=@"";
    passwrdtxt.font= [UIFont fontWithName:@"HelveticaNeueLTStd-Lt" size:14];
    passwrdtxt.placeholder=@"Password";
    UIColor *passcolor = [UIColor grayColor];
    passwrdtxt.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"Enter password" attributes:@{NSForegroundColorAttributeName: passcolor}];
    passwrdtxt.secureTextEntry=YES;
    passwrdtxt.delegate=self;
    passwrdtxt.textAlignment=NSTextAlignmentLeft;
    [mail_pas addSubview:passwrdtxt];
    if ([[NSUserDefaults standardUserDefaults]boolForKey:@"remember"]) {
        passwrdtxt.text=[[NSUserDefaults standardUserDefaults]objectForKey:@"password"];
    }
    
//    UILabel *forgot=[[UILabel alloc]initWithFrame:CGRectMake([[UIScreen mainScreen]bounds].size.width-150,[[UIScreen mainScreen]bounds].size.height/2-126, 150, 25)];
//    forgot.text=@"Forgot password?";
//    forgot.backgroundColor=[UIColor clearColor];
//    forgot.textAlignment=NSTextAlignmentCenter;
//    forgot.font=[UIFont fontWithName:@"HelveticaNeueLTStd-Bd" size:14];
//    forgot.textColor=[UIColor whiteColor];
//    [mainview addSubview:forgot];
//    
//    UITapGestureRecognizer *forgot_tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(forgotpass_fn)];
//    [forgot addGestureRecognizer:forgot_tap];
//    forgot.userInteractionEnabled=YES;
//    
    
    
    chkbox = [[UIButton alloc] initWithFrame:CGRectMake(20,[[UIScreen mainScreen]bounds].size.height/2-123,43/2,41/2)];
    chkbox.backgroundColor=[UIColor clearColor];
    [chkbox setBackgroundImage:[UIImage imageNamed:@"uncheck"]forState:UIControlStateNormal];
    [chkbox setBackgroundImage:[UIImage imageNamed:@"check-box"]
                      forState:UIControlStateSelected];
    [chkbox setBackgroundImage:[UIImage imageNamed:@"check-box"]
                      forState:UIControlStateHighlighted];
    chkbox.adjustsImageWhenHighlighted=YES;
    [chkbox addTarget:self action:@selector(chkbox) forControlEvents:UIControlEventTouchUpInside];
    
    [mainview addSubview:chkbox];
    
    /////////////auto on remember me
    
    
    
    
    termBoxSelected = YES;
    [chkbox setSelected:termBoxSelected];
    //    [[NSUserDefaults standardUserDefaults] setBool:termBoxSelected forKey:@"remember"];
    //    [[NSUserDefaults standardUserDefaults]synchronize];
    
    ////////////////////////////////
    
    
    UIView *termview=[[UIView alloc]initWithFrame:CGRectMake(35, chkbox.frame.origin.y-15, 120, 50)];
    termview.backgroundColor=[UIColor clearColor];
    [mainview addSubview:termview];
    
    
    //terms and conditions textlabel
    UILabel *terms=[[UILabel alloc]initWithFrame:CGRectMake(15,15, 100, 20)];
    terms.backgroundColor=[UIColor clearColor];
    terms.text=@"Remember me";
    terms.textAlignment=NSTextAlignmentLeft;
    terms.font=[UIFont systemFontOfSize:14];
    terms.textColor=[UIColor blackColor];
    [termview addSubview:terms];
    
    UITapGestureRecognizer *sigin_tap=[[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(chkbox)];
    [termview addGestureRecognizer:sigin_tap];
    termview.userInteractionEnabled=YES;
 


    
    imgspin = [[UIImageView alloc] initWithFrame:CGRectMake(110, 180, 100, 100)];
    [imgspin setBackgroundColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:.56]];
    // imgspin.backgroundColor=[UIColor blackColor];
    [imgspin setUserInteractionEnabled:NO];
    imgspin.clipsToBounds=YES;
    imgspin.layer.cornerRadius=20;
    [[imgspin layer] setZPosition:2];
    [mainview addSubview:imgspin];
    [imgspin setHidden:YES];
    
    //start loader animation
    
    spinnern = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    spinnern.hidesWhenStopped = YES;
    spinnern.backgroundColor=[UIColor clearColor];
    
    spinnern.frame=CGRectMake(25,25,50,50);
    [imgspin addSubview: spinnern];
    
    
}
-(void)back
{
    NSLog(@"gugh");
    [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"remember"];
    [[NSUserDefaults standardUserDefaults]synchronize];
    ViewController *view1=[[ViewController alloc]init];
    [self.navigationController pushViewController:view1 animated:NO];
    //[self.navigationController popToRootViewControllerAnimated:NO];

}
-(void)chkbox{
    
    termBoxSelected = !termBoxSelected;
    [chkbox setSelected:termBoxSelected];
        [[NSUserDefaults standardUserDefaults] setBool:termBoxSelected forKey:@"remember"];
        [[NSUserDefaults standardUserDefaults]synchronize];
    NSLog(@"rem===%d",  termBoxSelected);
    
    
}
-(void)done_fn
{
    
    NSString *URLString = [NSString stringWithContentsOfURL:[NSURL URLWithString:@"http://www.google.com"]];
    NSString *result = [[NSString alloc] init];
    result = ( URLString != NULL ) ? @"Yes" : @"No";
    NSLog(@"Internet connection availability : %@", result);
    [imgspin setHidden:NO];
    [spinnern startAnimating];
    //if internet is not available
    if(URLString == NULL)
    {
        alert = [[UIAlertView alloc]initWithTitle:@"" message:@"No Internet Connection" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alert show];
        //[imgspin removeFromSuperview];
        //[spinnern stopAnimating];
        
    }
    
    else
    {
        
        
        NSString *trimmedString = [emailtxt.text stringByTrimmingCharactersInSet:
                                   [NSCharacterSet whitespaceCharacterSet]];
        
        NSString *trimmedString1 = [passwrdtxt.text stringByTrimmingCharactersInSet:
                                    [NSCharacterSet whitespaceCharacterSet]];
        
        //checking all limitations
        if (trimmedString.length <= 0) {
            
            
            alert = [[UIAlertView alloc]initWithTitle:@"" message:@"please enter username" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            alert.tag=0;
            
            
            
            [alert show];
     
            [imgspin removeFromSuperview];
            [spinnern stopAnimating];
            
        }
        
        else if (trimmedString1.length <= 0) {
            
            
            
            
            
            
            alert = [[UIAlertView alloc]initWithTitle:@"" message:@"please enter password" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            alert.tag=1;
            
            
            
            [alert show];

            [imgspin removeFromSuperview];
            [spinnern stopAnimating];
            
        }
        else{
            
            
            
            NSLog(@"loginnnnn");
            
            
            NSError *error;
            
            NSString *urlString = [[NSString alloc] init];
            
            
            loginjson=[[NSDictionary alloc]init];
            
            urlString = [NSString stringWithFormat:@"http://www.esolz.co.in/lab1/Web/myEchain/Iosapp/bussiness_user_login.php?email=%@&password=%@",[emailtxt.text stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding],passwrdtxt.text];
            
            NSData *dataURL = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
            
            NSLog(@"dataurl is %@",urlString);
            
            loginjson = [NSJSONSerialization JSONObjectWithData:dataURL
                                                    options:kNilOptions
                                                      error:&error];
            
            
            
            
            NSLog(@"json is %@ ======> %@",loginjson, (NSString *)[loginjson objectForKey:@"auth"]);
            NSString *userStatus = (NSString *)[loginjson objectForKey:@"auth"];
            
            
            user_det=[loginjson objectForKey:@"userdetails"];
            
            
            
            
            if([[NSString stringWithFormat:@"%@", userStatus] isEqualToString:@"failed"]){
                
                alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Invalid Username / Password" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
                [alert show];
                passwrdtxt.text=@"";
//                passwrdtxt.layer.borderColor=[[UIColor redColor]CGColor];
//                passwrdtxt.layer.borderWidth=1.5f;
                 [imgspin removeFromSuperview];
                  [spinnern stopAnimating];
                
                
                
                UILabel *retrylabl=[[UILabel alloc]initWithFrame:CGRectMake(18,200, 100, 20)];
                retrylabl.backgroundColor=[UIColor clearColor];
                retrylabl.text=@"Kindly retry";
                retrylabl.textAlignment=NSTextAlignmentLeft;
                retrylabl.font=[UIFont fontWithName:@"Helvetica" size:18];
                retrylabl.textColor=[UIColor blackColor];
                [mainview addSubview:retrylabl];
                
                
 
            } else {
                
                //if username or password is valid

                
                
                
//                defaults=[NSUserDefaults standardUserDefaults];
//
//                
//                
//                userDetails = [loginjson objectForKey:@"userdetails"];
//                
//                
//                
//                
//                NSLog(@"userdetails is %@",userDetails);
//                
//                [defaults setObject:[userDetails objectForKey:@"id"]forKey:@"id"];
//                [defaults setObject:[userDetails objectForKey:@"first_name"]forKey:@"first_name"];
//                [defaults setObject:[userDetails objectForKey:@"last_name"]forKey:@"last_name"];
//                [defaults setObject:[userDetails objectForKey:@"email"]forKey:@"email"];
//                [defaults setObject:[userDetails objectForKey:@"password"]forKey:@"password"];
//                [defaults setObject:[userDetails objectForKey:@"last_sync"]forKey:@"last_sync"];
//                [defaults setObject:[userDetails objectForKey:@"card_count"]forKey:@"card_count"];
//                [defaults setObject:[userDetails objectForKey:@"user_pic_thumb"]forKey:@"user_pic_thumb"];
//                [defaults setObject:nil forKey:@"userimage"];
//                
//                [defaults setBool:YES forKey:@"email_log"];
//                [defaults setBool:termBoxSelected forKey:@"remember"];
//                
//                
//                [defaults synchronize];
                
    [[NSUserDefaults standardUserDefaults] setObject:[user_det objectForKey:@"id"]forKey:@"id"];
[[NSUserDefaults standardUserDefaults] setObject:[user_det objectForKey:@"company_id"]forKey:@"company_id"];
             
    [[NSUserDefaults standardUserDefaults] setObject:[user_det objectForKey:@"email"]forKey:@"email"];
            
    [[NSUserDefaults standardUserDefaults] setObject:[user_det objectForKey:@"name"]forKey:@"name"];
    [[NSUserDefaults standardUserDefaults] setObject:passwrdtxt.text forKey:@"password"];
                
                
                [[NSUserDefaults standardUserDefaults]setBool:termBoxSelected forKey:@"remember"];
                [[NSUserDefaults standardUserDefaults]synchronize];
                [imgspin removeFromSuperview];
                [spinnern stopAnimating];
      
                ECBScan_infoViewController *info=[[ECBScan_infoViewController alloc]init];
                [ self.navigationController pushViewController:info animated:YES];
            }
        }
    }

    
    

    
}

-(void)forgotpass_fn{
    
    
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
    
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
