// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import CompilerPluginSupport
import PackageDescription

let package = Package(
    name: "CodingKeys",
    platforms: [
        .macOS(.v12),
        .iOS(.v15),
        .tvOS(.v15),
        .watchOS(.v8),
        .macCatalyst(.v15)
    ],
    products: [
        .library(
            name: "CodingKeys",
            targets: ["CodingKeys"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-syntax.git", from: "509.0.0")
    ],
    targets: [
        .target(
            name: "CodingKeys",
            dependencies: ["CodingKeysMacroPlugin"]
        ),
        .macro(
            name: "CodingKeysMacroPlugin",
            dependencies: [
                .product(name: "SwiftSyntaxMacros", package: "swift-syntax"),
                .product(name: "SwiftCompilerPlugin", package: "swift-syntax")
            ]
        ),
        .testTarget(
            name: "CodingKeysTests",
            dependencies: [
                "CodingKeys",
                "CodingKeysMacroPlugin",
                .product(name: "SwiftSyntaxMacrosTestSupport", package: "swift-syntax")
            ]
        )
    ]
)
