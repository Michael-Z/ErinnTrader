
#import "BoardViewController.h"
#import "BoardViewDataSource.h"
#import "BoardItem.h"

@interface BoardViewController ()
- (void)searchButtonTouched;
@end

@implementation BoardViewController

@synthesize searchBar = _searchBar;

#pragma mark -
#pragma mark Private Methods

////////////////////////////////////////////////////////////////////////////////
// initializer

- (void)initNavigationBar {
  self.navigationItem.rightBarButtonItem = 
    [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSearch
                                                  target:self
                                                  action:@selector(searchButtonTouched)];
}

- (void)initSearchBar {
  self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, -44, 320, 44)];
  self.searchBar.delegate = self;
  self.searchBar.showsCancelButton = YES;
  [self.navigationController.navigationBar addSubview:self.searchBar];
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
  }
  
  return self;
}

-(void)loadView {
  [super loadView];
  [self initNavigationBar];
  [self initSearchBar];
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
  self.searchBar = nil;
  [super dealloc];
}

#pragma -
#pragma Event Handling Metnods

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

#pragma -
#pragma TTTableView Inherit Metnods

- (void)didSelectObject:(id)object atIndexPath:(NSIndexPath *)indexPath {
  BoardItem *item = (BoardItem *)((TTTableTextItem *)object).userInfo;
  TTURLAction *action = [[[TTURLAction actionWithURLPath:@"tt://board/item"]
                                       applyQuery:[NSDictionary dictionaryWithObject:item forKey:@"item"]] 
                                       applyAnimated:YES];
  [[TTNavigator navigator] openURLAction:action];
}

#pragma -
#pragma UISearchBarDelegate Methods

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

@end
