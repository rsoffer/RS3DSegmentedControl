//
//  RS3DSegmentedControl.m
//  RS3DSegmentedControl
//
//  Created by Ron Soffer on 12/15/13.
//  Copyright (c) 2013 Ron Soffer. All rights reserved.
//

#import "RS3DSegmentedControl.h"

#import "iCarousel.h"

@interface RS3DSegmentedControl ()
@property(nonatomic,strong) UIImageView *backgroundImage;
@end

@implementation RS3DSegmentedControl
{
    iCarousel *_carousel;
    BOOL _delegateJustSet;
}

- (id)init
{
    if (self = [self initWithFrame:CGRectMake(0, 0, 320, 64)])
    {
        
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        NSString *resourcePath = [[NSBundle mainBundle] resourcePath];
        NSString *bundlePath = [resourcePath stringByAppendingPathComponent:@"RS3DSegmentedControl.bundle"];
        NSString *imagePath = [bundlePath stringByAppendingPathComponent:@"RS3DSegmentedControlBg.png"];
        self.backgroundImage = [[UIImageView alloc] initWithImage:[[UIImage imageWithContentsOfFile:imagePath] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 10, 0, 10)]];
        
        [self addSubview:_backgroundImage];
        
        _carousel = [[iCarousel alloc] initWithFrame:self.bounds];
        _carousel.backgroundColor = [UIColor clearColor];
        _carousel.type = iCarouselTypeCustom;
        _carousel.decelerationRate = 0.6f;
        _carousel.scrollSpeed = 0.5f;
        _carousel.stopAtItemBoundary = NO;
        _carousel.dataSource = self;
        
        [self addSubview:_carousel];
        
        self.layer.shouldRasterize = YES;
        self.layer.rasterizationScale = [UIScreen mainScreen].scale;
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.backgroundImage.frame = self.bounds;
}


- (void)setDelegate:(id<RS3DSegmentedControlDelegate>)delegate
{
    _delegate = delegate;
    
    _delegateJustSet = YES;
    
    _carousel.delegate = self;
    
    [_carousel reloadData];
    
    NSUInteger itemToScrollTo = 0;
    [_carousel scrollByNumberOfItems:_carousel.numberOfItems + itemToScrollTo duration:0.9f];
}



- (NSUInteger)selectedSegmentIndex
{
    return _carousel.currentItemIndex;
}


- (void)setSelectedSegmentIndex:(NSUInteger)selectedSegmentIndex animated:(BOOL)animated
{
    [_carousel scrollToItemAtIndex:selectedSegmentIndex animated:animated];
}

- (void)setSelectedSegmentIndex:(NSUInteger)selectedSegmentIndex
{
    [self setSelectedSegmentIndex:selectedSegmentIndex animated:YES];
}

- (void)scrollByOffset:(CGFloat)offset duration:(NSTimeInterval)duration
{
    [_carousel scrollByOffset:offset duration:duration];
}

- (CGSize)contentOffset
{
    return [_carousel contentOffset];
}

- (void)setContentOffset:(CGSize)contentOffset
{
    [_carousel setContentOffset:contentOffset];
}

- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel
{
    return [_delegate numberOfSegmentsIn3DSegmentedControl:self];
}



- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(UIView *)view
{
    if (!view)
    {
        view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, self.frame.size.height)];
        
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
        label.backgroundColor = [UIColor clearColor];
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:15];
        label.textAlignment = NSTextAlignmentCenter;
        label.tag = 1;
        
        [view addSubview:label];
    }
    
    UILabel *label = (UILabel *)[view viewWithTag:1];
    
    label.text = [_delegate titleForSegmentAtIndex:index segmentedControl:self];
    
    if (self.textFont) {
        label.font = self.textFont;
    }
    
    return view;
}



- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index;
{
    
}


- (CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value;
{
    switch (option)
    {
        case iCarouselOptionWrap:
        return YES;
        
        case iCarouselOptionFadeMax:
        {
            return 0.0f;
        }
        case iCarouselOptionFadeMin:
        {
            return 0.0f;
        }
        case iCarouselOptionFadeRange:
        {
            return 1.9f;
        }
        
        case iCarouselOptionOffsetMultiplier:
        {
            return 1.5f;
        }
        
        default:
        {
            return value;
        }
    }
}



- (CATransform3D)carousel:(iCarousel *)carousel itemTransformForOffset:(CGFloat)offset baseTransform:(CATransform3D)transform
{
    NSInteger count = 10;
    
    CGFloat spacing = self.bounds.size.width / 290.f;
    
    CGFloat arc = M_PI * 2.0f;
    
    CGFloat radius = fmaxf(100 * spacing / 2.0f, 100 * spacing / 2.0f / tanf(arc/2.0f/count));
    CGFloat angle = offset / count * arc;
    
    
    return CATransform3DTranslate(transform, radius * sin(angle), 0.0f, radius * cos(angle) - radius);
}




- (void)carouselDidEndScrollingAnimation:(iCarousel *)carousel
{
    if (_delegateJustSet)
    {
        _delegateJustSet = NO;
        
        return;
    }
    
    [_delegate didSelectSegmentAtIndex:carousel.currentItemIndex segmentedControl:self];
}


- (void)setBackgroundColor:(UIColor *)backgroundColor
{
    _backgroundColor = backgroundColor;
    
    self.backgroundImage.image = [self colorImage:self.backgroundImage.image withColor:backgroundColor];
}


- (UIImage *)colorImage:(UIImage *)image withColor:(UIColor *)color
{
    // Make a rectangle the size of your image
    CGRect rect = CGRectMake(0, 0, image.size.width, image.size.height);
    // Create a new bitmap context based on the current image's size and scale, that has opacity
    UIGraphicsBeginImageContextWithOptions(rect.size, NO, image.scale);
    // Get a reference to the current context (which you just created)
    CGContextRef c = UIGraphicsGetCurrentContext();
    // Draw your image into the context we created
    [image drawInRect:rect];
    // Set the fill color of the context
    CGContextSetFillColorWithColor(c, [color CGColor]);
    // This sets the blend mode, which is not super helpful. Basically it uses the your fill color with the alpha of the image and vice versa. I'll include a link with more info.
    CGContextSetBlendMode(c, kCGBlendModeSourceAtop);
    // Now you apply the color and blend mode onto your context.
    CGContextFillRect(c, rect);
    // You grab the result of all this drawing from the context.
    UIImage *result = UIGraphicsGetImageFromCurrentImageContext();
    // And you return it.
    return result;
}


@end
