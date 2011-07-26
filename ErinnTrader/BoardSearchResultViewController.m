
#import "BoardSearchResultViewController.h"
#import "BoardViewDataSource.h"
#import "BoardItem.h"

@implementation BoardSearchResultViewController

@synthesize searchQuery = _searchQuery;
@synthesize tabBar = _tabBar;

#pragma mark -
#pragma mark Private Methods

////////////////////////////////////////////////////////////////////////////////
// initializer

- (void)initTabBar {
  self.tabBar = [[TTTabStrip alloc] initWithFrame:CGRectMake(0, 0, 320, 41)];
  self.tabBar.delegate = self;
  self.tabBar.tabItems = [NSArray arrayWithObjects:
                          [[[TTTabItem alloc] initWithTitle:@"    ALL    "] autorelease],
                          [[[TTTabItem alloc] initWithTitle:@"    SELL    "] autorelease],
                          [[[TTTabItem alloc] initWithTitle:@"    BUY    "] autorelease],
                          nil];
  [self.view addSubview:self.tabBar];
}

- (void)initTableView {
  self.tableView.frame = 
    CGRectMake(0, self.tableView.frame.origin.y + 41, 320, self.tableView.frame.size.height - 41);
}

#pragma mark -
#pragma mark Three20 Inherit Methods

- (void)createModel {
  self.dataSource = [[[BoardViewDataSource alloc] initWithSearchQuery:self.searchQuery] autorelease];
}

#pragma mark -
#pragma mark Inherit Methods

- (id)initWithSearchQuery:(NSString *)serchQuery {
  self = [super init];
  if (self) {
    self.searchQuery = [serchQuery decodeString:NSUTF8StringEncoding];
  }
  return self;
}

- (void)loadView {
  [super loadView];
  [self initTabBar];
  [self initTableView];
  self.variableHeightRows = YES;
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
  self.tabBar = nil;
  self.searchQuery = nil;
  [super dealloc];
}

#pragma -
#pragma TTTableView Inherit Metnods

- (void)didSelectObject:(id)object atIndexPath:(NSIndexPath *)indexPath {
  BoardItem *item = (BoardItem *)((TTTableTextItem *)object).userInfo;
  TTURLAction *action = [[[TTURLAction actionWithURLPath:@"tt://board/item"]
                          applyQuery:[NSDictionary dictionaryWithObject:item forKey:@"item"]] 
                         applyAnimated:YES];
  [[TTNavigator navigator] openURLAction:action];
}

#pragma mark -
#pragma mark TTTabDelegate Methods

- (void)tabBar:(TTTabBar*)tabBar tabSelected:(NSInteger)selectedIndex {
  BoardViewDataSource *dataSource = (BoardViewDataSource *)self.dataSource;
  dataSource.tradeType = selectedIndex;
  [self refresh];
}

@end
