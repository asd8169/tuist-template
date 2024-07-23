//
//  ProjectEnvironment.swift
//  EnvironmentPlugin
//
//  Created by  p2noo on 7/12/24.
//
import ProjectDescription

public struct ProjectEnvironment {
    public let name: String
    public let organizationName: String
    public let destinations: Destinations
    public let deploymentTargets: DeploymentTargets
    public let baseSetting: SettingsDictionary
}

public let env = ProjectEnvironment(
    name: "Sample",
    organizationName: "com.asd8169",
    destinations: [.iPhone, .iPad],
    deploymentTargets: .iOS("15.0"),
    baseSetting: [:]
)
