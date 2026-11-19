// swift-tools-version:5.9
import PackageDescription

// The product keeps the adapter's name. The binary's module (BidmadAppLovinAdapter) is what
// BidmadSDK looks up at runtime. BidmadAppLovinAdapterLoader carries the dependencies a binary
// target cannot declare, plus generated class references that keep a static
// adapter's classes linked.
let package = Package(
  name: "BidmadAppLovinAdapter",
  platforms: [.iOS(.v15)],
  products: [
    .library(name: "BidmadAppLovinAdapter", targets: ["BidmadAppLovinAdapterLoader"]),
  ],
  dependencies: [
    .package(url: "https://github.com/bidmad/BidmadSDK-SPM.git", .upToNextMinor(from: "7.2.0-dev.1")),
    .package(url: "https://github.com/AppLovin/AppLovin-MAX-Swift-Package.git", exact: "13.6.2"),
  ],
  targets: [
    .target(
      name: "BidmadAppLovinAdapterLoader",
      dependencies: [
        "BidmadAppLovinAdapter",
        .product(name: "BidmadSDK", package: "BidmadSDK-SPM"),
        .product(name: "AppLovinSDK", package: "AppLovin-MAX-Swift-Package"),
      ]
    ),
    .binaryTarget(
      name: "BidmadAppLovinAdapter",
      url: "https://github.com/bidmad/BidmadAppLovinAdapter-SPM/releases/download/13.6.21600-dev.1/BidmadAppLovinAdapter.xcframework.zip",
      checksum: "430b0dafd82db0a0bd84536fe54323bd36f81495518dcb645026d579d3805579"
    ),
  ]
)
