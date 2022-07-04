// swift-tools-version:5.3

import PackageDescription

var package = Package(
    name: "DGExtension",
    products: [
        .library(name: "DGExtension", targets: ["DGExtension"])
    ],
    targets: [
        .target(name: "DGExtension")
    ]
)
