//
//  CustomerObj.m
//  Contacts
//
//  Created by Ethan Sharp on 2018-05-09.
//  Copyright © 2018 Scenedoc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CustomerObj.h"



@implementation Contact

- (id) initWithFirst:(NSString *)givenName andLast:(NSString *)familyName andNumber:(NSString *)phoneNumber andEmail:(NSString *) email andCompany:(NSString *) company {
    self = [super init];
    if(self){
        self.givenName = givenName;
        self.familyName = familyName;
        self.phoneNumber = phoneNumber;
    }
    return self;
}
+ (instancetype) contactWithName:(NSString *)givenName andLast:(NSString *)familyName andNumber:(NSString *)phoneNumber andEmail:(NSString *)email andCompany:(NSString *)company{
    return [[Contact alloc] initWithFirst:givenName andLast:familyName andNumber:phoneNumber andEmail: email andCompany:company];
    
}

@end
