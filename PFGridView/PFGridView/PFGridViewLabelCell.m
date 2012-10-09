//
//  PFGridViewLabelCell.m
//  PFGridView
//
//  Created by YJ Park on 3/11/11.
//  Copyright 2011 PettyFun.com All rights reserved.
//

#import "PFGridViewLabelCell.h"


@implementation PFGridViewLabelCell

@synthesize textLabel;
@synthesize margin;
@synthesize selectedForegrondColor = _selectedForegrondColor;
@synthesize textColor = _textColor;

- (id)initWithReuseIdentifier:(NSString *)identifier {
    if ((self = [super initWithReuseIdentifier:identifier])) {
        textLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        textLabel.backgroundColor = [UIColor clearColor];
        [self addSubview:textLabel];
        _textColor = nil;
        self.textColor = textLabel.textColor;
    }
    return self;
}

- (void) dealloc {
    self.selectedForegrondColor = nil;
    self.textColor = nil;
    [super dealloc];
}

- (void)setFrame:(CGRect)frame {
    [super setFrame:frame];
    CGRect labelFrame = CGRectMake(margin, 0,
                                   frame.size.width - margin * 2,
                                   frame.size.height);
    textLabel.frame = labelFrame;
}

- (void) setSelected:(BOOL)selected {
    [super setSelected:selected];
    if(selected) {
        textLabel.textColor = self.selectedForegrondColor;
    } else {
        textLabel.textColor = self.textColor;
    }
}

-(void) setTextColor:(UIColor *)textColor {
    [_textColor release];
    _textColor = [textColor retain];
    self.textLabel.textColor = textColor;
}

@end
