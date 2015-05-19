//
//  RS3DSegmentedControl.h
//  RS3DSegmentedControl
//
//  Created by Ron Soffer on 12/15/13.
//  Copyright (c) 2013 Ron Soffer. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <iCarousel/iCarousel.h>


@class RS3DSegmentedControl;

@protocol RS3DSegmentedControlDelegate <NSObject>

- (NSUInteger)numberOfSegmentsIn3DSegmentedControl:(RS3DSegmentedControl *)segmentedControl;
- (NSString *)titleForSegmentAtIndex:(NSUInteger)segmentIndex segmentedControl:(RS3DSegmentedControl *)segmentedControl;
- (void)didSelectSegmentAtIndex:(NSUInteger)segmentIndex segmentedControl:(RS3DSegmentedControl *)segmentedControl;

@end


@interface RS3DSegmentedControl : UIView <iCarouselDelegate, iCarouselDataSource>

@property(nonatomic,weak) id<RS3DSegmentedControlDelegate> delegate;

@property(nonatomic,assign) NSUInteger selectedSegmentIndex;
@property(nonatomic,strong) UIColor *backgroundColor;
@property(nonatomic,strong) UIFont *textFont;

- (void)scrollByOffset:(CGFloat)offset duration:(NSTimeInterval)duration;

- (CGSize)contentOffset;
- (void)setContentOffset:(CGSize)contentOffset;


@end


