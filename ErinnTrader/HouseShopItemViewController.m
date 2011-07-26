
#import "HouseShopItemViewController.h"
#import "HouseShopItemViewDataSource.h"

@interface HouseShopItemViewController ()
@end

@implementation HouseShopItemViewController

@synthesize houseShopItem = _houseShopItem;

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
  self.dataSource = [[[HouseShopItemViewDataSource alloc] initWithHouseShopItem:self.houseShopItem] autorelease];
}

#pragma mark -
#pragma mark Inherit Methods

- (id)initWithNavigatorURL:(NSURL *)URL query:(NSDictionary *)query { 
  self = [super init];
  if (self) {
    self.houseShopItem = (HouseShopItem *)[query objectForKey:@"item"];
    [self initTableView];
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
  [super dealloc];
}

@end
