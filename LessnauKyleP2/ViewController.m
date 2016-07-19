//
//  ViewController.m
//  LessnauKyleP2
//
//  Created by Kyle Lessnau on 7/6/16.
//  Copyright © 2016 Kyle Lessnau. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    //Sets black border for three buttons and phrase enter box
    [super viewDidLoad];
    [[self.previousButtonOutlet layer] setBorderWidth:1.0f];
    [[self.previousButtonOutlet layer] setBorderColor:[UIColor blackColor].CGColor];
    [[self.randomButtonOutlet layer] setBorderWidth:1.0f];
    [[self.randomButtonOutlet layer] setBorderColor:[UIColor blackColor].CGColor];
    [[self.nextButtonOutlet layer] setBorderWidth:1.0f];
    [[self.nextButtonOutlet layer] setBorderColor:[UIColor blackColor].CGColor];
    [[self.enterPhrases layer] setBorderWidth:1.0f];
    [[self.enterPhrases layer] setBorderColor:[UIColor blackColor].CGColor];
    //Memory allocated for array of phrases
    phraseArray = [[NSMutableArray alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//Global counters i to cycle through messages and arrayCounter to count messages added by user.
int i = 0;
int arrayCounter = 0;

//After previous button is pressed, checks for empty phrase array and then checks if message is currently at index[0]. If on first message, wraps index to end of phraseArray and displays last message
- (IBAction)previousButtonPressed:(UIButton *)sender {
    i--;
    if((int)phraseArray.count == 0) {
        self.enterPhrases.placeholder = @"No available phrases!";
        i++;
    }
    else if(i == -1 && ((int)phraseArray.count != 0)) {
        i = (int)phraseArray.count - 1;
        self.enterPhrases.text = phraseArray[i];
    }
    else
        self.enterPhrases.text = phraseArray[i];

}

//After random button is pressed, finds a random inclusive index and displays message.
- (IBAction)randomButtonPressed:(UIButton *)sender {
   if((int)phraseArray.count == 0)
       self.enterPhrases.placeholder = @"No available phrases!";
   else {
       int random = (arc4random() % phraseArray.count);
       i = random;
       self.enterPhrases.text = phraseArray[i];
   }
}
//After next button is pressed, checks for empty phrase and then checks if message is currently at the end of the phraseArray. If at end, wraps index back to beginning and displays first message.
- (IBAction)nextButtonPressed:(UIButton *)sender {
    i++;
    if((int)phraseArray.count == 0) {
        self.enterPhrases.placeholder = @"No available phrases!";
        i--;
    }
    else if((i == (int)phraseArray.count) && ((int)phraseArray.count != 0)) {
        i = 0;
        self.enterPhrases.text = phraseArray[i];
    }
    else
        self.enterPhrases.text = phraseArray[i];
}
- (void) textFieldDidEndEditing:(UITextField *)textField {
    if(arrayCounter < 10) { //Can only add messages if max of 10 messages has not been met
        if(![textField.text isEqualToString:@""]) {
            [phraseArray addObject:textField.text];
            arrayCounter++;
            self.enterPhrases.placeholder = @"Enter Phrases Here...";
        }
    }
    else //Otherwise,a message is displayed saying you can't add any more.
        self.enterPhrases.text = @"Max Amount of Entries Added.";
}
- (BOOL) textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return YES;
}
- (void) textFieldDidBeginEditing:(UITextField *)textField {
    //Checks that user does not enter an empty string
    textField.text = @"";
}
@end
