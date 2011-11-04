
#import "BoardViewController.h"
#import "BoardViewDataSource.h"
#import "BoardItem.h"

@interface BoardViewController ()
- (void)searchButtonTouched;
@end

@implementation BoardViewController

@synthesize searchBar = _searchBar;
@synthesize tabBar = _tabBar;

#pragma mark -
#pragma mark Private Methods

////////////////////////////////////////////////////////////////////////////////
// initializer

- (void)initView {
  UIImage* image = [UIImage imageNamed:@"board.png"];
  self.tabBarItem = [[[UITabBarItem alloc] initWithTitle:@"Board" image:image tag:0] autorelease];
}

- (void)initNavigationBar {
  self.navigationItem.rightBarButtonItem = 
    [[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch
                                                   target:self
                                                   action:@selector(searchButtonTouched)] autorelease];
}

- (void)initSearchBar {
  self.searchBar = [[[UISearchBar alloc] initWithFrame:CGRectMake(0, -44, 320, 44)] autorelease];
  self.searchBar.delegate = self;
  self.searchBar.showsCancelButton = YES;
  [self.navigationController.navigationBar addSubview:self.searchBar];
}

- (void)initTabBar {
  self.tabBar = [[[TTTabStrip alloc] initWithFrame:CGRectMake(0, 0, 320, 41)] autorelease];
  self.tabBar.delegate = self;
  self.tabBar.tabItems = [NSArray arrayWithObjects:
                          [[[TTTabItem alloc] initWithTitle:@"    ALL    "] autorelease],
                          [[[TTTabItem alloc] initWithTitle:@"    SELL    "] autorelease],
                          [[[TTTabItem alloc] initWithTitle:@"    BUY    "] autorelease],
                          nil];
  [self.view addSubview:self.tabBar];
}

- (void)initTableView {
  self.variableHeightRows = YES;
  self.tableView.frame = 
    CGRectMake(0, self.tableView.frame.origin.y + 41, 320, self.tableView.frame.size.height - 41);
}

#pragma mark -
#pragma mark Three20 Inherit Methods

- (void)createModel {
  self.dataSource = [[[BoardViewDataSource alloc] init] autorelease];
}

- (id<UITableViewDelegate>)createDelegate {
  return [[[TTTableViewDragRefreshDelegate alloc] initWithController:self] autorelease];
}

#pragma mark -
#pragma mark Inherit Methods

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    [self initView];
  }
  return self;
}

-(void)loadView {
  [super loadView];
  [self initNavigationBar];
  [self initSearchBar];
  [self initTabBar];
  [self initTableView];
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
  self.searchBar = nil;
  [super dealloc];
}

#pragma mark -
#pragma mark Event Handling Metnods

- (void)searchButtonTouched {
  [UIView animateWithDuration:0.3
                   animations:^{ self.searchBar.frame = CGRectMake(0, 0, 320, 44); }];
  
  UIView *overlay = [[[UIView alloc] initWithFrame:self.view.frame] autorelease];
  overlay.tag = 99567;
  overlay.backgroundColor = [UIColor blackColor];
  overlay.alpha = 0.7;
  [self.view addSubview:overlay];
  
  [self.searchBar becomeFirstResponder];
}

#pragma mark -
#pragma mark TTTableView Inherit Metnods

- (void)didSelectObject:(id)object atIndexPath:(NSIndexPath *)indexPath {
  if ([object isKindOfClass:[TTTableMoreButton class]]) {
    return;
  }
  
  BoardItem *item = (BoardItem *)((TTTableMessageItem *)object).userInfo;
  TTURLAction *action = [[[TTURLAction actionWithURLPath:@"tt://board/item"]
                                       applyQuery:[NSDictionary dictionaryWithObject:item forKey:@"item"]] 
                                       applyAnimated:YES];
  [[TTNavigator navigator] openURLAction:action];
}

#pragma mark -
#pragma mark UISearchBarDelegate Methods

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {  
  if ([searchBar.text length] == 0) {
    return;
  }
  
  [UIView animateWithDuration:0.3
                   animations:^{ self.searchBar.frame = CGRectMake(0, -44, 320, 44); }];
  [[self.view viewWithTag:99567] removeFromSuperview];
  [searchBar resignFirstResponder];
  
  NSString *url = [NSString stringWithFormat:
                   @"tt://board/search?q=%@", [searchBar.text encodeString:NSUTF8StringEncoding]];
  TTURLAction *action = [[TTURLAction actionWithURLPath:url] applyAnimated:YES];
  [[TTNavigator navigator] openURLAction:action];
}  

- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
  [UIView animateWithDuration:0.3
                   animations:^{ self.searchBar.frame = CGRectMake(0, -44, 320, 44); }];
  [[self.view viewWithTag:99567] removeFromSuperview];
  [searchBar resignFirstResponder];
}

#pragma mark -
#pragma mark TTTabDelegate Methods

- (void)tabBar:(TTTabBar*)tabBar tabSelected:(NSInteger)selectedIndex {
  BoardViewDataSource *dataSource = (BoardViewDataSource *)self.dataSource;
  dataSource.tradeType = selectedIndex;
  [self refresh];
}

@end
