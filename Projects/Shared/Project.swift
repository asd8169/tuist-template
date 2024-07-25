//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by  p2noo on 7/25/24.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "Shared",
    targets: [
        .implements(
            modulePath: .shared(.Shared),
            dependencies: [
                .shared(implementation: .ThirdPartyLibrary),
                .shared(implementation: .CommonUI),
            ]
        ),
    ]
)

