#import "CheckoutComFramesPlugin.h"
#if __has_include(<checkout_com_frames/checkout_com_frames-Swift.h>)
#import <checkout_com_frames/checkout_com_frames-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "checkout_com_frames-Swift.h"
#endif

@implementation CheckoutComFramesPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftCheckoutComFramesPlugin registerWithRegistrar:registrar];
}
@end
