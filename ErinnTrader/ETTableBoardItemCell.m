
#import "ETTableBoardItemCell.h"
#import "ETTableBoardItem.h"
#import "ETDefaultStyleSheet.h"

static CGFloat kHPadding = 10;  
static CGFloat kVPadding = 7;  

@implementation ETTableBoardItemCell

#pragma -
#pragma Inheritance Methods

+ (CGFloat)tableView:(UITableView*)tableView rowHeightForObject:(id)object {  
  ETTableBoardItem *boardItem = object;
  
  CGFloat maxWidth = tableView.width - kHPadding * 3;  
  
  CGSize textSize = [boardItem.text sizeWithFont:TTSTYLEVAR(boardItemHeadingFont)  
                                 constrainedToSize:CGSizeMake(maxWidth, CGFLOAT_MAX)  
                                     lineBreakMode:UILineBreakModeCharacterWrap];  
  CGSize subtextSize = [boardItem.subtitle sizeWithFont:TTSTYLEVAR(boardItemSubtextFont)  
                                        constrainedToSize:CGSizeMake(maxWidth, CGFLOAT_MAX) 
                                            lineBreakMode:UILineBreakModeCharacterWrap];  
  
  return kVPadding * 2 + textSize.height + subtextSize.height + 5;  
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString*)identifier {
  self = [super initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:identifier];
  if (self) {  
    _item = nil;
  }  
  return self;  
}  

- (void)dealloc {  
  [super dealloc];  
}

#pragma -
#pragma UIView Methods

- (void)layoutSubviews {  
  [super layoutSubviews];  
  
  self.textLabel.top = kVPadding;
  self.textLabel.width = 320 - kHPadding * 3;
  [self.textLabel sizeToFit];
  
  self.detailTextLabel.top = self.textLabel.bottom + 2;
  [self.detailTextLabel sizeToFit];
}

#pragma -
#pragma TTTableViewCell Methods

- (id)object {  
  return _item;  
} 

- (void)setObject:(id)object {
  if (_item != object) {
    [super setObject:object];
    
    self.textLabel.textColor = TTSTYLEVAR(boardItemHeadingColor);
    self.textLabel.font = TTSTYLEVAR(boardItemHeadingFont);
    self.textLabel.textAlignment = UITextAlignmentLeft;
    self.textLabel.contentMode = UIViewContentModeCenter;
    self.textLabel.lineBreakMode = UILineBreakModeCharacterWrap;
    self.textLabel.numberOfLines = 0;
    
    self.detailTextLabel.textColor = TTSTYLEVAR(boardItemSubtextColor);
    self.detailTextLabel.font = TTSTYLEVAR(boardItemSubtextFont);
    self.detailTextLabel.textAlignment = UITextAlignmentLeft;
    self.detailTextLabel.contentMode = UIViewContentModeCenter;
    self.detailTextLabel.lineBreakMode = UILineBreakModeCharacterWrap;
    self.textLabel.numberOfLines = 0;
  }
}

@end
