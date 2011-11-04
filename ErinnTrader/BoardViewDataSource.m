
#import "BoardViewDataSource.h"
#import "BoardModel.h"
#import "BoardItem.h"
#import "ETTableBoardItem.h"
#import "ETTableBoardItemCell.h"
#import "AppHelper.h"

@interface BoardViewDataSource()
- (NSMutableArray *)filteredItems:(NSMutableArray *)items;
- (NSString *)titleForTableItem:(BoardItem *)item;
- (NSString *)subtitleForTableItem:(BoardItem *)item;
@end

@implementation BoardViewDataSource

@synthesize boardModel = _boardModel;
@synthesize tradeType = _tradeType;

#pragma -
#pragma Private Methods

- (NSMutableArray *)filteredItems:(NSMutableArray *)items {
  NSMutableArray *filteredItems = [NSArray array];
  // ---------------------------------------------------------------------------
  // Items for TradeTypeAll
  if (self.tradeType == TradeTypeAll) {
    filteredItems = items;
  }
  // ---------------------------------------------------------------------------
  // Items for TradeTypeSell
  else if (self.tradeType == TradeTypeSell) {
    NSMutableArray *tempArray = [NSMutableArray array];
    NSIndexSet *indexes = [items indexesOfObjectsPassingTest:^(id obj, NSUInteger index, BOOL *stop) { 
      if (([((BoardItem *)((TTTableTextItem *)obj).userInfo).title rangeOfString:@"売ります"]).location != NSNotFound) { 
        return YES; 
      } 
      return NO; 
    }];
    int index = [indexes firstIndex];
    while(index != NSNotFound) {
      [tempArray addObject:[items objectAtIndex:index]];
      index = [indexes indexGreaterThanIndex:index];
    }
    filteredItems = [NSArray arrayWithArray:tempArray];
  }
  // ---------------------------------------------------------------------------
  // Items for TradeTypeBuy
  else if (self.tradeType == TradeTypeBuy) {
    NSMutableArray *tempArray = [NSMutableArray array];
    NSIndexSet *indexes = [items indexesOfObjectsPassingTest:^(id obj, NSUInteger index, BOOL *stop) { 
      if (([((BoardItem *)((TTTableTextItem *)obj).userInfo).title rangeOfString:@"買います"]).location != NSNotFound) { 
        return YES; 
      } 
      return NO; 
    }];
    int index = [indexes firstIndex];
    while(index != NSNotFound) {
      [tempArray addObject:[items objectAtIndex:index]];
      index = [indexes indexGreaterThanIndex:index];
    }
    filteredItems = [NSArray arrayWithArray:tempArray];
  }
  // ---------------------------------------------------------------------------
  return filteredItems;
}

- (NSString *)titleForTableItem:(BoardItem *)item {
  return item.title;
}

- (NSString *)subtitleForTableItem:(BoardItem *)item {
  return [NSString stringWithFormat:@"%@ (%@)", 
          item.author, 
          [AppHelper fuzzyTime:[NSDate dateWithTimeIntervalSince1970:item.published]]];
}

#pragma -
#pragma Inheritance Methods

- (id)init {
  self = [super init];
  if (self) {
    self.boardModel = [[[BoardModel alloc] init] autorelease];
  }
  return self;
}

- (id)initWithSearchQuery:(NSString *)searchQuery {
  self = [super init];
  if (self) {
    self.boardModel = [[[BoardModel alloc] initWithSearchQuery:searchQuery] autorelease];
  }
  return self;
}

- (void)dealloc {
  self.boardModel = nil;
  [super dealloc];
}

#pragma -
#pragma TTTableView Methods

- (id<TTModel>)model {
  return self.boardModel;
}

- (void)tableViewDidLoadModel:(UITableView*)tableView {
  NSMutableArray* items = [NSMutableArray array];
  for (BoardItem *item in self.boardModel.boardItems) {
    ETTableBoardItem *tableItem = [ETTableBoardItem itemWithText:[self titleForTableItem:item]
                                                        subtitle:[self subtitleForTableItem:item]
                                                             URL:@"tt://dev/null"];
    tableItem.userInfo = item;
    [items addObject:tableItem];
  }
  
  if (!self.boardModel.finished) {
    [items addObject:[TTTableMoreButton itemWithText:@"more…"]];
  }
  
  self.items = [self filteredItems:items];
}

- (NSString*)titleForLoading:(BOOL)reloading {
  if (reloading) {
    return @"Updating Official Trading BBS...";
  } else {
    return @"Loading Official Trading BBS...";
  }
}

- (NSString*)titleForEmpty {
  return @"No Entries found.";
}

- (NSString*)subtitleForError:(NSError*)error {
  return @"Sorry, there was an error loading the Official Trading BBS.";
}

- (Class)tableView:(UITableView*)tableView cellClassForObject:(id) object {   
  if ([object isKindOfClass:[ETTableBoardItem class]]) {  
    return [ETTableBoardItemCell class];  
  } else {  
    return [super tableView:tableView cellClassForObject:object];  
  }  
}  

@end
