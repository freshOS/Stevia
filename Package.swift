// swift-tools-version:6.0

import PackageDescription

let package = Package(
    name: "Stevia",
    platforms: [
        .iOS(.v12),
        .tvOS(.v12)
    ],
    products: [.library(name: "Stevia", targets: ["Stevia"])],
    targets: [
        .target(name: "Stevia", path: "Sources", resources: [.copy("PrivacyInfo.xcprivacy")]),
        .testTarget(name: "SteviaTests", dependencies: ["Stevia"]),
    ]
)
