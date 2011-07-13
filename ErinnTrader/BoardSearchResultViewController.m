
#import "BoardSearchResultViewController.h"
#import "BoardViewDataSource.h"
#import "BoardItem.h"

@implementation BoardSearchResultViewController

@synthesize searchQuery = _searchQuery;

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

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
  }
  return self;
}

- (void)loadView {
  [super loadView];
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

@end
