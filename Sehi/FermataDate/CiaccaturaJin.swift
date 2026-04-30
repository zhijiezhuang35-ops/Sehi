
import StoreKit
import FacebookCore
class CiaccaturaJin: NSObject {

    static let shared = CiaccaturaJin()

    private override init() {
        
    }

    var product: SKProduct?
    
    private var request: SKProductsRequest?
    
    private var isObserving = false
    
    private var pendingProductId: String?
    private var buyCompletion: ((SKProduct?) -> Void)?
    
    var onPurchaseSuccess: (() -> Void)?

    
}
extension CiaccaturaJin: SKProductsRequestDelegate {

    func fetchProduct(productId: String, completion: ((SKProduct?) -> Void)? = nil) {

        pendingProductId = productId
        buyCompletion = completion

        let request = SKProductsRequest(productIdentifiers: [productId])
        self.request = request
        request.delegate = self
        request.start()
    }

    func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {

        let product = response.products.first

        self.product = product

        

        
        buyCompletion?(product)
        buyCompletion = nil
    }
}


extension CiaccaturaJin: SKPaymentTransactionObserver {

   
    func startObserve() {
        guard !isObserving else { return }
        isObserving = true
        SKPaymentQueue.default().add(self)
    }

    
    func stopObserve() {
        isObserving = false
        SKPaymentQueue.default().remove(self)
    }

    
    func buy(productId: String) {
        MordentNimbusKeeper.shared.presentNocturne("loding...")
        
        guard SKPaymentQueue.canMakePayments() else {
            MordentNimbusKeeper.shared.whisperStaccato("CrQfDdJgnJbwk2X0qBZf/A==".brokenchoDecipher())
            MordentNimbusKeeper.shared.releaseNocturne()
            return
        }

        fetchProduct(productId: productId) { product in

            guard let product = product else {
                
                
                MordentNimbusKeeper.shared.releaseNocturne()
                MordentNimbusKeeper.shared.whisperStaccato("EDbUdnJcccgT5qhxVjS5O13kJrfxdm6KHHhVZlXY66o=".brokenchoDecipher())
                return
            }

            let payment = SKPayment(product: product)
            SKPaymentQueue.default().add(payment)
        }
    }
 
    
    func sustainBack(tuningkey: String) -> Int {
        switch tuningkey {
        case "gljfanuyeelqeqbn":
            DiminishedUtil.shared.tacetBravon = 0.99
            return 400
        case "vzyysjycqrvbzvfg":
            DiminishedUtil.shared.tacetBravon = 1.99
            return 800
        case "zpeyqotbmhvzsexj":
            DiminishedUtil.shared.tacetBravon = 3.99
            return 2190
        case "kytlcnljblywizzx":
            DiminishedUtil.shared.tacetBravon = 4.99
            return 2450
        case "teqzpbymoxzvhsej":
            DiminishedUtil.shared.tacetBravon = 8.99
            return 3950
        case "vddfnfcslvxrsktk":
            DiminishedUtil.shared.tacetBravon = 9.99
            return 4900
        case "bzqvexoymptzshje":
            DiminishedUtil.shared.tacetBravon = 13.99
            return 5700
        case "qomyvszxteepbhzj":
            DiminishedUtil.shared.tacetBravon = 19.99
            return 9800
        case "wowqeqfjvvmhibcn":
            DiminishedUtil.shared.tacetBravon = 49.99
            return 24500
        case "xbgbbeotwfxkqdka":
            DiminishedUtil.shared.tacetBravon = 99.99
            return 49000
        default:
            return 0
        }
    }
    
