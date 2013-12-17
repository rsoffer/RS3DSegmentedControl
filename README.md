RS3DSegmentedControl
====================

A 3D filter control that gives users a fun way to browse between many segments.

![alt tag](https://raw.github.com/rsoffer/RS3DSegmentedControl/master/sample.gif)

# How to install

If you don't have cocoapods, visit http://www.cocoapods.org or follow the steps below:

~~~
	# Install Commoand Line Tools in XCode->Preferences->Downloads first.
	sudo gem install cocoapods
	pod setup # Do not sudo here
~~~

If you have Podfile, add ‘RS3DSegmentedControl’. Or follow steps below:

~~~
	# Copy and paste these lines
	echo "platform :ios, ‘6.0’” > Podfile
	echo "pod ‘RS3DSegmentedControl’” >> Podfile
	pod install
	open *.xcworkspace
~~~
This command will generate or edit YourProject.xcworkspace. Open this instead of your original YourProject.xcodeproj.


# Create the view

~~~
	self.segmentedControl = [[RS3DSegmentedControl alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, 64)];
	_segmentedControl.delegate = self;
	[self.view addSubview:_segmentedControl];
~~~



# Implement the delegate methods:
~~~
	- (NSUInteger)numberOfSegmentsIn3DSegmentedControl:(RS3DSegmentedControl *)segmentedControl;
	- (NSString *)titleForSegmentAtIndex:(NSUInteger)segmentIndex segmentedControl:(RS3DSegmentedControl *)segmentedControl;
	- (void)didSelectSegmentAtIndex:(NSUInteger)segmentIndex segmentedControl:(RS3DSegmentedControl *)segmentedControl;
~~~





# License

 This code is distributed under the terms and conditions of the MIT license.

 Copyright (c) 2013 Ron Soffer

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
