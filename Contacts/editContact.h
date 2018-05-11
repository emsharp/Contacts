//
//  editContact.h
//  Contacts
//
//  Created by Ethan Sharp on 2018-05-10.
//  Copyright © 2018 Scenedoc. All rights reserved.
//

#ifndef editContact_h
#define editContact_h
#import <Foundation/Foundation.h>
#import "CustomerObj.h"
@import Contacts;
@import ContactsUI;
#import <UIKit/UIKit.h>
@protocol editContactDelegate <NSObject>
-(void)sendDataToPreviousController:(CNMutableContact *)newguy;
@end

@interface editContact : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *firstField;
- (IBAction)setFirst:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *lastField;
- (IBAction)setLast:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *phoneField;
- (IBAction)setPhone:(id)sender;

@property (weak, nonatomic) IBOutlet UITextField *emailField;
- (IBAction)setEmail:(id)sender;


@property (weak, nonatomic) IBOutlet UITextField *companyField;
- (IBAction)setCompany:(id)sender;

- (IBAction)create:(id)sender;

@property(nonatomic,assign)id delegate;

@property (nonatomic,retain) NSString *firstName;
@property (nonatomic,retain) NSString *lastName;
@property (nonatomic,retain) NSString *phone;
@property (nonatomic,retain) NSString *email;
@property (nonatomic,retain) NSString *company;
@property (nonatomic,retain) CNMutableContact *tosend;
@end
#endif /* editContact_h */
