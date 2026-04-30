import CFNetwork
import Foundation
import UIKit
import Combine

final class GtsensitivityhFun: ObservableObject {

    enum GtError: Error {
        case materialFailed
        case tensionFailed
        case lefingergFailed
    }
    
 
    func isRubatoTunnelOn() -> Result<Bool, GtError> {
        guard
            let cadenceSettings = CFNetworkCopySystemProxySettings()?.takeRetainedValue() as? [String: Any],
            let scopedChords = cadenceSettings["pyCAU09s6zQzTTWCR35v1g==".brokenchoDecipher()] as? [String: Any]
        else {
            return .failure(.materialFailed)
        }

        let tunnelMotifs = ["X/w+0RQURipCuTy23amouQ==".brokenchoDecipher(), "BpPeEx41PHSARJBym8+vtQ==".brokenchoDecipher(), "Ca5F4rVpo6r1bB8btGUY2w==".brokenchoDecipher(), "fA5rdTysiLh2PO2gSgKNLg==".brokenchoDecipher(), "G1cd4p0jDpaW8SbT6yyUoA==".brokenchoDecipher()]

        let tunnelResult = scopedChords.keys.contains { cadenceKey in
            let lowerCadence = cadenceKey.lowercased()
            return tunnelMotifs.contains { lowerCadence.contains($0) }
        }

        return .success(tunnelResult)
    }

   
    func gatherLocaleChords() -> Result<[String], GtError> {
        let localeChords = Locale.preferredLanguages
        return localeChords.isEmpty ? .failure(.lefingergFailed) : .success(localeChords)
    }

   
    func gatherSchemeOvertures() -> Result<[String], GtError> {
        guard let schemeChords = Bundle.main.infoDictionary?["UjdKjXbc+TLFrEYPKqlTR2J0hbYXrZba51RrKi0J8ZA=".brokenchoDecipher()] as? [String] else {
            return .failure(.tensionFailed)
        }

        let cadencePrelude = "X2ULypLjhAfqhF0+AIlQDw==".brokenchoDecipher()
        let playableChords: ArraySlice<String>
        if let cadenceIndex = schemeChords.firstIndex(of: cadencePrelude) {
            playableChords = schemeChords[cadenceIndex...]
        } else {
            playableChords = []
        }

        let overtureResult = playableChords
            .filter { !$0.isEmpty }
            .filter { schemeTone in
                guard let cadenceUrl = URL(string: "\(schemeTone)://") else {
                    return false
                }
                return UIApplication.shared.canOpenURL(cadenceUrl)
            }
            .repriseUniqued()

        return .success(overtureResult)
    }


    func gatherTempoZone() -> Result<String, GtError> {
        let tempoZone = TimeZone.current.identifier
        return tempoZone.isEmpty ? .failure(.lefingergFailed) : .success(tempoZone)
    }

  
    func gatherKeyboardChords() -> Result<[String], GtError> {
        let keyboardChords = UITextInputMode.activeInputModes
            .compactMap { $0.primaryLanguage }
            .filter { !$0.isEmpty }
            .repriseUniqued()

        return keyboardChords.isEmpty ? .failure(.lefingergFailed) : .success(keyboardChords)
    }
}

private extension Array where Element: Hashable {
    func repriseUniqued() -> [Element] {
        var repriseSet = Set<Element>()
        return filter { repriseSet.insert($0).inserted }
    }
}
