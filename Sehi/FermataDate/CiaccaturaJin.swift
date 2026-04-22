
import StoreKit
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
            return 400
        case "vzyysjycqrvbzvfg":
            return 800
        case "zpeyqotbmhvzsexj":
            return 2190
        case "kytlcnljblywizzx":
            return 2450
        case "teqzpbymoxzvhsej":
            return 3950
        case "vddfnfcslvxrsktk":
            return 4900
        case "bzqvexoymptzshje":
            return 5700
        case "qomyvszxteepbhzj":
            return 9800
        case "wowqeqfjvvmhibcn":
            return 24500
        case "xbgbbeotwfxkqdka":
            return 49000
        default:
            return 0
        }
    }

    
    func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {

        for t in transactions {
            switch t.transactionState {

            case .purchased:
                MordentNimbusKeeper.shared.releaseNocturne()
                
                SKPaymentQueue.default().finishTransaction(t)
                
                let productId = t.payment.productIdentifier
                
              
                let result = sustainBack(tuningkey: productId)
               
                let coins = DiminishedUtil.shared.uprightLogUser["5BxptiltWQT1mkprx2s99w==".brokenchoDecipher()] as? Int ?? 0
                MelodicUsers().updateCurrentUserCoins(to: coins + result )
                
               
                
                    
                onPurchaseSuccess?()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    
                    MordentNimbusKeeper.shared.whisperStaccato("wyCCMWlR5tRXPafbUcFGb9kAOuS5heBq99KmHd8xNUw=".brokenchoDecipher())
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

