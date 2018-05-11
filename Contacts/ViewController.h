//
//  ViewController.h
//  Contacts
//
//  Created by Ethan Sharp on 2018-05-08.
//  Copyright © 2018 Scenedoc. All rights reserved.
//

#import <UIKit/UIKit.h>
@import Contacts;
@import ContactsUI;
@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>//,addContactDelegate>
{
    
    IBOutlet UITableView *myTable;
    NSMutableArray *myArray;
    
}
- (IBAction)addContact:(id)sender;
- (void)receivedAddContact:(CNMutableContact *)addedContact;

@end

