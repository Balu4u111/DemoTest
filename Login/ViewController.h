//
//  ViewController.h
//  Login
//
//  Created by S P Balu on 17/03/17.
//  Copyright © 2017 Balu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Google/SignIn.h>
#import "AppDelegate.h"

@interface ViewController : UIViewController<GIDSignInUIDelegate>
{
    GIDSignInButton *button;
    
    UIButton *signOut;
    UILabel *lbl;
    
    NSString *userId;
}


@end

