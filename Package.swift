// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "SILiveSDK",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "SILiveSDK",
            targets: ["SILiveSDKBinary"]
        )
    ],
    dependencies: [],
    targets: [
        .binaryTarget(
            name: "SILiveSDKBinary",
            path: "Binaries/SILiveSDK.xcframework"
        )
    ]
)
