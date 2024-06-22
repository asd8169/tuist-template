//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by p2noo on 6/22/24.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "Sample",
    product: .app,
    // Info.plist 파일 직접 지정
    infoPlist: .file(path: "Support/Info.plist"),
    resources: ["Resources/**"],
    dependencies: [
        .project(target: "Feature", path: .relativeToRoot("Projects/Feature"))
    ])

