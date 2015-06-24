//
//  ViewController.m
//  MyEchainBusiness
//
//  Created by maxcon8 on 07/01/15.
//  Copyright (c) 2015 Esolz. All rights reserved.
//

#import "ViewController.h"
#import "ECBLoginViewController.h"
#import "ECBScan_infoViewController.h"
#import "ECBCust_infoViewController.h"
@interface ViewController ()<UIWebViewDelegate>
{
    UIView *WebBackView;
    UIWebView *WebViewBusiness;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"remember"] == 1)
    {
        ECBScan_infoViewController *login = [[ECBScan_infoViewController alloc]init];
        [self.navigationController pushViewController:login animated:NO];
        
//        ECBCust_infoViewController *login = [[ECBCust_infoViewController alloc]init];
//        [self.navigationController pushViewController:login animated:NO];
        
    }
    else{
        
    mainview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen]bounds].size.width, [[UIScreen mainScreen]bounds].size.height )];
    mainview.backgroundColor=[UIColor clearColor];
    [self.view addSubview:mainview];
    
   
    UIImageView *backimage = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen]bounds].size.width, [[UIScreen mainScreen]bounds].size.height )];
    [backimage setImage:[UIImage imageNamed:@"1-splashbg"]];
    [mainview addSubview:backimage];
        
        if ([[UIScreen mainScreen]bounds].size.width == 320)
        {
            UILabel *HeaderLbl = [[UILabel alloc]initWithFrame:CGRectMake(15, 70, self.view.frame.size.width-30, 80)];
            [HeaderLbl setBackgroundColor:[UIColor clearColor]];
            [HeaderLbl setText:@"Welcome to the MyEchain Business Loyalty App"];
            [HeaderLbl setTextAlignment:NSTextAlignmentCenter];
            [HeaderLbl setTextColor:[UIColor whiteColor]];
            [HeaderLbl setNumberOfLines:2];
            [HeaderLbl setFont:[UIFont fontWithName:@"Helvetica Bold" size:22]];
            [mainview addSubview:HeaderLbl];
            
            UIImageView *LogoImage = [[UIImageView alloc]initWithFrame:CGRectMake(64.75f, 155, 381/2, 125/2)];
            [LogoImage setImage:[UIImage imageNamed:@"Myechainbusinesslogo"]];
            [mainview addSubview:LogoImage];
            
            
            NSDictionary *titleAttributes = @{NSFontAttributeName: [UIFont fontWithName:@"Helvetica Bold" size:16], NSForegroundColorAttributeName: [UIColor whiteColor]};
            NSMutableAttributedString *aAttrString1 = [[NSMutableAttributedString alloc] initWithString:@"If you have an account with MyEchain Business, go ahead and click Sign In.\n If not, please visit our website to learn more at " attributes: titleAttributes];
            
            NSDictionary *arialDict2 = @{NSFontAttributeName:[UIFont fontWithName:@"Helvetica Light" size:14], NSForegroundColorAttributeName:[UIColor colorWithRed:(15/255.0f) green:(123/255.0f) blue:(255/255.0f) alpha:1], NSUnderlineStyleAttributeName:  @(NSUnderlineStyleSingle)};
            
            NSMutableAttributedString *aAttrString2;
            aAttrString2= [[NSMutableAttributedString alloc] initWithString:@"business.myechain.com" attributes: arialDict2];
            [aAttrString1 appendAttributedString:aAttrString2];
            
            UILabel *MiddleLbl = [[UILabel alloc]initWithFrame:CGRectMake(30, 220, self.view.frame.size.width-60, 120)];
            [MiddleLbl setBackgroundColor:[UIColor clearColor]];
            [MiddleLbl setAttributedText:aAttrString1];
            [MiddleLbl setTextAlignment:NSTextAlignmentCenter];
            [MiddleLbl setNumberOfLines:5];
            [mainview addSubview:MiddleLbl];
            
            
            UIButton *WebButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [WebButton setFrame:CGRectMake(90, 295, 180, 30)];
            [WebButton setBackgroundColor:[UIColor clearColor]];
            [WebButton addTarget:self action:@selector(Webbutton:) forControlEvents:UIControlEventTouchUpInside];
            [mainview addSubview:WebButton];
            
            
            login_btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
            login_btn.frame=CGRectMake(self.view.frame.origin.x+25,self.view.frame.origin.y+470,self.view.frame.size.width-50,50);
            [login_btn setBackgroundImage:[UIImage imageNamed:@"loginbutton"] forState:UIControlStateNormal];
            [login_btn setBackgroundImage:[UIImage imageNamed:@"loginbutton"] forState:UIControlStateSelected];
            [login_btn setBackgroundImage:[UIImage imageNamed:@"loginbutton"] forState:UIControlStateHighlighted];
            [login_btn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
            [mainview addSubview:login_btn];
        }
        else
        {
            
            UILabel *HeaderLbl = [[UILabel alloc]initWithFrame:CGRectMake(15, 90, self.view.frame.size.width-30, 80)];
            [HeaderLbl setBackgroundColor:[UIColor clearColor]];
            [HeaderLbl setText:@"Welcome to the MyEchain Business Loyalty App"];
            [HeaderLbl setTextAlignment:NSTextAlignmentCenter];
            [HeaderLbl setTextColor:[UIColor whiteColor]];
            [HeaderLbl setNumberOfLines:2];
            [HeaderLbl setFont:[UIFont fontWithName:@"Helvetica Bold" size:25]];
            [mainview addSubview:HeaderLbl];
            
            
            UIImageView *LogoImage = [[UIImageView alloc]initWithFrame:CGRectMake(92.25f, 210, 381/2, 125/2)];
            [LogoImage setImage:[UIImage imageNamed:@"Myechainbusinesslogo"]];
            [mainview addSubview:LogoImage];
            
            
            NSDictionary *titleAttributes = @{NSFontAttributeName: [UIFont fontWithName:@"Helvetica Bold" size:18], NSForegroundColorAttributeName: [UIColor whiteColor]};
             NSMutableAttributedString *aAttrString1 = [[NSMutableAttributedString alloc] initWithString:@"If you have an account with MyEchain Business, go ahead and click Sign In.\n If not, please visit our website to learn more at " attributes: titleAttributes];
            
            NSDictionary *arialDict2 = @{NSFontAttributeName:[UIFont fontWithName:@"Helvetica Light" size:17], NSForegroundColorAttributeName:[UIColor colorWithRed:(15/255.0f) green:(123/255.0f) blue:(255/255.0f) alpha:1], NSUnderlineStyleAttributeName:  @(NSUnderlineStyleSingle)};
            
            NSMutableAttributedString *aAttrString2;
            aAttrString2= [[NSMutableAttributedString alloc] initWithString:@"business.myechain.com" attributes: arialDict2];
            [aAttrString1 appendAttributedString:aAttrString2];
            
            UILabel *MiddleLbl = [[UILabel alloc]initWithFrame:CGRectMake(30, 290, self.view.frame.size.width-60, 140)];
            [MiddleLbl setBackgroundColor:[UIColor clearColor]];
            [MiddleLbl setAttributedText:aAttrString1];
            [MiddleLbl setTextAlignment:NSTextAlignmentCenter];
            [MiddleLbl setNumberOfLines:5];
            [mainview addSubview:MiddleLbl];
            
            UIButton *WebButton = [UIButton buttonWithType:UIButtonTypeCustom];
            [WebButton setFrame:CGRectMake(120, 385, 220, 30)];
            [WebButton setBackgroundColor:[UIColor clearColor]];
            [WebButton addTarget:self action:@selector(Webbutton:) forControlEvents:UIControlEventTouchUpInside];
            [mainview addSubview:WebButton];
            
            login_btn=[UIButton buttonWithType:UIButtonTypeRoundedRect];
            login_btn.frame=CGRectMake(self.view.frame.origin.x+25,self.view.frame.origin.y+530,self.view.frame.size.width-50,50);
            [login_btn setBackgroundImage:[UIImage imageNamed:@"loginbutton"] forState:UIControlStateNormal];
            [login_btn setBackgroundImage:[UIImage imageNamed:@"loginbutton"] forState:UIControlStateSelected];
            [login_btn setBackgroundImage:[UIImage imageNamed:@"loginbutton"] forState:UIControlStateHighlighted];
            [login_btn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
            [mainview addSubview:login_btn];
    
        }
    }
}

-(void)Webbutton:(UIButton *)sender
{
    NSURL *url = [NSURL URLWithString:@"http://business.myechain.com/"];
    [[UIApplication sharedApplication] openURL:url];

}

-(void)login
{

        ECBLoginViewController *login=[[ECBLoginViewController alloc]init];
        [self.navigationController pushViewController:login animated:YES];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
