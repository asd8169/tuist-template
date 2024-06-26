//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by p2noo on 6/22/24.
//

import ProjectDescription
import ProjectDescriptionHelpers

//
//let schemes: [Scheme] = [
//    .makeScheme(target: .dev, name: "Sample-Dev"),
//    .makeScheme(target: .prod, name: "Sample-Prod")
//]
//
let schemes: [Scheme] = [
    .scheme(
        name: "Sample-DEV",
        shared: true,
        buildAction: .buildAction(targets: ["Sample"]),
        testAction: .targets(
            ["SampleTests"],
            configuration: .dev,
            options: .options(coverage: true, codeCoverageTargets: ["Sample"])
        ),
        archiveAction: .archiveAction(configuration: .dev),
        profileAction: .profileAction(configuration: .dev),
        analyzeAction: .analyzeAction(configuration: .dev)
    ),
    .scheme(
        name: "Sample-PROD",
        shared: true,
        buildAction: .buildAction(targets: ["Sample"]),
        runAction: .runAction(configuration: .prod),
        archiveAction: .archiveAction(configuration: .prod),
        profileAction: .profileAction(configuration: .prod),
        analyzeAction: .analyzeAction(configuration: .prod)
    )
]

let project = Project.makeModule(
    name: "Sample",
    product: .app,
    // Info.plist 파일 직접 지정
    infoPlist: .file(path: "Support/Info.plist"),
    resources: ["Resources/**"],
    dependencies: [
        .project(target: "Feature", path: .relativeToRoot("Projects/Feature"))
    ],
    schemes: schemes
)



