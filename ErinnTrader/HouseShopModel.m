
#import "HouseShopModel.h"
#import "HouseShopItem.h"

static NSString* const kServiceBaseURL  = @"http://kuku-api.heroku.com/";
static NSString* const kServiceEndPoint = @"erinn_trader/houseshop/";
static NSString* const kLabelMari       = @"mari/";
static NSString* const kLabelRuari      = @"ruari/";
static NSString* const kLabelTarlach    = @"tarlach/";
static NSString* const kLabelMorrighan  = @"morrighan/";
static NSString* const kLabelCichol     = @"cichol/";
static NSString* const kLabelTriona     = @"triona/";

@implementation HouseShopModel

@synthesize houseShopItems = _houseShopItems;
@synthesize searchQuery = _searchQuery;

#pragma -
#pragma Private Methods

////////////////////////////////////////////////////////////////////////////////
// Logic

- (NSString *)resourcePath {
  NSString *path;
  if (self.searchQuery == @"") {
    path = [NSString stringWithFormat:@"%@%@%@%@", kServiceBaseURL, kServiceEndPoint, kLabelMari, @"1"];
  }
  else {
    NSString *query = [NSString stringWithFormat:@"%@/", [self.searchQuery encodeString:NSUTF8StringEncoding]];
    path = [NSString stringWithFormat:@"%@%@%@%@%@", kServiceBaseURL, kServiceEndPoint, kLabelMari, query, @"1"];
  }
  return path;
}

#pragma -
#pragma Inheritance Methods

- (id)init {
  self = [super init];
  if (self) {
    self.houseShopItems = [[NSMutableArray array] retain];
    self.searchQuery = @"";
  }
  return self;
}

- (id)initWithSearchQuery:(NSString *)searchQuery {
  self = [super init];
  if (self) {
    self.houseShopItems = [[NSMutableArray array] retain];
    self.searchQuery = searchQuery;
    [[TTURLCache sharedCache] removeURL:self.resourcePath fromDisk:YES];
  }
  return self;
}

- (void) dealloc {
  self.searchQuery = nil;
  self.houseShopItems = nil;
  [super dealloc];
}

#pragma -
#pragma TTURLRequestModel Methods

- (void)load:(TTURLRequestCachePolicy)cachePolicy more:(BOOL)more {
  if (!self.isLoading) {
    [self.houseShopItems removeAllObjects];
    
    TTURLRequest* request = [TTURLRequest requestWithURL:self.resourcePath delegate:self];
    request.cachePolicy = cachePolicy;
    request.cacheExpirationAge = TT_CACHE_EXPIRATION_AGE_NEVER;
    request.response = [[[TTURLJSONResponse alloc] init] autorelease];
    
    [request send];
  }
}

- (void)requestDidFinishLoad:(TTURLRequest*)request {
  TTURLJSONResponse* response = request.response;
  NSArray *elements = response.rootObject;
  
  for (NSDictionary *element in elements) {
    HouseShopItem *item = [[[HouseShopItem alloc] init] autorelease];
    item.name = [element objectForKey:@"name"];
    item.area = [element objectForKey:@"area"];
    item.item = [element objectForKey:@"item"];
    item.price = [element objectForKey:@"price"];
    item.comment = [element objectForKey:@"comment"];
    item.coupon = [element objectForKey:@"coupon"];
    [self.houseShopItems addObject:item];
  }
  
  [super requestDidFinishLoad:request];
}

@end
