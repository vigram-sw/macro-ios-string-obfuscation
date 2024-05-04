// swift-tools-version: 5.9

import PackageDescription
import CompilerPluginSupport

let package = Package(
    name: "ObfuscateMacro",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6),
        .macCatalyst(.v13)
    ],
    products: [
        .library(
            name: "ObfuscateMacro",
            targets: ["ObfuscateMacro"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/vigram-sw/framework-ios-swift-syntax.git", .upToNextMajor(from: "510.0.1")),
        .package(url: "https://github.com/apple/swift-algorithms",
                 from: "1.1.0")
    ],
    targets: [
        .target(
            name: "ObfuscateMacro",
            dependencies: [
                //.byName(name: "Algorithms"),
                .product(name: "Algorithms", package: "swift-algorithms"),
                "ObfuscateMacroPlugin",
                "ObfuscateSupport"
            ]
        ),
        .macro(
            name: "ObfuscateMacroPlugin",
            dependencies: [
                //.byName(name: "Algorithms"),
                .product(name: "Algorithms", package: "swift-algorithms"),
                .product(name: "SwiftSyntaxWrapper", package: "framework-ios-swift-syntax"),
                "ObfuscateSupport"
            ]
        ),
        .target(name: "ObfuscateSupport"),
        .testTarget(
            name: "ObfuscateMacroTests",
            dependencies: [
                //.byName(name: "Algorithms"),
                .product(name: "Algorithms", package: "swift-algorithms"),
                .product(name: "SwiftSyntaxWrapper", package: "framework-ios-swift-syntax"),
                "ObfuscateMacro",
                "ObfuscateMacroPlugin"
            ]
        ),
       /*
            .binaryTarget(
                name: "Algorithms",
                path: "Algorithms.xcframework"
            )
        */
            
    ]
)
