//
//  ViewController.m
//  RS3DSegmentedControl
//
//  Created by Ron Soffer on 12/15/13.
//  Released Under MIT License
//

//  Permission is hereby granted, free of charge, to any person obtaining
//  a copy of this software and associated documentation files (the
//  "Software"), to deal in the Software without restriction, including
//  without limitation the rights to use, copy, modify, merge, publish,
//  distribute, sublicense, and/or sell copies of the Software, and to
//  permit persons to whom the Software is furnished to do so, subject to
//  the following conditions:
//
//  The above copyright notice and this permission notice shall be
//  included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
//  MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
//  LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
//  OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
//  WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//


#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    UILabel *displayLabel;
}

- (void)loadView
{
    [super loadView];
    
    self.segmentedControl = [[RS3DSegmentedControl alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 64)];
    _segmentedControl.delegate = self;
    [self.view addSubview:_segmentedControl];
    
    displayLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, 60)];
    displayLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:displayLabel];
}


- (NSUInteger)numberOfSegmentsIn3DSegmentedControl:(RS3DSegmentedControl *)segmentedControl
{
    return 6;
}

- (NSString *)titleForSegmentAtIndex:(NSUInteger)segmentIndex segmentedControl:(RS3DSegmentedControl *)segmentedControl
{
    switch (segmentIndex) {
        case 0:
            return @"Rock";
        case 1:
            return @"Rap";
        case 2:
            return @"Country";
        case 3:
            return @"Pop";
        case 4:
            return @"Jazz";
        case 5:
            return @"Classical";
            
        default:
            return @"Music";
    }
}


- (void)didSelectSegmentAtIndex:(NSUInteger)segmentIndex segmentedControl:(RS3DSegmentedControl *)segmentedControl
{
    switch (segmentIndex) {
        case 0:
            displayLabel.text = @"Rock";
            break;
        case 1:
            displayLabel.text = @"Rap";
            break;
        case 2:
            displayLabel.text = @"Country";
            break;
        case 3:
            displayLabel.text = @"Pop";
            break;
        case 4:
            displayLabel.text = @"Jazz";
            break;
        case 5:
            displayLabel.text = @"Classical";
            break;
            
        default:
            break;
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
