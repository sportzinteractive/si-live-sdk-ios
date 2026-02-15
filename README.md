# SILiveSDK

A SwiftUI SDK for live stream playback with Brightcove, including pre-live image/video and an overlay with back button and title/subtitle.

## Requirements

- iOS 14+ (or as required by your deployment target)
- Swift 5
- Xcode 14+


## Installation

- Swift Package Manager (XCFramework)
- Add the package via Xcode:
- File → Add Package Dependencies
- Use this repository URL:
    https://github.com/sportzinteractive/si-live-sdk-ios

---

## How to use

### 1. Import the module

```swift
import SwiftUI
import SILiveSDK
```

### 2. Add `LiveStreamView` to your UI

Use `LiveStreamView` where you want the stream 

```swift
LiveStreamView(
    environment: .prod,
    eventType: .camera,
    locale: "en",
    onBackTapped: {
        // Dismiss or pop when the user taps the overlay back button
        dismiss()
    }
)
```
environment is an enum with two possible values: `.prod` or `.nonProd`
eventType is an enum with two possible values: `.camera` or `.mobile`
locale is a string which supports two languages: `"en"` for English or `"it"` for Italian

All 3 parameters `environment`, `eventType` and `locale` are required.

**Please Note:**
locale is only used for Pre Live & Post Live scenarios and is not supported when a stream is Live.

### 3. Example with fullScreen Cover
```swift
struct ContentView: View {
    @State private var showLive = false

    var body: some View {
        Button("Start Live") {
            showLive = true
        }
        .fullScreenCover(isPresented: $showLive) {
            LiveStreamView(
                eventType: .camera,
                environment: .prod,
                locale: "en",
                onBackTapped: { showLive = false }
            )
        
        }
    }
}
```
---

## Troubleshooting

- **Stream not starting** → Check `environment` and `eventType`
- **Build fails** → Clean build folder; set deployment target to iOS 15+.
