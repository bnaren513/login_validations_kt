#import "LoginvalidationsktPlugin.h"
#if __has_include(<loginvalidationskt/loginvalidationskt-Swift.h>)
#import <loginvalidationskt/loginvalidationskt-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "loginvalidationskt-Swift.h"
#endif

@implementation LoginvalidationsktPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftLoginvalidationsktPlugin registerWithRegistrar:registrar];
}
@end
