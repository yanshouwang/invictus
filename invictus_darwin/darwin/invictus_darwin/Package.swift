// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "invictus_darwin",
    platforms: [
        .iOS("13.0"),
        .macOS("10.15")
    ],
    products: [
        .library(name: "invictus-darwin", targets: ["invictus_darwin"])
    ],
    dependencies: [],
    targets: [
        .target(
            name: "invictus_darwin",
            dependencies: [],
            resources: [
                // If you have resources that need to be bundled with your plugin, refer to
                // the following instructions to add them:
                // https://developer.apple.com/documentation/xcode/bundling-resources-with-a-swift-package
            ]
        )
    ]
)
