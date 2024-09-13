// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Router",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Router",
            targets: ["Router"]),
    ],
    dependencies: [
     .package(path: "../../EventList"),
     .package(path: "../../EventDetail"),
     .package(path: "../../Common"),
     .package(path: "../../Domain"),
     .package(path: "../../Data"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Router",
            dependencies: [
              .product(name: "EventList", package: "EventList"),
              .product(name: "EventDetail", package: "EventDetail"),
              .product(name: "Common", package: "Common"),
              .product(name: "Domain", package: "Domain"),
              .product(name: "Data", package: "Data"),
            ])
    ]
)
