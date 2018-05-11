//
//  editContact.m
//  Contacts
//
//  Created by Ethan Sharp on 2018-05-10.
//  Copyright © 2018 Scenedoc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "editContact.h"
#import "CustomerObj.h"
@interface editContact ()

@end

@implementation editContact
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

@end
