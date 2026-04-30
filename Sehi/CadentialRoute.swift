import SwiftUI
import Combine
import UIKit
import ObjectiveC
import UIPilot

enum CadentialRoute: Equatable {
    case prelude
    case frictionErtionQd
    case hinverteDmark
    case refrain
    case aria(id: UUID, libretto: String, coda: (() -> Void)? = nil, encore: (() -> Void)? = nil)
    case cadence(id: UUID, hromaticType: String)

    static func == (lhs: CadentialRoute, rhs: CadentialRoute) -> Bool {
        switch (lhs, rhs) {
        case (.prelude, .prelude),
            (.frictionErtionQd, .frictionErtionQd),
            (.hinverteDmark, .hinverteDmark),
            (.refrain, .refrain):
            return true
        case let (.aria(lhsID, lhsLibretto, _, _), .aria(rhsID, rhsLibretto, _, _)):
            return lhsID == rhsID && lhsLibretto == rhsLibretto
        case let (.cadence(lhsID, lhsType), .cadence(rhsID, rhsType)):
            return lhsID == rhsID && lhsType == rhsType
        default:
            return false
        }
    }
}

final class NocturneBox: ObservableObject {
    @Published var rubatoCurtainShow: Bool = false
    private var overtureLift: ((CadentialRoute) -> Void)?
    private var overtureFall: (() -> Void)?
    private var refrainRelay: (() -> Void)?
    private var preludeRelay: (() -> Void)?

    func tuneRelay(
        lift: @escaping (CadentialRoute) -> Void,
        fall: @escaping () -> Void,
        relayRefrain: @escaping () -> Void,
        relayPrelude: @escaping () -> Void
    ) {
        self.overtureLift = lift
        self.overtureFall = fall
        self.refrainRelay = relayRefrain
        self.preludeRelay = relayPrelude
    }

    func openAria(libretto: String, coda: (() -> Void)? = nil, encore: (() -> Void)? = nil) {
        overtureLift?(.aria(id: UUID(), libretto: libretto, coda: coda, encore: encore))
    }

    func openCadence(hromaticType: String) {
        overtureLift?(.cadence(id: UUID(), hromaticType: hromaticType))
    }

    func openFrictionErtionQd() {
        overtureLift?(.frictionErtionQd)
    }

    func openHinverteDmark() {
        overtureLift?(.hinverteDmark)
    }

    func openCrescendoStart() {
        overtureLift?(.prelude)
    }

    func unveilRubatoCurtain() {
        rubatoCurtainShow = true
    }

    func concealRubatoCurtain() {
        rubatoCurtainShow = false
    }

    func liftRoute(_ cadentialRoute: CadentialRoute) {
        overtureLift?(cadentialRoute)
    }

    func fallRoute() {
        overtureFall?()
    }

    func foldSheet() {
        fallRoute()
    }

    func foldBackdrop() {
        fallRoute()
    }

    func foldCurrentCurtain() {
        fallRoute()
    }

    func relayRefrain() {
        concealRubatoCurtain()
        refrainRelay?()
    }

    func relayPrelude() {
        concealRubatoCurtain()
        preludeRelay?()
    }
}

struct NocturneRootHost: View {
    @StateObject private var ariaPilot: UIPilot<CadentialRoute>
    @StateObject private var nocturneBox = NocturneBox()

    init(isLegatoSigned: Bool) {
        _ariaPilot = StateObject(wrappedValue: UIPilot(initial: isLegatoSigned ? .refrain : .frictionErtionQd))
    }
    
    var body: some View {
        UIPilotHost(ariaPilot) { cadentialRoute in
            switch cadentialRoute {
            case .prelude:
                CrescendoStart()
                    .navigationBarHidden(true)
            case .frictionErtionQd:
                FrictionErtionQd()
                    .navigationBarHidden(true)
            case .hinverteDmark:
                HinverteDmark()
                    .navigationBarHidden(true)
            case .refrain:
                DamperpedalNav()
                    .navigationBarHidden(true)
            case let .aria(_, libretto, coda, encore):
                WebView(
                    url: URL(string: libretto)!,
                    onClose: {
                        coda?()
                        nocturneBox.fallRoute()
                    },
                    onLogin: encore
                )
                .ignoresSafeArea()
                .navigationBarHidden(true)
            case let .cadence(_, hromaticType):
                VibratoLogType(hromaticType: hromaticType)
                    .navigationBarHidden(true)
            }
        }
        .environmentObject(nocturneBox)
        .onAppear {
            nocturneBox.tuneRelay(
                lift: { cadentialRoute in
                    tuneCadentialPush(cadentialRoute)
                },
                fall: {
                    ariaPilot.pop()
                },
                relayRefrain: {
                    ariaPilot.popTo(.prelude, inclusive: true, animated: false)
                    ariaPilot.push(.refrain)
                },
                relayPrelude: {
                    ariaPilot.popTo(.refrain, inclusive: true, animated: false)
                    tuneCadentialPush(.prelude)
                }
            )
        }
    }

    private func tuneCadentialPush(_ cadentialRoute: CadentialRoute) {
        guard cadentialRoute.entersWithoutMotion else {
            ariaPilot.push(cadentialRoute)
            return
        }

        CadentialMotionGate.tuneIntermezzo()
        CadentialMotionGate.muteNextLift = true
        ariaPilot.push(cadentialRoute)
    }
}

private extension CadentialRoute {
    var entersWithoutMotion: Bool {
        switch self {
        case .prelude, .hinverteDmark:
            return true
        default:
            return false
        }
    }
}

private enum CadentialMotionGate {
    static var muteNextLift = false
    private static var didTune = false

    static func tuneIntermezzo() {
        guard !didTune,
              let overtureMethod = class_getInstanceMethod(
                UINavigationController.self,
                #selector(UINavigationController.pushViewController(_:animated:))
              ),
              let mutedMethod = class_getInstanceMethod(
                UINavigationController.self,
                #selector(UINavigationController.cadentialMutedPush(_:animated:))
              ) else {
            return
        }

        method_exchangeImplementations(overtureMethod, mutedMethod)
        didTune = true
    }
}

private extension UINavigationController {
    @objc func cadentialMutedPush(_ viewController: UIViewController, animated: Bool) {
        let shouldMute = CadentialMotionGate.muteNextLift
        if shouldMute {
            CadentialMotionGate.muteNextLift = false
        }

        cadentialMutedPush(viewController, animated: shouldMute ? false : animated)
    }
}
