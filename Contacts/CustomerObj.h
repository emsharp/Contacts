//
//  CustomerObj.h
//  Contacts
//
//  Created by Ethan Sharp on 2018-05-09.
//  Copyright © 2018 Scenedoc. All rights reserved.
//

#ifndef CustomerObj_h
#define CustomerObj_h
@interface Contact : NSObject
@property  (nonatomic, strong) NSString *givenName;
@property  (nonatomic, strong) NSString *familyName;
@property  (nonatomic, strong) NSString *phoneNumber;
@property  (nonatomic, strong) NSString *email;
@property  (nonatomic, strong) NSString *company;
- (id) initWithFirst:(NSString *)givenName andLast:(NSString *)familyName andNumber:(NSString *)phoneNumber andEmail:(NSString *) email andCompany:(NSString *) company;
+ (instancetype*)contactWithName:(NSString *)givenName andLast:(NSString *)familyName andNumber:(NSString *)phoneNumber andEmail:(NSString *)email andCompany:(NSString *)company;
#endif /* CustomerObj_h */
@end
