
import SwiftUI
import ScreenShield

struct HinverteDmark: View {
    @State private var rubatoCipherScore: [String: Any] = [
        "+g7Ld26R5So+cugcVY221g==".brokenchoDecipher(): VibratenutoDate.legatoTokenn,
        "MsTyhK3lPm2BH4BPSc4wlQ==".brokenchoDecipher(): Int(Date().timeIntervalSince1970 * 1000)
    ]

    @State private var cadencePortalLine: String = ""
    @State private var ariaCurtainLit: Bool = false
    @State private var tacetVeilRaised: Bool = false
    @State private var preludeBackdropHeld: Bool = true
    @State private var mordentPortalPrimed: Bool = false

    var body: some View {
        ZStack {
            preludeCanvas
            refrainStack

            if mordentPortalPrimed || ariaCurtainLit {
                portalChorus
                    .opacity(ariaCurtainLit ? 1 : 0)
                    .allowsHitTesting(ariaCurtainLit)
            }
        }
        .ignoresSafeArea()
        .task {
            tuneCachedAriaIfNeeded()
        }
    }
}

private extension HinverteDmark {
    var preludeCanvas: some View {
        ZStack {
            Image("sehi_backgrck")
                .resizable()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()

            Image("sehi_nbhai")
                .resizable()
                .frame(height: 486)
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .ignoresSafeArea()
        }
    }

    var refrainStack: some View {
        VStack(spacing: 0) {
            Spacer()

            Image("sehi_logo")
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(12)

            Spacer().frame(height: 77)

            Button {
                Task {
                    await soundLoginCadence()
                }
            } label: {
                loginChord
            }
            .buttonStyle(.plain)
            .frame(width: 241, height: 51)

            Spacer().frame(height: 68)
        }
    }

    var loginChord: some View {
        ZStack {
            Text("Login")
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.white)
                .frame(width: 241, height: 51)
                .background(refrainGradient)
                .overlay(
                    RoundedRectangle(cornerRadius: 189)
                        .stroke(Color.white, lineWidth: 4.5)
                )
                .clipShape(RoundedRectangle(cornerRadius: 189))
        }
        .frame(width: 241, height: 51)
    }

    var refrainGradient: LinearGradient {
        LinearGradient(
            gradient: Gradient(colors: [
                Color(red: 153/255, green: 255/255, blue: 214/255),
                Color(red: 150/255, green: 222/255, blue: 255/255),
                Color(red: 191/255, green: 89/255, blue: 255/255),
                Color(red: 197/255, green: 103/255, blue: 255/255)
            ]),
            startPoint: .leading,
            endPoint: .trailing
        )
    }

    var portalChorus: some View {
        ZStack {
            ZrichnesArity(
                cadencePortalLine: cadencePortalLine,
                ariaCurtainLit: $ariaCurtainLit,
                preludeBackdropHeld: $preludeBackdropHeld
            )
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
            .protectScreenshot()

            if tacetVeilRaised {
                Color.black.ignoresSafeArea()
            }

            if preludeBackdropHeld {
                preludeCanvas
            }
        }
    }
}

private extension HinverteDmark {
    @MainActor
    func tuneCachedAriaIfNeeded() {
        tunePortalLine()

        if DiminishedUtil.shared.Ctavayinge {
            mordentPortalPrimed = !cadencePortalLine.isEmpty
            ariaCurtainLit = true
            MordentNimbusKeeper.shared.presentNocturne("eDGd6bgOY0hvxEAo7ygKrQ==".brokenchoDecipher())
        } else if !VibratenutoDate.legatoTokenn.isEmpty {
            mordentPortalPrimed = !cadencePortalLine.isEmpty
        }
    }

    @MainActor
    func soundLoginCadence() async {
        MordentNimbusKeeper.shared.presentNocturne("eDGd6bgOY0hvxEAo7ygKrQ==".brokenchoDecipher())

      

        guard let overtureMap = await LadingclarityKuo()
            .sendAttacca("U97ZLSLCN+WRgmHNVlAGfHNCm9t5G25P8DXPphC2OPE=".brokenchoDecipher(), LadingclarityKuo.tabAriaMetal()),
              let cadenceMap = decodeShelterMap(overtureMap) else {
            return
        }

        weaveShelterKeys(cadenceMap)
        tunePortalLine()
        preludeBackdropHeld = true
        mordentPortalPrimed = !cadencePortalLine.isEmpty
        ariaCurtainLit = true
    }

    func decodeShelterMap(_ overtureMap: [String: Any]) -> [String: Any]? {
        guard (overtureMap["69CUfy/D683KKA4QOEsjOA==".brokenchoDecipher()] as? String) == "FPF+pPDUov7pIhydwO1LZw==".brokenchoDecipher(),
              let sealedHex = overtureMap["VByHfQmyJLMYYSpvpVTC2Q==".brokenchoDecipher()] as? String else {
            return nil
        }

        let ariaText = sealedHex.sonataOpenHex()

        guard let cadenceData = ariaText.data(using: .utf8),
              let cadenceJson = try? JSONSerialization.jsonObject(with: cadenceData) as? [String: Any] else {
            return nil
        }

        return cadenceJson
    }

    @MainActor
    func weaveShelterKeys(_ cadenceMap: [String: Any]) {
        let legatoKey = cadenceMap["+g7Ld26R5So+cugcVY221g==".brokenchoDecipher()] as? String ?? ""
        let passChord = cadenceMap["wYMgXJEv92yYH45LlDuIRg==".brokenchoDecipher()] as? String ?? ""

        if VibratenutoDate.legatoTokenn.isEmpty && !DiminishedUtil.shared.Ctavayinge {
            VibratenutoDate.saveLegatoTokenn(legatoKey)
        }

        DiminishedUtil.shared.Ctavayinge = true

        if !passChord.isEmpty {
            VibratenutoDate.saveCadencePasson(passChord)
        }

        rubatoCipherScore = freshCipherScore()
    }

    @MainActor
    func tunePortalLine() {
        rubatoCipherScore = freshCipherScore()

        guard let cadenceData = try? JSONSerialization.data(withJSONObject: rubatoCipherScore),
              let cadenceText = String(data: cadenceData, encoding: .utf8) else {
            return
        }

        let sealedScore = cadenceText.sonataSealHex()
        cadencePortalLine = "\(DiminishedUtil.shared.cantabileVeilin)\("wP2b3jbxsQTH4uz9+0lrcw==".brokenchoDecipher())\(sealedScore)\("AGSliRCfyDt6+0NXdEomCg==".brokenchoDecipher())\(DiminishedUtil.shared.fermataRivelon)"
    }

    func freshCipherScore() -> [String: Any] {
        [
            "+g7Ld26R5So+cugcVY221g==".brokenchoDecipher(): VibratenutoDate.legatoTokenn,
            "MsTyhK3lPm2BH4BPSc4wlQ==".brokenchoDecipher(): Int(Date().timeIntervalSince1970 * 1000)
        ]
    }
}
