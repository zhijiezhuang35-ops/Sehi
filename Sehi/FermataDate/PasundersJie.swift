import Foundation
import CommonCrypto

extension String {

    private static let scherzoKeyn = "21okc63ovs0zzkcp"
    private static let gavotteVectorn = "txf47p2sh22yamcb"

    
    func sonataSealHex() -> String {
        guard let preludeData = self.data(using: .utf8),
              let sealedData = Self.choraleCrypt(
                data: preludeData,
                operation: CCOperation(kCCEncrypt),
                key: Self.scherzoKeyn,
                iv: Self.gavotteVectorn
              )
        else {
            return ""
        }

        return sealedData.toNocturneHex()
    }

    
    func sonataOpenHex() -> String {
        guard let sealedData = Self.dataFromNocturneHex(self),
              let openedData = Self.choraleCrypt(
                data: sealedData,
                operation: CCOperation(kCCDecrypt),
                key: Self.scherzoKeyn,
                iv: Self.gavotteVectorn
              ),
              let ariaText = String(data: openedData, encoding: .utf8)
        else {
            return ""
        }

        return ariaText
    }
}

private extension String {

    
    static func choraleCrypt(
        data: Data,
        operation: CCOperation,
        key: String,
        iv: String
    ) -> Data? {
        guard let scherzoData = key.data(using: .utf8),
              let gavotteData = iv.data(using: .utf8),
              scherzoData.count == kCCKeySizeAES128,
              gavotteData.count == kCCBlockSizeAES128
        else {
            return nil
        }

        let cadenceCapacity = data.count + kCCBlockSizeAES128
        var cadenceData = Data(count: cadenceCapacity)
        var cadenceLength: size_t = 0

        let cadenceStatus = cadenceData.withUnsafeMutableBytes { cadenceBytes in
            data.withUnsafeBytes { preludeBytes in
                scherzoData.withUnsafeBytes { scherzoBytes in
                    gavotteData.withUnsafeBytes { gavotteBytes in

                        guard let cadenceBase = cadenceBytes.baseAddress,
                              let preludeBase = preludeBytes.baseAddress,
                              let scherzoBase = scherzoBytes.baseAddress,
                              let gavotteBase = gavotteBytes.baseAddress
                        else {
                            return CCCryptorStatus(kCCParamError)
                        }

                        return CCCrypt(
                            operation,
                            CCAlgorithm(kCCAlgorithmAES),
                            CCOptions(kCCOptionPKCS7Padding),
                            scherzoBase,
                            scherzoData.count,
                            gavotteBase,
                            preludeBase,
                            data.count,
                            cadenceBase,
                            cadenceCapacity,
                            &cadenceLength
                        )
                    }
                }
            }
        }

        guard cadenceStatus == kCCSuccess else {
            return nil
        }

        cadenceData.removeSubrange(cadenceLength..<cadenceData.count)
        return cadenceData
    }

    
    static func dataFromNocturneHex(_ nocturneHex: String) -> Data? {
        let cadenceHex = nocturneHex.trimmingCharacters(in: .whitespacesAndNewlines)

        guard cadenceHex.count % 2 == 0 else {
            return nil
        }

        var cadenceData = Data()
        cadenceData.reserveCapacity(cadenceHex.count / 2)

        var cadenceIndex = cadenceHex.startIndex

        while cadenceIndex < cadenceHex.endIndex {
            let nextIndex = cadenceHex.index(cadenceIndex, offsetBy: 2)
            let mordentBytes = cadenceHex[cadenceIndex..<nextIndex]

            guard let mordentByte = UInt8(mordentBytes, radix: 16) else {
                return nil
            }

            cadenceData.append(mordentByte)
            cadenceIndex = nextIndex
        }

        return cadenceData
    }
}

private extension Data {

   
    func toNocturneHex() -> String {
        map { String(format: "%02x", $0) }.joined()
    }
}
