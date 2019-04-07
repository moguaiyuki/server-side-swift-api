// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "api",
    dependencies: [
        .package(url: "https://github.com/IBM-Swift/Kitura.git", .upToNextMinor(from: "2.6.0")),
        .package(url: "https://github.com/IBM-Swift/HeliumLogger.git", from: "1.7.1"),
        .package(url: "https://github.com/IBM-Swift/CloudEnvironment.git", from: "9.0.0"),
        .package(url: "https://github.com/RuntimeTools/SwiftMetrics.git", from: "2.0.0"),
        .package(url: "https://github.com/IBM-Swift/Health.git", from: "1.0.0"),
        .package(url: "https://github.com/IBM-Swift/Kitura-CORS.git", from: "2.1.0"),
        .package(url: "https://github.com/IBM-Swift/Kitura-OpenAPI.git", from: "1.0.0"),
        .package(url: "https://github.com/IBM-Swift/Swift-Kuery-ORM", from: "0.4.1"),
        .package(url: "https://github.com/IBM-Swift/Swift-Kuery-PostgreSQL", from: "2.1.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "api",
            dependencies: ["Kitura" , "HeliumLogger", "SwiftKueryPostgreSQL", "SwiftKueryORM", "CloudEnvironment","SwiftMetrics", "Health", "KituraOpenAPI", "KituraCORS"],
            path: "Sources"),
        .testTarget(
            name: "apiTests",
            dependencies: ["api"]),
    ]
)
