//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by  p2noo on 6/22/24.
//


import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "Core",
    targets: [
        .implements(
            modulePath: .core(.Core),
            dependencies: [
                .shared,
            ]
        )
    ]
)
