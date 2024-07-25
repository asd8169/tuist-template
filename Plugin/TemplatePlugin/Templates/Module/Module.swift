//
//  Module.swift
//
//  Created by  p2noo on 7/25/24.
//

import ProjectDescription

// scaffold 명령어 시 받을 인자.
private let nameAttribute = Template.Attribute.required("name")
private let layerAttribute = Template.Attribute.required("layer")
private let targetAttribute = Template.Attribute.required("target")
private let author: Template.Attribute = .required("author")
private let currentDate: Template.Attribute = .required("currentDate")

private let template = Template(
    description: "A template for a new module",
    attributes: [
        layerAttribute,
        nameAttribute,
        targetAttribute,
        author,
        currentDate
    ],
    items: ModuleTemplate.allCases.map { $0.item }
)

enum ModuleTemplate: CaseIterable {
    case project
    case sources

    // 템플릿 내부에 추가 파일.
    var item: Template.Item {
        switch self {
        case .project:
            return .file(path: .basePath + "/Project.swift", templatePath: "Project.stencil")

        case .sources:
            return .file(path: .basePath + "/Sources/Source.swift", templatePath: "Sources.stencil")
        }
    }
}


// 기본 경로.
extension String {
    static var basePath: Self {
        return "Projects/\(layerAttribute)/\(nameAttribute)"
    }
}
