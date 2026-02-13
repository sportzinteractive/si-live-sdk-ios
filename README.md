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
    eventType: .camera,      // or .mobile
    environment: .prod,      // or .nonProd
    locale: "en",
    onBackTapped: {
        // Dismiss or pop when the user taps the overlay back button
        dismiss()
    }
)
```

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
