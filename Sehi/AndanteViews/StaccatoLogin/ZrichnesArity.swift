


import SwiftUI
import WebKit
import Combine

struct ZrichnesArity: UIViewRepresentable {

    let cadencePortalLine: String
    @Binding var ariaCurtainLit: Bool
    @Binding var preludeBackdropHeld: Bool

    private let rubatoCloseName = "X+HMEaS9wX+wzSiF+tN5rQ==".brokenchoDecipher()
    private let pizzicatoPayName = "O1s7SSaaQO3HieFa4MqYQQ==".brokenchoDecipher()
    private let legatoBrowserName = "dbYluNsb5iGkiMazb2DkCA==".brokenchoDecipher()
    
    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }
    
    func makeUIView(context: Context) -> WKWebView {
        let nocturneWeb = WKWebView(frame: .zero, configuration: makeRefrainConfig(context))
        context.coordinator.cantabileWeb = nocturneWeb
        tuneNocturneWeb(nocturneWeb, context)
        loadCadencePortal(nocturneWeb, context)
        return nocturneWeb
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        loadCadencePortal(webView, context)
    }

    final class Coordinator: NSObject, WKScriptMessageHandler, WKNavigationDelegate, WKUIDelegate {
        var parent: ZrichnesArity
        weak var cantabileWeb: WKWebView?
        var loadedPortalLine: String = ""

        private var adagioStartedAt: Date? = nil

        init(parent: ZrichnesArity) {
            self.parent = parent
        }

        func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
            conductScriptMessage(message)
        }

        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            guard let cadenceUrl = navigationAction.request.url else {
                decisionHandler(.allow)
                return
            }

            decisionHandler(conductNavigation(cadenceUrl, webView: webView))
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
            guard let cadenceUrl = navigationAction.request.url else { return nil }

            if shouldOpenOutside(cadenceUrl) {
                openOutside(cadenceUrl, webView: webView)
                return nil
            }

            webView.load(URLRequest(url: cadenceUrl))
            return nil
        }
        
        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            adagioStartedAt = Date()
            
        }

        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            finishAdagioLoad()
            MordentNimbusKeeper.shared.releaseNocturne()
        }
    }
}

private extension ZrichnesArity {
    func makeRefrainConfig(_ context: Context) -> WKWebViewConfiguration {
        let scriptChorus = WKUserContentController()
        scriptChorus.add(context.coordinator, name: pizzicatoPayName)
        scriptChorus.add(context.coordinator, name: rubatoCloseName)
        scriptChorus.add(context.coordinator, name: legatoBrowserName)

        let refrainConfig = WKWebViewConfiguration()
        refrainConfig.userContentController = scriptChorus
        refrainConfig.mediaTypesRequiringUserActionForPlayback = []
        refrainConfig.allowsInlineMediaPlayback = true
        return refrainConfig
    }

    func tuneNocturneWeb(_ nocturneWeb: WKWebView, _ context: Context) {
        nocturneWeb.scrollView.contentInsetAdjustmentBehavior = .never
        nocturneWeb.isOpaque = true
        nocturneWeb.backgroundColor = .black
        nocturneWeb.scrollView.backgroundColor = .black
        nocturneWeb.navigationDelegate = context.coordinator
        nocturneWeb.uiDelegate = context.coordinator
        nocturneWeb.allowsBackForwardNavigationGestures = true
    }

    func loadCadencePortal(_ nocturneWeb: WKWebView, _ context: Context) {
        guard !cadencePortalLine.isEmpty,
              context.coordinator.loadedPortalLine != cadencePortalLine,
              let portalUrl = URL(string: cadencePortalLine) else {
            return
        }

        context.coordinator.loadedPortalLine = cadencePortalLine
        nocturneWeb.load(URLRequest(url: portalUrl))
    }
}

private extension ZrichnesArity.Coordinator {
    func conductScriptMessage(_ message: WKScriptMessage) {
        switch message.name {
        case parent.rubatoCloseName:
            closeCurtain()
        case parent.pizzicatoPayName:
            conductPayment(message.body)
        case parent.legatoBrowserName:
            conductBrowser(message.body)
        default:
            break
        }
    }
    
    @MainActor
    func closeCurtain() {
        parent.ariaCurtainLit = false
        DiminishedUtil.shared.Ctavayinge = false
    }

