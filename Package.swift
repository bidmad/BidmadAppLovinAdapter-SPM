// swift-tools-version:5.9
import PackageDescription

// The product keeps the adapter's name. The binary's module (BidmadAppLovinAdapter) is what
// BidmadSDK looks up at runtime. BidmadAppLovinAdapterLoader carries the dependencies a binary
// target cannot declare, plus generated class references that keep a static
// adapter's classes linked.
//
// Versions: 7.2.x works with BidmadSDK 7.2.x. The part after "+" is the
// AppLovinSDK version this build pins.
let package = Package(
  name: "BidmadAppLovinAdapter",
  platforms: [.iOS(.v15)],
  products: [
    .library(name: "BidmadAppLovinAdapter", targets: ["BidmadAppLovinAdapterLoader"]),
  ],
  dependencies: [
    .package(url: "https://github.com/bidmad/BidmadSDK-SPM.git", .upToNextMinor(from: "7.2.0-dev.2")),
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
      url: "https://github.com/bidmad/BidmadAppLovinAdapter-SPM/releases/download/7.2.0-dev.2+13.6.2/BidmadAppLovinAdapter.xcframework.zip",
      checksum: "653ee95a7c7520667740e39cdd54a1c135de2dc44c5fe6e5b264434864c3e2eb"
    ),
  ]
)
