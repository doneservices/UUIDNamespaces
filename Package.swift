// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "UUIDNamespaces",
    products: [
        .library(name: "UUIDNamespaces", targets: ["UUIDNamespaces"]),
    ],
    targets: [
        .target(name: "UUIDNamespaces", dependencies: []),
        .testTarget(name: "UUIDNamespacesTests", dependencies: ["UUIDNamespaces"]),
    ]
)
