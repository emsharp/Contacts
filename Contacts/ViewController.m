//
//  ViewController.m
//  Contacts
//
//  Created by Ethan Sharp on 2018-05-08.
//  Copyright © 2018 Scenedoc. All rights reserved.
//

#import "ViewController.h"
#import "CustomerObj.h"
#import "addContact.h"
#define AS(A,B)    [(A) stringByAppendingString:(B)]
@import Contacts;
@import ContactsUI;

@interface ViewController ()

@end

@implementation ViewController
NSString* Alphabet = @"ABCDEFGHIJKLMNOPQRSTUVWXYZ#";
bool firstload = true;
- (void)viewDidLoad {
    [super viewDidLoad];
    if(firstload){
        [self confirmSync];
    }
    // Do any additional setup after loading the view, typically from a nib.
    myArray = [[NSMutableArray alloc]initWithObjects:@"A",@"B",@"C",@"D",@"E",
                                                    @"F",@"G",@"H",@"I",@"J",
                                                    @"K",@"L",@"M",@"N",@"O",
                                                    @"P",@"Q",@"R",@"S",@"T",
                                                    @"U",@"s",
                                                    nil];
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View Data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:
(NSInteger)section{
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:
(NSIndexPath *)indexPath{
    static NSString *cellId = @"SimpleTableId";
    
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    [cell reloadInputViews];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:
                UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    NSString *stringForCell;
    int x = indexPath.section;
    NSString* compareLetter = [[myArray objectAtIndex: indexPath.row + indexPath.section*[myArray count]/27] substringWithRange:NSMakeRange(0, 1)];
    NSString* firstLetter = [Alphabet substringWithRange:NSMakeRange(indexPath.section, 1)];
    NSLog(@"first letter vs compare letter is -> %@ vs %@",firstLetter,compareLetter);
    if( [compareLetter isEqualToString: firstLetter]){
            stringForCell = [myArray objectAtIndex: indexPath.row + indexPath.section*[myArray count]/27];
    }
    if(stringForCell==nil)
        stringForCell=@" ";
    [cell.textLabel setText:stringForCell];
    bool tmp = [stringForCell isEqualToString:@" "];
    if(!tmp){
        cell.imageView.image = [UIImage imageNamed:@"Mr._Smiley_Face.svg.png"];
    }

    return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 27;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:
(NSInteger)section{
    NSString *headerTitle = @"0";
    for(int i=0;i<27;i++){
        if (section==i) {
        headerTitle = [Alphabet substringWithRange:NSMakeRange(i, 1)];
        }
    }
    return headerTitle;
}


#pragma mark - TableView delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:
(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSLog(@"Section:%d Row:%d selected and its data is %@",
          indexPath.section,indexPath.row,cell.textLabel.text);
}

-(void)getContacts:(bool) x{
    if(x){
        {
            if ([CNContactStore class]) {
                NSLog(@"reached");
                CNEntityType entityType = CNEntityTypeContacts;
                if( [CNContactStore authorizationStatusForEntityType:entityType] == CNAuthorizationStatusNotDetermined)
                { 
                    CNContactStore * contactStore = [[CNContactStore alloc] init];
                    [contactStore requestAccessForEntityType:entityType completionHandler:^(BOOL granted, NSError * _Nullable error) {
                        if(granted){
                            [self getAllContacts];
                        }
                    }];
                }
                else if( [CNContactStore authorizationStatusForEntityType:entityType] == CNAuthorizationStatusAuthorized)
                {
                    [self getAllContacts];
                }
            }
        }
    }
}

-(void) getAllContacts{
        if([CNContactStore class])
        {
            NSError* contactError;
            CNContactStore* addressBook = [[CNContactStore alloc]init];
            [addressBook containersMatchingPredicate:[CNContainer predicateForContainersWithIdentifiers: @[addressBook.defaultContainerIdentifier]] error:&contactError];
            NSArray * keysToFetch =@[CNContactEmailAddressesKey, CNContactPhoneNumbersKey, CNContactFamilyNameKey, CNContactGivenNameKey, CNContactPostalAddressesKey];
            CNContactFetchRequest * request = [[CNContactFetchRequest alloc]initWithKeysToFetch:keysToFetch];
            BOOL success = [addressBook enumerateContactsWithFetchRequest:request error:&contactError usingBlock:^(CNContact * __nonnull contact, BOOL * __nonnull stop){
                [self parseContactWithContact:contact];
            }];
        }
    }

- (void)parseContactWithContact :(CNContact* )contact
{
    NSString * firstName =  contact.givenName;
    NSString * lastName =  contact.familyName;
    NSString * phone = [[contact.phoneNumbers valueForKey:@"value"] valueForKey:@"digits"];
    NSString * email = [contact.emailAddresses valueForKey:@"value"];
    NSArray * addrArr = [self parseAddressWithContact:contact];
    //NSString *Fullname = [firstName stringByAppendingString:(@"%@\t%@",lastName)];
    NSString *tmp = AS(lastName,(@" "));
    NSString *Fullname = AS(tmp,firstName);
    NSLog(Fullname);
    [myArray addObject:Fullname];
}

- (NSMutableArray *)parseAddressWithContact: (CNContact *)contact
{
    NSMutableArray * addrArr = [[NSMutableArray alloc]init];
    CNPostalAddressFormatter * formatter = [[CNPostalAddressFormatter alloc]init];
    NSArray * addresses = (NSArray*)[contact.postalAddresses valueForKey:@"value"];
    if (addresses.count > 0) {
        for (CNPostalAddress* address in addresses) {
            [addrArr addObject:[formatter stringFromPostalAddress:address]];
        }
    }
    return addrArr;
}
-(void) confirmSync{
    UIAlertView *alertView = [[UIAlertView alloc]
                               initWithTitle:@"Sync"
                              message: @"Do you want to sync your contacts?"
                              delegate: self
                              cancelButtonTitle:@"Yes"
                              otherButtonTitles:@"No"
                               ,nil];
    [alertView show];
    firstload = false;
     
}

- (void)alertView:(UIAlertView *)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        NSLog(@"sync button clicked");
        [self getContacts: true];
    } else if (buttonIndex == 1) {
        NSLog(@"no button clicked");
    }
}

- (IBAction)addContact:(id)sender {
    
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    addContact *secondVC = [segue destinationViewController];
    ViewController *firstVC = [segue sourceViewController];
    secondVC.delegate = firstVC;
}

- (void)receivedAddContact:(CNMutableContact *)addedContact {
    NSString *tmp = addedContact.givenName;
    NSLog(@"ASDFADFSASDFASDFAS");
    [myArray addObject:tmp];
}

- (IBAction)openSecondAction:(id)sender {
    [self performSegueWithIdentifier:@"openSVC" sender:self];
}

@end
