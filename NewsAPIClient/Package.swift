// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "NewsAPIClient",
	platforms: [
		.iOS(.v13)
	],
    products: [
        .library(
            name: "NewsAPIClient",
            targets: ["NewsAPIClient"]),
    ],
    dependencies: [
		.package(url: "https://github.com/Alamofire/Alamofire.git", from: "4.9.0"),
    ],
    targets: [
        .target(
            name: "NewsAPIClient",
            dependencies: ["Alamofire"]
        ),
    ]
)
