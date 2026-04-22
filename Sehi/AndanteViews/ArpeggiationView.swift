import UIKit
import WebKit
import SwiftUI
class WebViewController: UIViewController, WKNavigationDelegate {

    var webView: WKWebView!
    private var url: URL

    init(url: URL) {
            self.url = url
            super.init(nibName: nil, bundle: nil)
        }
    
    required init?(coder: NSCoder) {
        fatalError("bLLzz756HR9lKM54mmUk1K1hpaUqOfoECh56A33SaBHaXGNsAupnKwRSGr2bUn6p".brokenchoDecipher())
       }

    override func viewDidLoad() {
        super.viewDidLoad()
        let webConfiguration = WKWebViewConfiguration()
        
        webView = WKWebView(frame: self.view.bounds, configuration: webConfiguration)
        webView.navigationDelegate = self
        self.view.addSubview(webView)
        
        let request = URLRequest(url: url)
        webView.load(request)
    }

  
}

// SwiftUI 封装
struct WebView: UIViewRepresentable {
    let url: URL
    var onClose: (() -> Void)?
    var onLogin: (() -> Void)?
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> WKWebView {
        
        
        
        let userContent = WKUserContentController()
        userContent.add(context.coordinator, name: "dGd6t6I2IOmxVkZZZY2v7A==".brokenchoDecipher())
        userContent.add(context.coordinator, name: "5GshZC4MpL3fxrxDUS0dJw==".brokenchoDecipher())
        userContent.add(context.coordinator, name: "XSMNAgew4pOZLQlh0vydQQ==".brokenchoDecipher())
        userContent.add(context.coordinator, name: "hqX1wanZe3Sm9Xou79vpYg==".brokenchoDecipher())
        userContent.add(context.coordinator, name: "N8SZdVv6Ox1EllsNVlvQFw==".brokenchoDecipher())
        userContent.add(context.coordinator, name: "M8007ijkA1kVAlu/hMqwrA==".brokenchoDecipher())
        userContent.add(context.coordinator, name: "acJO/NQOoIwTERqO6juf+A==".brokenchoDecipher())
        userContent.add(context.coordinator, name: "VqR8xYBjmzTygQGdfpu3gg==".brokenchoDecipher())
        userContent.add(context.coordinator, name: "eScV8aTzmcQOXNLNIVmM9Q==".brokenchoDecipher())
        userContent.add(context.coordinator, name: "0hJjql6Ogui+LLLFXC31sw==".brokenchoDecipher())
        
        
        
        
        // ======= 注入 JS 动态数据 =======
            
            var jsCode = ""

        if let cadenceUserData = try? JSONSerialization.data(withJSONObject: MelodicUsers().getResults(), options: []),
               let cadenceUserString = String(data: cadenceUserData, encoding: .utf8) {
            jsCode += "\("DDMeLSTEEPV1eWLX2WNkxXmZU3VuikFxymCYCrT6OvE=".brokenchoDecipher()) \(cadenceUserString);"
            }

            if let variationDynamicData = try? JSONSerialization.data(withJSONObject: OstinatoPosts().getResults(), options: []),
               let variationDynamicString = String(data: variationDynamicData, encoding: .utf8) {
                jsCode += "\("dsBLO0jJpGiP6ZjP9tEdehBx5sQLTo/E+l3YQ5csUKk=".brokenchoDecipher()) \(variationDynamicString);"
            }

            if let iopointenUsersData = try? JSONSerialization.data(withJSONObject: StrikingChat().getMechanism(), options: []),
               let iopointenUsersString = String(data: iopointenUsersData, encoding: .utf8) {
                jsCode += "\("7ic36OA/mEczYfa+fcLWoGPtMo7oheJ1RF4CcYMg5xs=".brokenchoDecipher()) \(iopointenUsersString);"
            }

            if let sucabrerCommentData = try? JSONSerialization.data(withJSONObject: DiminishedUtil.shared.uprightLogUser, options: []),
               let sucabrerCommentString = String(data: sucabrerCommentData, encoding: .utf8) {
                jsCode += "\("oGiSJBx52z6O2aAaH1gujH4cN+UyTuJU1TQrb3HOf9A=".brokenchoDecipher()) \(sucabrerCommentString);"
            }

            if let shoutfitesChatData = try? JSONSerialization.data(withJSONObject: DileicaleMes().getResults(), options: []),
               let shoutfitesChatString = String(data: shoutfitesChatData, encoding: .utf8) {
                jsCode += "\("pvyOVJNR6B2A1wRdmKaE+fy9Q/tXWURcewf1DaKCjkU=".brokenchoDecipher()) \(shoutfitesChatString);"
            }

            if let weatigtsrMessageData = try? JSONSerialization.data(withJSONObject: GlissandoComm().getResults(), options: []),
               let weatigtsrMessageString = String(data: weatigtsrMessageData, encoding: .utf8) {
                jsCode += "\("838zQNZh6h9MeQLvNLGBBjNnLOGpLnu8zTgm7MD9VFM=".brokenchoDecipher()) \(weatigtsrMessageString);"
            }

            let userScript = WKUserScript(
                source: jsCode,
                injectionTime: .atDocumentStart,
                forMainFrameOnly: true
            )
            userContent.addUserScript(userScript)
            
        
        
        
        
        let config = WKWebViewConfiguration()
        config.userContentController = userContent
        
        config.mediaTypesRequiringUserActionForPlayback = []
        config.allowsInlineMediaPlayback = true
        
        
        let webView = WKWebView(frame: .zero, configuration: config)
        context.coordinator.currentWebView = webView
        webView.scrollView.contentInsetAdjustmentBehavior = .never
        webView.isOpaque = true
        webView.backgroundColor = .black
        webView.scrollView.backgroundColor = .black
       

        webView.navigationDelegate = context.coordinator
        webView.uiDelegate = context.coordinator
        webView.allowsBackForwardNavigationGestures = true
        
       
        

        
     
        
        webView.load(URLRequest(url: url))
        
        return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
      
    }

