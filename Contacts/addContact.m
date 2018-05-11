//
//  addContact.m
//  Contacts
//
//  Created by Ethan Sharp on 2018-05-10.
//  Copyright © 2018 Scenedoc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "addContact.h"
#import "CustomerObj.h"
#import "ViewController.h"
@import Contacts;
@import ContactsUI;

@interface addContact ()

@end


@implementation addContact
@synthesize firstName;
@synthesize lastName;
@synthesize phone;
@synthesize email;
@synthesize company;
@synthesize tosend;
- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (Contact *) passData: (NSString *)firstName andLast:(NSString *)lastName andNumber:(NSString *)phone andEmail:(NSString *) email andCompany:(NSString *) company{
    Contact * newContact = [[Contact alloc] initWithFirst:firstName andLast:lastName andNumber:phone andEmail: email andCompany:company];
    return newContact;
}

- (IBAction)setFirst:(id)sender {
    firstName = self.firstField.text;
}

- (IBAction)setLast:(id)sender {
    lastName = self.lastField.text;
}

- (IBAction)setPhone:(id)sender {
    phone = self.phoneField.text;
}

- (IBAction)setEmail:(id)sender {
    email = self.emailField.text;
}

- (IBAction)setCompany:(id)sender {
    company = self.companyField.text;
}
@synthesize delegate;

- (IBAction)create:(id)sender {
    CNMutableContact * newContact = [[CNMutableContact alloc] init];
    newContact.givenName=firstName;
    NSLog(@"Contact Name is =%@",newContact.givenName);
    NSLog(@"Contact Name is =%@",firstName);
    newContact.familyName=lastName;
    NSLog(@"Contact Last Name is =%@",newContact.familyName);
    CNLabeledValue *tmpPhone = [CNLabeledValue labeledValueWithLabel: CNLabelPhoneNumberMobile value:[CNPhoneNumber phoneNumberWithStringValue:phone]];
    newContact.phoneNumbers=@[tmpPhone];
    NSLog(@"Contact Number is =%@",tmpPhone);
    //CNLabeledValue *tmpEmail = [CNLabeledValue labeledValueWithLabel: CNLabelEmailiCloud value:[CNPhoneNumber phoneNumberWithStringValue:email]];
    //newContact.emailAddresses=@[tmpEmail];
    //NSLog(@"Contact Email is =%@",newContact.emailAddresses);
    newContact.organizationName=company;
    NSLog(@"Contact Company is =%@",newContact.organizationName);
    tosend=newContact;
    [delegate receivedAddContact:tosend];
    [self dismissViewControllerAnimated:YES completion:nil];
    
}




@end
