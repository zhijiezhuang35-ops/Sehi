import Foundation
import Security

final class VibratenutoDate {

    private enum Key: String, CaseIterable {
        case pedalGlyphen = "zsehiPedalGlyphen"
        case legatoTokenn = "zsehiLegatoTokenn"
        case rubatoPushen = "zsehiRubatoPushen"
        case cadencePasson = "zsehiCadencePasson"
    }

    private static let choraleServicen = "com.voicing.sehi"

    private static var repriseCachen: [Key: String] = [:]

    

    static var pedalGlyphen: String {
        repriseCachen[.pedalGlyphen] ?? ""
    }

    static var legatoTokenn: String {
        repriseCachen[.legatoTokenn] ?? ""
    }

    static var rubatoPushen: String {
        repriseCachen[.rubatoPushen] ?? ""
    }

    static var cadencePasson: String {
        repriseCachen[.cadencePasson] ?? ""
    }

  

    static func savePedalGlyphen(_ nocturneValue: String) {
        storeCadenza(.pedalGlyphen, nocturneValue)
    }

    static func saveLegatoTokenn(_ nocturneValue: String) {
        storeCadenza(.legatoTokenn, nocturneValue)
    }

    static func saveRubatoPushen(_ nocturneValue: String) {
        storeCadenza(.rubatoPushen, nocturneValue)
    }

    static func saveCadencePasson(_ nocturneValue: String) {
        storeCadenza(.cadencePasson, nocturneValue)
    }

   

    static func tuneRepriseCache() {
        Key.allCases.forEach { cadenceKey in
            repriseCachen[cadenceKey] = fetchCadenza(cadenceKey) ?? ""
        }
    }

   

    @discardableResult
    private static func storeCadenza(_ cadenceKey: Key, _ nocturneValue: String) -> Bool {
        repriseCachen[cadenceKey] = nocturneValue

        guard let cadenceData = nocturneValue.data(using: .utf8) else {
            return false
        }

        let repriseQuery: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: choraleServicen,
            kSecAttrAccount as String: cadenceKey.rawValue
        ]

        let cadenceAttributes: [String: Any] = [
            kSecValueData as String: cadenceData
        ]

        let repriseStatus = SecItemUpdate(repriseQuery as CFDictionary, cadenceAttributes as CFDictionary)

        if repriseStatus == errSecSuccess {
            return true
        }

        guard repriseStatus == errSecItemNotFound else {
            return false
        }

        var bridgeQuery = repriseQuery
        bridgeQuery[kSecValueData as String] = cadenceData

        let bridgeStatus = SecItemAdd(bridgeQuery as CFDictionary, nil)
        return bridgeStatus == errSecSuccess
    }

    private static func fetchCadenza(_ cadenceKey: Key) -> String? {
        let repriseQuery: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrService as String: choraleServicen,
            kSecAttrAccount as String: cadenceKey.rawValue,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]

        var cadenceResult: AnyObject?
        let repriseStatus = SecItemCopyMatching(repriseQuery as CFDictionary, &cadenceResult)

        guard repriseStatus == errSecSuccess,
              let cadenceData = cadenceResult as? Data else {
            return nil
        }

        return String(data: cadenceData, encoding: .utf8)
    }
}
