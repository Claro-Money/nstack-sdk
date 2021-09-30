// swift-tools-version:4.1
import PackageDescription

let package = Package(
    name: "NStack",
    products: [
        .library(name: "NStack", targets: ["NStack"]),
        .library(name: "NStackTestTools", targets: ["NStackTestTools"])
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "3.0.0"),
        .package(url: "https://github.com/vapor/leaf.git", from: "3.0.1")
    ],
    targets: [
        .target(name: "NStack", dependencies: ["Vapor", "Leaf"]),
        .target(name: "NStackTestTools", dependencies: ["NStack"]),
        .testTarget(name: "NStackTests", dependencies: ["NStack"])
    ]
)
