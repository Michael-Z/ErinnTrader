
#import "BoardItemViewDataSource.h"
#import "ETTableBoardItem.h"
#import "ETTableBoardItemCell.h"
#import "AppHelper.h"

@interface BoardItemViewDataSource()
- (NSString *)titleForTableItem:(BoardItem *)item;
- (NSString *)subtitleForTableItem:(BoardItem *)item;
@end

@implementation BoardItemViewDataSource

@synthesize boardItem = _boardItem;

#pragma -
#pragma Private Methods

- (NSString *)titleForTableItem:(BoardItem *)item {
  return item.title;
}

- (NSString *)subtitleForTableItem:(BoardItem *)item {
  return [NSString stringWithFormat:@"%@ (%@)", 
          item.author, 
          [AppHelper fuzzyTime:[NSDate dateWithTimeIntervalSince1970:item.published]]];
}

- (NSString *)contentWithoutNoisyString:(BoardItem *)item {
  if (item.content == nil) {
    return nil;
  }
  NSString *pattern = @"\n------------------------------\n(.+)$";
  NSRegularExpression *regexp = [NSRegularExpression regularExpressionWithPattern:pattern
                                                                          options:0
                                                                            error:nil];
  NSString *replaced = [regexp stringByReplacingMatchesInString:item.content
                                                        options:0
                                                          range:NSMakeRange(0, [item.content length])
                                                   withTemplate:@""];
  return [replaced stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

#pragma -
#pragma Inheritance Methods

- (id)init {
  self = [super init];
  if (self) {
  }
  return self;
}

- (id)initWithBoardItem:(BoardItem *)boardItem {
  self = [self init];
  if (self) {
    self.boardItem = boardItem;
  }
  return self;
}


- (void)dealloc {
  self.boardItem = nil;
  [super dealloc];
}

#pragma -
#pragma TTTableView Methods

- (void)tableViewDidLoadModel:(UITableView*)tableView {
  // title cell ----------------------------------------------------------------
  ETTableBoardItem *titleItem = [ETTableBoardItem itemWithText:[self titleForTableItem:self.boardItem]
                                                      subtitle:[self subtitleForTableItem:self.boardItem]
                                                           URL:nil];

  // hyperlink cell ------------------------------------------------------------
  TTTableLink *linkItem = [TTTableLink itemWithText:@"Open Official Trading BBS" URL:self.boardItem.url];
  
  // detail text cell ----------------------------------------------------------
  UITextView *textItem = [[[UITextView alloc] init] autorelease];
  textItem.editable = NO;
  textItem.text = [self contentWithoutNoisyString:self.boardItem];
  
  CGFloat titleHeight = [ETTableBoardItemCell tableView:tableView rowHeightForObject:titleItem];
  CGFloat linkHeight = [TTTableLinkedItemCell tableView:tableView rowHeightForObject:linkItem];
  textItem.height = tableView.bounds.size.height - 22 - titleHeight - linkHeight;

  // add to table items --------------------------------------------------------
  NSMutableArray* items = [NSMutableArray array];
  [items addObject:titleItem];
  [items addObject:textItem];
  [items addObject:linkItem];
  self.items = items;
}

- (Class)tableView:(UITableView*)tableView cellClassForObject:(id) object {   
  if ([object isKindOfClass:[ETTableBoardItem class]]) {  
    return [ETTableBoardItemCell class];  
  } else {  
    return [super tableView:tableView cellClassForObject:object];  
  }  
}  

@end
