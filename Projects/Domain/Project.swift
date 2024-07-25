//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by  p2noo on 7/15/24.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "Domain",
    targets: [
        .implements(
            modulePath: .domain(.Domain),
            dependencies: [
                .core
            ]
        )
    ]
)