    func conductPayment(_ body: Any) {
        guard let cadenceMap = body as? [String: Any] else { return }
        

        let pizzicatoBatch = cadenceMap["wJCvSRl/6SqVNygEvvP+4Q==".brokenchoDecipher()] as? String ?? ""
        let gavotteOrder = cadenceMap["sngtO6rgbfn76kO5yb2wIA==".brokenchoDecipher()] as? String ?? ""
        DiminishedUtil.shared.gavotteOrderen = gavotteOrder

        Task { @MainActor in
            CiaccaturaJin.shared.buy(productId: pizzicatoBatch)
        }
    }

    func conductBrowser(_ body: Any) {
        guard let cadenceMap = body as? [String: String],
              let ariaLine = cadenceMap["VF2NFXRCUFw9TxKrxrQXOA==".brokenchoDecipher()],
              let cadenceUrl = URL(string: ariaLine) else {
            return
        }

        openOutside(cadenceUrl, webView: cantabileWeb)
    }

    func conductNavigation(_ cadenceUrl: URL, webView: WKWebView?) -> WKNavigationActionPolicy {
        let allowedSchemes = ["vLmdL6QRi4ipj+Wuvw1k+g==".brokenchoDecipher(), "YvgZDHubhmlEN6Uny1DjPg==".brokenchoDecipher(), "s0HsBbkO2mvv1Ey5eOC00g==".brokenchoDecipher(), "bL+fF6sBUfALZqsOHkJITQ==".brokenchoDecipher()]

        guard !allowedSchemes.contains(cadenceUrl.scheme?.lowercased() ?? "") else {
            return .allow
        }

        openOutside(cadenceUrl, webView: webView)
        return .cancel
    }

    func shouldOpenOutside(_ cadenceUrl: URL) -> Bool {
        let lowerCadence = cadenceUrl.absoluteString.lowercased()
        return cadenceUrl.scheme == "34M6z+a1RHl+ozceDb+hOg==".brokenchoDecipher()
        || cadenceUrl.scheme == "drgEJ7BT+LjmQTey6YSjrg==".brokenchoDecipher()
        || lowerCadence.contains("fO/9SIn/JtudOD9YKxBXDw==".brokenchoDecipher())
    }

    func openOutside(_ cadenceUrl: URL, webView: WKWebView?) {
        DispatchQueue.main.async {
            UIApplication.shared.open(cadenceUrl, options: [:]) { success in
                self.relayNativeOpen(success, cadenceUrl, webView)
            }
        }
    }

    func relayNativeOpen(_ success: Bool, _ cadenceUrl: URL, _ webView: WKWebView?) {
      

        let cadenceState = success ? "CnXvRngqAz9fdcG/1X2/Xg==".brokenchoDecipher() : "FubkfMGEzTaducQk4/h77w==".brokenchoDecipher()
        let cadenceDetail = [
            "bH3KAYCo1g833/dEQd/w/A==".brokenchoDecipher(): cadenceState,
            "VF2NFXRCUFw9TxKrxrQXOA==".brokenchoDecipher(): cadenceUrl.absoluteString
        ]

        guard JSONSerialization.isValidJSONObject(cadenceDetail),
              let cadenceData = try? JSONSerialization.data(withJSONObject: cadenceDetail, options: []),
              let cadenceText = String(data: cadenceData, encoding: .utf8) else {
            return
        }

        let adagioName = "hmKCiqHDgRt8u9T50Y5NKw==".brokenchoDecipher()
        let cadenceScript = "window.dispatchEvent(new CustomEvent('\(adagioName)', { detail: \(cadenceText) }));"
        DispatchQueue.main.async {
            webView?.evaluateJavaScript(cadenceScript, completionHandler: nil)
        }
    }

    func finishAdagioLoad() {
        guard let adagioStartedAt else { return }

        let adagioDuration = Date().timeIntervalSince(adagioStartedAt)
        DiminishedUtil.shared.staccatempo = String(adagioDuration)

        Task {
            await LadingclarityKuo()
                .sendAttacca("aVKVu2aL5E46BL5vrEBDv1/8FT1e5ZMvA1OE8KzDeZ8=".brokenchoDecipher(), LadingclarityKuo.tabFuguePrelude())
        }

        parent.preludeBackdropHeld = false
    }
}
