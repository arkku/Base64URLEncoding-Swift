// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "Base64URLEncoding",
    products: [
        .library(name: "Base64URLEncoding", targets: [ "Base64URLEncoding" ]),
    ],
    targets: [
        .target(name: "Base64URLEncoding", dependencies: [], path: "Sources"),
        .testTarget(name: "Base64URLEncodingTests", dependencies: [ "Base64URLEncoding" ], path: "Tests"),
    ]
)
