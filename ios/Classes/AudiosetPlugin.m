#import "AudiosetPlugin.h"
#if __has_include(<audioset/audioset-Swift.h>)
#import <audioset/audioset-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "audioset-Swift.h"
#endif

@implementation AudiosetPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftAudiosetPlugin registerWithRegistrar:registrar];
}
@end
