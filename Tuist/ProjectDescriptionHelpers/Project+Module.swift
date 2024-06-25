import ProjectDescription
import EnvironmentPlugin
import TemplatePlugin
/// Project helpers are functions that simplify the way you define your project.
/// Share code to create targets, settings, dependencies,
/// Create your own conventions, e.g: a func that makes sure all shared targets are "static frameworks"
/// See https://docs.tuist.io/guides/helpers/

extension Project {
    
    /// module 생성 method
    /// - Parameters:
    ///   - name: 모듈 이름
    ///   - destinations: platform 파라미터 제거 -> destinations 추가, target에서 지원되는 배포 대상 설정
    ///   - product: 모듈의 product type (framework, staticFramework 등)
    ///   - organizationName: organizationName
    ///   - packages: 외부 패키지 의존성
    ///   - infoPlist:  Info.plist 설정 (기본값: .default)
    ///   - sources: 소스 파일 목록 (기본값: ["Sources/**"])
    ///   - resources: 리소스 파일 목록 (기본값: nil)
    ///   - dependencies: 타겟 의존성 목록 (기본값: [])
    ///   - deploymentTargets: deploymentTarget
    /// - Returns: 구성된 Project 객체
    public static func makeModule(
        name: String,
        destinations: Destinations = [.iPhone, .iPad],
        product: Product,
        organizationName: String = "p2noo",
        packages: [Package] = [],
        deploymentTargets: DeploymentTargets? = .iOS("15.0"),
        infoPlist: InfoPlist = .default,
        sources: SourceFilesList = ["Sources/**"],
        resources: ResourceFileElements? = nil,
        dependencies: [TargetDependency] = []
    ) -> Project {
        
        // 기본 설정 정의
        let settings: Settings = .settings(
            base: [:],
            configurations: [
                .debug(name: .debug),
                .release(name: .release)
            ], 
            defaultSettings: .recommended
        )
        
        // 앱 타겟 생성
        let appTarget = Target.target(
            name: name,
            destinations: destinations,
            product: product,
            bundleId: "\(organizationName).\(name)",
            deploymentTargets: deploymentTargets,
            infoPlist: infoPlist,
            sources: sources,
            resources: resources,
            scripts: [.swiftLintRunScript],
            dependencies: dependencies
        )
        
        // 테스트 타겟 생성
        let testTarget = Target.target(
            name: "\(name)Tests",
            destinations: destinations,
            product: .unitTests,
            bundleId: "\(organizationName).\(name)",
            deploymentTargets: deploymentTargets,
            infoPlist: .default,
            sources: ["Tests/**"],
            dependencies: [.target(name: name)]
        )
        
        // 스킴 생성
        let schemes: [Scheme] = [.makeScheme(target: .debug, name: name)]
        
        // 타겟 배열 생성
        let targets: [Target] = [appTarget, testTarget]
        
        // Project 객체 반환
        return Project(
            name: name,
            organizationName: organizationName,
            packages: packages,
            settings: settings,
            targets: targets,
            schemes: schemes
        )
    }
}


