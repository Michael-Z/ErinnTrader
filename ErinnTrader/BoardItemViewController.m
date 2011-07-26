
#import "BoardItemViewController.h"
#import "BoardItemViewDataSource.h"

@interface BoardItemViewController ()
@end

@implementation BoardItemViewController

@synthesize boardItem = _boardItem;

#pragma mark -
#pragma mark Private Methods

- (void)initTableView {
  self.tableViewStyle = UITableViewStyleGrouped;
  self.variableHeightRows = YES;
  self.tableView.scrollEnabled = NO;
}

#pragma mark -
#pragma mark Three20 Inherit Methods

- (void)createModel {
  self.dataSource = [[[BoardItemViewDataSource alloc] initWithBoardItem:self.boardItem] autorelease];
}

#pragma mark -
#pragma mark Inherit Methods

- (id)initWithNavigatorURL:(NSURL *)URL query:(NSDictionary *)query { 
  self = [super init];
  if (self) {
    self.boardItem = (BoardItem *)[query objectForKey:@"item"];
    [self initTableView];
  }
  return self;
}

- (void)loadView {
  [super loadView];
}


- (void)viewDidLoad {
  [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
  [super viewDidUnload];
}

- (void)dealloc {
  [super dealloc];
}

@end
