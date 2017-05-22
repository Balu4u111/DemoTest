//
//  ViewController.m
//  Login
//
//  Created by S P Balu on 17/03/17.
//  Copyright © 2017 Balu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self checkLogin];
    
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)viewWillAppear:(BOOL)animated
{
    
}

-(void)checkLogin
{
    [GIDSignIn sharedInstance].uiDelegate = self;
    
    AppDelegate *appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    
    if([GIDSignIn sharedInstance].hasAuthInKeychain)
    {
        NSLog(@"Loged in");
        NSLog(@"%@",appDelegate.email);
        if (signOut)
        {
            signOut.hidden = NO;
        }
        else
        {
            signOut  = [UIButton buttonWithType:UIButtonTypeCustom];
            signOut.frame = CGRectMake(self.view.frame.size.width/2 - 100, self.view.frame.size.height/4, self.view.frame.size.width/2, 30);
            [signOut setTitle:@"Sign out" forState:UIControlStateNormal];
            [signOut setTitleColor:[UIColor blackColor] forState:UIControlStateNormal ];
            [signOut addTarget:self action:@selector(didTapSignOut:) forControlEvents:UIControlEventTouchUpInside];
            [self.view addSubview:signOut];
            
            lbl = [[UILabel alloc]initWithFrame: CGRectMake(10, self.view.frame.size.height/2+40, self.view.frame.size.width -10, 30)];
            lbl.text = [NSString stringWithFormat:@"%@",[[NSUserDefaults standardUserDefaults] objectForKey:@"GoogleAccEmailID"]];
            [self.view addSubview:lbl];
            
            button.hidden= YES;
        }
        
        
        
       
    }
    else
    {
        NSLog(@"Need to login");
        if (button)
        {
            button.hidden = NO;
        }
        else
        {
            button  = [[GIDSignInButton alloc]initWithFrame:CGRectMake(self.view.frame.size.width/2 - 100, self.view.frame.size.height/3, self.view.frame.size.width/2, 30)];
            [self.view addSubview:button];
            
            signOut.hidden = YES;
            lbl.hidden= YES;
        }
        
    }
    
    
    
}

// Stop the UIActivityIndicatorView animation that was started when the user
// pressed the Sign In button
- (void)signInWillDispatch:(GIDSignIn *)signIn error:(NSError *)error
{
    
    NSLog(@"Error %@", error);
}

// Present a view that prompts the user to sign in with Google
- (void)signIn:(GIDSignIn *)signIn
presentViewController:(UIViewController *)viewController {
    [self presentViewController:viewController animated:YES completion:nil];
}

// Dismiss the "Sign in with Google" view
- (void)signIn:(GIDSignIn *)signIn dismissViewController:(UIViewController *)viewController
{
    [self dismissViewControllerAnimated:YES completion:nil];
    
    NSLog(@"Logged in succesfully");
    button.hidden= YES;
    signOut.hidden = NO;
    lbl.hidden= NO;
}

-(void)didTapSignOut:(id)sender
{
    [[GIDSignIn sharedInstance] signOut];
    
    NSLog(@"Signed out cliked");
    
    [self checkLogin];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