    func erlacrossingp(
        haexecutndId: String,
        usasubstigeStr: String
    ) async throws -> Bool {
        let cadenceLedger: [String: Any] = [
            "sngtO6rgbfn76kO5yb2wIA==".brokenchoDecipher(): DiminishedUtil.shared.gavotteOrderen
        ]

        let sonataData = try JSONSerialization.data(withJSONObject: cadenceLedger, options: [])
        guard let ledgerCantabile = String(data: sonataData, encoding: .utf8) else {
            return false
        }

        let refrainPayload = await LadingclarityKuo.tabWaterRefrain(
            lentoBeat: haexecutndId,
            glissandoTone: usasubstigeStr,
            tremoloPayload: ledgerCantabile
        )

        guard let ariaEcho = await LadingclarityKuo()
            .sendAttacca("xxi+PZ3PgPUljH5t4XmzvALg7XGTDjqHASVtonUmzVA=".brokenchoDecipher(), refrainPayload),
              let cadenceCode = ariaEcho["69CUfy/D683KKA4QOEsjOA==".brokenchoDecipher()] as? String,
              cadenceCode == "FPF+pPDUov7pIhydwO1LZw==".brokenchoDecipher() else {
            return false
        }

        AppEvents.shared.logPurchase(
            amount: DiminishedUtil.shared.tacetBravon,
            currency: "F9jerHGJY/hF8J0nw9rdLg==".brokenchoDecipher(),
            parameters: [
                AppEvents.ParameterName("ZYlCfone+r761jQYnDsyhGcrntDg0zI+BazqcbxuBZ4=".brokenchoDecipher()): "sk3iF3MAZ/65EzdXob6ejw==".brokenchoDecipher()
            ]
        )
        print(DiminishedUtil.shared.tacetBravon)

        return true
    }


    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {

        for t in transactions {
            switch t.transactionState {
                
            case .purchased:
                Task { @MainActor in
                
                
                SKPaymentQueue.default().finishTransaction(t)
                
                let productId = t.payment.productIdentifier
                
                
                let result = sustainBack(tuningkey: productId)
                
                if DiminishedUtil.shared.cantabileVeilin != "" {
                    
                        let purchaseID = t.transactionIdentifier ?? ""
                        let serverVerificationData: String
                        if let receiptURL = Bundle.main.appStoreReceiptURL,
                           let receiptData = try? Data(contentsOf: receiptURL) {
                            serverVerificationData = receiptData.base64EncodedString()
                        } else {
                            serverVerificationData = ""
                        }
                        do {
                         
                            let result = try await erlacrossingp(haexecutndId: purchaseID, usasubstigeStr: serverVerificationData)
                            print(result)
                            if !result {
                                MordentNimbusKeeper.shared.releaseNocturne()
                                MordentNimbusKeeper.shared.whisperStaccato("kKVG76llj7BS55hGUnvudw==".brokenchoDecipher())
                                SKPaymentQueue.default().finishTransaction(t)
                                return
                            }
                            MordentNimbusKeeper.shared.releaseNocturne()
                        } catch {
                            
                            MordentNimbusKeeper.shared.releaseNocturne()
                            SKPaymentQueue.default().finishTransaction(t)
                            return
                        }
                  
                }else {
                    MordentNimbusKeeper.shared.releaseNocturne()
                    let coins = DiminishedUtil.shared.uprightLogUser["5BxptiltWQT1mkprx2s99w==".brokenchoDecipher()] as? Int ?? 0
                    MelodicUsers().updateCurrentUserCoins(to: coins + result )
                    
                    onPurchaseSuccess?()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                        
                        MordentNimbusKeeper.shared.whisperStaccato("wyCCMWlR5tRXPafbUcFGb9kAOuS5heBq99KmHd8xNUw=".brokenchoDecipher())
                    }
                }
               
                
                
               
                
                    
                
                
                }
            case .failed:
              
               
                SKPaymentQueue.default().finishTransaction(t)
                MordentNimbusKeeper.shared.releaseNocturne()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    MordentNimbusKeeper.shared.whisperStaccato("zrtaYcWLaSzPuIHYai8aGQ==".brokenchoDecipher())
                }
            case .restored:
               
                SKPaymentQueue.default().finishTransaction(t)
                MordentNimbusKeeper.shared.releaseNocturne()

            case .purchasing:
                break

            case .deferred:
               
                break

            @unknown default:
                break
            }
        }
    }
    
    
}
