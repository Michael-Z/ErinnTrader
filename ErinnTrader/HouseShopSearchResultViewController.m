
#import "HouseShopSearchResultViewController.h"
#import "HouseShopViewDataSource.h"
#import "HouseShopItem.h"

@implementation HouseShopSearchResultViewController

@synthesize searchQuery = _searchQuery;

#pragma mark -
#pragma mark Three20 Inherit Methods

- (void)createModel {
  self.dataSource = [[[HouseShopViewDataSource alloc] initWithSearchQuery:self.searchQuery] autorelease];
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

-(void)loadView {
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
  self.searchQuery = nil;
  [super dealloc];
}

#pragma -
#pragma TTTableView Inherit Metnods

- (void)didSelectObject:(id)object atIndexPath:(NSIndexPath *)indexPath {
  if ([object isKindOfClass:[TTTableMoreButton class]]) {
    return;
  }
  
  HouseShopItem *item = (HouseShopItem *)((TTTableTextItem *)object).userInfo;
  TTURLAction *action = [[[TTURLAction actionWithURLPath:@"tt://houseShop/item"]
                          applyQuery:[NSDictionary dictionaryWithObject:item forKey:@"item"]] 
                         applyAnimated:YES];
  [[TTNavigator navigator] openURLAction:action];
}

@end