    class Coordinator: NSObject, WKScriptMessageHandler, WKNavigationDelegate,WKUIDelegate {
        var parent: WebView
        weak var currentWebView: WKWebView?
        init(parent: WebView) {
            self.parent = parent
         
        }
        
        

        
        func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
          
            if message.name == "5GshZC4MpL3fxrxDUS0dJw==".brokenchoDecipher() {
                
                
                
                
                if let dict = message.body as? [String: Any] {
                 
                        
                
                    
                   if dict.isEmpty{
                       DispatchQueue.main.async {
                              self.parent.onClose?()
                          }
                    }
                }
               
               
            }else if message.name == "hqX1wanZe3Sm9Xou79vpYg==".brokenchoDecipher() {
               
                if let dict = message.body as? [String: Any],
                   let posts = dict["pLeCPmfTXlx/qojVPK98vw==".brokenchoDecipher()] as? [[String: Any]] {
                    
                   

                    let manager = OstinatoPosts()
                    manager.setResults(posts)
                    manager.saveResults()
                    
                  
                }
            } else if message.name == "XSMNAgew4pOZLQlh0vydQQ==".brokenchoDecipher() {
                if let dict = message.body as? [String: Any],
                   let users = dict["dIRdEZbn0ZJE2n+vg2DZ2g==".brokenchoDecipher()] as? [[String: Any]] {
                    
                   

                    let manager = MelodicUsers()
                    manager.setResults(users)
                    manager.saveResults()
                    
                    if let myId = DiminishedUtil.shared.uprightLogUser["TdVWE+5f7Onr0F+4iwfPVw==".brokenchoDecipher()] as? String {

                        DiminishedUtil.shared.uprightLogUser = manager.getResults().first {
                            ($0["TdVWE+5f7Onr0F+4iwfPVw==".brokenchoDecipher()] as? String) == myId
                        } ?? [:]
                    }
                    
                   
                }
            } else if message.name == "N8SZdVv6Ox1EllsNVlvQFw==".brokenchoDecipher() {
                if let dict = message.body as? [String: Any],
                   let comments = dict["6TgvxKOEY71O6j7JT9QRtg==".brokenchoDecipher()] as? [[String: Any]] {
                    
                   

                    let manager = GlissandoComm()
                    manager.setResults(comments)
                    manager.saveResults()
                    

                }
            } else if message.name == "M8007ijkA1kVAlu/hMqwrA==".brokenchoDecipher() {
                if let dict = message.body as? [String: Any],
                   let chats = dict["POjrwU82ktC36h3ilTs2MQ==".brokenchoDecipher()] as? [[String: Any]] {
                    
                   

                    let manager = StrikingChat()
                    manager.setResults(chats)
                    manager.saveResults()
                    

                }
            } else if message.name == "acJO/NQOoIwTERqO6juf+A==".brokenchoDecipher() {
                if let dict = message.body as? [String: Any],
                   let messages = dict["nZ9YM/LVCMMl0Jy3lprtPQ==".brokenchoDecipher()] as? [[String: Any]] {
                    
                   

                    let manager = DileicaleMes()
                    manager.setResults(messages)
                    manager.saveResults()
                    

                }
            }
            else if message.name == "0hJjql6Ogui+LLLFXC31sw==".brokenchoDecipher() {
                

                if let dict = message.body as? [String: Any],
                   let userInfo = dict["YKP8UkhC2tI+jWfr2EDwUg==".brokenchoDecipher()] as? [String: Any] {

                    let melodicUsers = MelodicUsers()

                    if let user = melodicUsers.addUserAutoId([
                        "X36h+rat00WeuFcH5+oCnQ==".brokenchoDecipher(): DiminishedUtil.shared.articulatEmail,
                        "wYMgXJEv92yYH45LlDuIRg==".brokenchoDecipher(): DiminishedUtil.shared.renthesisPasw,
                        "+pYFtlo9C3YSbSOZ3gw+fw==".brokenchoDecipher(): userInfo["+pYFtlo9C3YSbSOZ3gw+fw==".brokenchoDecipher()] as? String ?? "",
                        "GXKK426Krs45rD0vX/00NA==".brokenchoDecipher(): userInfo["GXKK426Krs45rD0vX/00NA==".brokenchoDecipher()] as? String ?? "",
                        "bL+fF6sBUfALZqsOHkJITQ==".brokenchoDecipher(): "",
                        "5BxptiltWQT1mkprx2s99w==".brokenchoDecipher(): 0,
                        "GRzqXvvooMaYtjcfdA+lgQ==".brokenchoDecipher(): [String](),
                        "6gUmIt6m4JLjYj+Lw74Bow==".brokenchoDecipher(): [String](),
                        "WclSBBv6J3CWIoLJ48xSVA==".brokenchoDecipher(): [String](),
                        "k+rJKyoY0pGtx9aDIlNaFQ==".brokenchoDecipher(): [String](),
                        "THPdeJl2ntXhnc045GxYLQ==".brokenchoDecipher(): 0,
                        "QKPnWrCiuJJ5oWaPS7kOLQ==".brokenchoDecipher(): 0,
                    ]) {
                       
                        DiminishedUtil.shared.uprightLogUser = user
                    }
                }
            }
            
