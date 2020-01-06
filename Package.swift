// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "Stevia",
    platforms: [.iOS(.v9), .tvOS(.v10)],
    products: [.library(name: "Stevia", targets: ["Stevia"])],
    targets: [
        .target(name: "Stevia"),
        .testTarget(name: "SteviaTests", dependencies: ["Stevia"]),
    ]
)
