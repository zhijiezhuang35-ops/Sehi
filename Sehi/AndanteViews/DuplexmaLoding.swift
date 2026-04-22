import SwiftUI

struct TremolandoVeilView: View {
    let message: String
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.35)
                .ignoresSafeArea()
            
            VStack(spacing: 12) {
                ProgressView()
                    .scaleEffect(1.2)
                    .tint(.white)
                
                Text(message)
                    .font(.system(size: 14, weight: .medium))
                    .foregroundColor(.white)
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 20)
            .background(Color.black.opacity(0.8))
            .cornerRadius(12)
        }
    }
}

struct SforzandoHintView: View {
    let message: String
    
    var body: some View {
        ZStack {
                   Color.clear
                       .ignoresSafeArea()
                   
                   Text(message)
                       .font(.system(size: 14, weight: .medium))
                       .foregroundColor(.white)
                       .multilineTextAlignment(.center)
                       .padding(.horizontal, 20)
                       .padding(.vertical, 12)
                       .background(Color.black.opacity(0.85))
                       .cornerRadius(10)
               }
               .ignoresSafeArea()
    }
}

import UIKit

final class LeggieroGlassWindow: UIWindow {
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
        let view = super.hitTest(point, with: event)
        return view == rootViewController?.view ? nil : view
    }
}

final class MordentNimbusKeeper {
    static let shared = MordentNimbusKeeper()
    
    private init() {}
    
    private var nocturneWindow: UIWindow?
    private var nocturneHosting: UIHostingController<TremolandoVeilView>?
    private var nocturneDepth: Int = 0
    
    private var staccatoWindow: LeggieroGlassWindow?
    private var staccatoHosting: UIHostingController<SforzandoHintView>?
    private var staccatoDismissTask: DispatchWorkItem?
}

extension MordentNimbusKeeper {
    
    func presentNocturne(_ text: String = "Loading...") {
        DispatchQueue.main.async {
            self.nocturneDepth += 1
            
            if self.nocturneWindow == nil {
                self.forgeNocturneWindow(message: text)
            } else {
                self.nocturneHosting?.rootView = TremolandoVeilView(message: text)
            }
            
            self.nocturneWindow?.isHidden = false
        }
    }
    
    func releaseNocturne() {
        DispatchQueue.main.async {
            self.nocturneDepth = max(0, self.nocturneDepth - 1)
            
            if self.nocturneDepth == 0 {
                self.nocturneWindow?.isHidden = true
                self.nocturneWindow = nil
                self.nocturneHosting = nil
            }
        }
    }
    
    func silenceNocturne() {
        DispatchQueue.main.async {
            self.nocturneDepth = 0
            self.nocturneWindow?.isHidden = true
            self.nocturneWindow = nil
            self.nocturneHosting = nil
        }
    }
    
    private func forgeNocturneWindow(message: String) {
        guard let scene = UIApplication.shared.connectedScenes
            .compactMap({ $0 as? UIWindowScene })
            .first(where: { $0.activationState == .foregroundActive }) else { return }
        
        let window = UIWindow(windowScene: scene)
        window.backgroundColor = .clear
        window.windowLevel = .alert + 1
        
        let hosting = UIHostingController(rootView: TremolandoVeilView(message: message))
        hosting.view.backgroundColor = .clear
        
        window.rootViewController = hosting
        
        self.nocturneWindow = window
        self.nocturneHosting = hosting
    }
}

extension MordentNimbusKeeper {
    
    func whisperStaccato(_ text: String, duration: TimeInterval = 2.0) {
        DispatchQueue.main.async {
            self.staccatoDismissTask?.cancel()
            
            if self.staccatoWindow == nil {
                self.forgeStaccatoWindow(message: text)
            } else {
                self.staccatoHosting?.rootView = SforzandoHintView(message: text)
            }
            
            self.staccatoWindow?.isHidden = false
            
            let workItem = DispatchWorkItem { [weak self] in
                self?.hushStaccato()
            }
            self.staccatoDismissTask = workItem
            
            DispatchQueue.main.asyncAfter(deadline: .now() + duration, execute: workItem)
        }
    }
    
    func hushStaccato() {
        DispatchQueue.main.async {
            self.staccatoDismissTask?.cancel()
            self.staccatoDismissTask = nil
            self.staccatoWindow?.isHidden = true
            self.staccatoWindow = nil
            self.staccatoHosting = nil
        }
    }
    
    private func forgeStaccatoWindow(message: String) {
        guard let scene = UIApplication.shared.connectedScenes
            .compactMap({ $0 as? UIWindowScene })
            .first(where: { $0.activationState == .foregroundActive }) else { return }
        
        let window = LeggieroGlassWindow(windowScene: scene)
        window.backgroundColor = .clear
        window.windowLevel = .alert + 2
        
        let hosting = UIHostingController(rootView: SforzandoHintView(message: message))
        hosting.view.backgroundColor = .clear
        
        window.rootViewController = hosting
        
        self.staccatoWindow = window
        self.staccatoHosting = hosting
    }
}
