//
//  ViewController.h
//  LessnauKyleP2
//
//  Created by Kyle Lessnau on 7/6/16.
//  Copyright © 2016 Kyle Lessnau. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITextFieldDelegate> {
    NSMutableArray *phraseArray;
}

//@property (weak, nonatomic) IBOutlet UITextField *enterPhrases;
@property (weak, nonatomic) IBOutlet UITextField *enterPhrases;
@property (weak, nonatomic) IBOutlet UIButton *previousButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *randomButtonOutlet;
@property (weak, nonatomic) IBOutlet UIButton *nextButtonOutlet;
- (IBAction)previousButtonPressed:(UIButton *)sender;
- (IBAction)randomButtonPressed:(UIButton *)sender;
- (IBAction)nextButtonPressed:(UIButton *)sender;
- (void) textFieldDidEndEditing:(UITextField *)textField;
- (BOOL) textFieldShouldReturn:(UITextField *)textField;
- (void) textFieldDidBeginEditing:(UITextField *)textField;


@end

