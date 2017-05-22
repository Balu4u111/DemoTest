//
//  AppDelegate.h
//  Login
//
//  Created by S P Balu on 17/03/17.
//  Copyright © 2017 Balu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Google/SignIn.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, GIDSignInDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, retain) NSString *userId;
@property (nonatomic, retain) NSString *idToken;
@property (nonatomic, retain) NSString *fullName;
@property (nonatomic, retain) NSString *familyName;
@property (nonatomic, retain) NSString *givenName;
@property (nonatomic, retain) NSString *email;


@end