            else if message.name == "VqR8xYBjmzTygQGdfpu3gg==".brokenchoDecipher() {
                if let dict = message.body as? [String: Any],
                   let messages = dict["7qdk2ThHITafUH8UPS82Aw==".brokenchoDecipher()] as? Bool {
                    
                   
                   
                    
                    if !messages{
                        DispatchQueue.main.async {
                               self.parent.onClose?()
                            DiminishedUtil.shared.uprightLogUser = [:]
                           }
                    }
                }
            }else if message.name == "eScV8aTzmcQOXNLNIVmM9Q==".brokenchoDecipher() {
            
                  DispatchQueue.main.async {
                      self.parent.onLogin?()
                  }
          }
            
            else if message.name == "dGd6t6I2IOmxVkZZZY2v7A==".brokenchoDecipher() {
                
               
                if let dict = message.body as? [String: Any],
                   let payKey = dict["7Y9JDq4lJLbQIs2RLOI+sw==".brokenchoDecipher()] as? String {
                   
                   
                   
                    
                    
                          CiaccaturaJin.shared.onPurchaseSuccess = {
                              let user = DiminishedUtil.shared.uprightLogUser
                                  guard JSONSerialization.isValidJSONObject(user),
                                        let data = try? JSONSerialization.data(withJSONObject: user, options: []),
                                        let jsonString = String(data: data, encoding: .utf8) else {
                                      return
                                  }
                              let js = "\("FWsieUvykmepTdUbrp6OiJb5LpdLywiDTxoP/EemYgU=".brokenchoDecipher())(\(jsonString))"
                              DispatchQueue.main.async {
                                    self.currentWebView?.evaluateJavaScript(js) { _, error in
                                        if let error = error {
                                            print("error: \(error)")
                                        }
                                    }
                                }
                          }
                    
                    
                    DispatchQueue.main.async {
                                CiaccaturaJin.shared.buy(productId: payKey)
                    }
                    

                }
                
            }
        }

        
        
        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            if let url = navigationAction.request.url {
                let allowedSchemes = ["vLmdL6QRi4ipj+Wuvw1k+g==".brokenchoDecipher(), "YvgZDHubhmlEN6Uny1DjPg==".brokenchoDecipher(), "s0HsBbkO2mvv1Ey5eOC00g==".brokenchoDecipher(), "/4IY7LbbkOKUNtdPX/eAkQ==".brokenchoDecipher(), "PQyvToOidMBRaPJzqUPRDg==".brokenchoDecipher(), "m7scn/6cm8wZrptxGgvLIQ==".brokenchoDecipher(), "bL+fF6sBUfALZqsOHkJITQ==".brokenchoDecipher()]
                if !allowedSchemes.contains(url.scheme ?? "") {
                    if UIApplication.shared.canOpenURL(url) {
                        UIApplication.shared.open(url)
                        decisionHandler(.cancel)
                        return
                    }
                }
            }
            
            
            decisionHandler(.allow)
        }
        
        func webView(
              _ webView: WKWebView,
              requestMediaCapturePermissionFor origin: WKSecurityOrigin,
              initiatedByFrame frame: WKFrameInfo,
              type: WKMediaCaptureType,
              decisionHandler: @escaping (WKPermissionDecision) -> Void
            ) {
              decisionHandler(.grant)
            }
        
        func webView(
              _ webView: WKWebView,
              createWebViewWith configuration: WKWebViewConfiguration,
              for navigationAction: WKNavigationAction,
              windowFeatures: WKWindowFeatures
            ) -> WKWebView? {
              
              guard let emovpase = navigationAction.request.url else { return nil }

              let vwindmvee = emovpase.absoluteString.lowercased()
                if emovpase.scheme == "34M6z+a1RHl+ozceDb+hOg==".brokenchoDecipher() || emovpase.scheme == "drgEJ7BT+LjmQTey6YSjrg==".brokenchoDecipher()
                    || vwindmvee.contains("fO/9SIn/JtudOD9YKxBXDw==".brokenchoDecipher())
              {
                DispatchQueue.main.async {
                  UIApplication.shared.open(
                    emovpase, options: [:],
                    completionHandler: { success in
                    })
                }
                return nil
              }

              webView.load(URLRequest(url: emovpase))
              return nil
            }
        
        
        
        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        }

        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
          }
    }
}
