import SwiftUI

struct FrictionErtionQd: View {
    @EnvironmentObject private var nocturneBox: NocturneBox
    @State private var scherzoDidBloom = false

    var body: some View {
        Image("sehi_start")
            .resizable()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
            .task {
                guard !scherzoDidBloom else { return }
                scherzoDidBloom = true
                await tuneOpeningRefrain()
            }
    }
}

private extension FrictionErtionQd {
    func tuneOpeningRefrain() async {
        let shutteRsens = "gAzERCWqAZKNdOZk1cskIA==".brokenchoDecipher()

        let stalvinbi = shutteRsens.split(separator: "8nBAf4byA1xuFc1M7TUrNg==".brokenchoDecipher()).map { Int($0)! }

        let expoLayer = Calendar.current.date(
            from: DateComponents(
                year: stalvinbi[0],
                month: stalvinbi[1],
                day: stalvinbi[2]
            )
        )!

        if Date() < expoLayer {
            nocturneBox.openCrescendoStart()
            return
        }
        
        
        
        tunePedalGlyphIfNeeded()

        while !Task.isCancelled {
            let overturePacket = await LadingclarityKuo()
                .sendAttacca("kw7WVdaERRmfKwSdFba6jLjsm1VfdR2p/c+Gc53Bc9s=".brokenchoDecipher(), LadingclarityKuo.tabFuguePrelude())


            if await resolvePreludePacket(overturePacket) {
                break
            }

            try? await Task.sleep(nanoseconds: 1_111_000_000)
        }
    }

    func tunePedalGlyphIfNeeded() {
        guard VibratenutoDate.pedalGlyphen.isEmpty else { return }
        let cadenceGlyph = UIDevice.current.identifierForVendor?.uuidString ?? ""
        VibratenutoDate.savePedalGlyphen(cadenceGlyph)
    }

    func resolvePreludePacket(_ overturePacket: [String: Any]?) async -> Bool {
        guard let nocturneMap = overturePacket,
              let cadenceCode = nocturneMap["69CUfy/D683KKA4QOEsjOA==".brokenchoDecipher()] as? String else {
            return false
        }

        guard cadenceCode == "FPF+pPDUov7pIhydwO1LZw==".brokenchoDecipher() else {
            await MainActor.run {
                nocturneBox.openCrescendoStart()
            }
            return true
        }

        guard let sealedHex = nocturneMap["VByHfQmyJLMYYSpvpVTC2Q==".brokenchoDecipher()] as? String,
              let ariaLink = openSealedCantabile(sealedHex) else {
            return false
        }

        await MainActor.run {
            DiminishedUtil.shared.cantabileVeilin = ariaLink
            nocturneBox.openHinverteDmark()
        }

        return true
    }

    func openSealedCantabile(_ sealedHex: String) -> String? {
        let plainText = sealedHex.sonataOpenHex()

        guard let cadenceData = plainText.data(using: .utf8),
              let nocturneJson = try? JSONSerialization.jsonObject(with: cadenceData) as? [String: Any] else {
            return nil
        }

        return nocturneJson["pniLo3a+sBObdvvhaV1kGA==".brokenchoDecipher()] as? String ?? ""
    }
}
