import SwiftUI
import FBSDKCoreKit
import UserNotifications

final class SehiDelegate: NSObject, UIApplicationDelegate, UNUserNotificationCenterDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        supportedInterfaceOrientationsFor window: UIWindow?
    ) -> UIInterfaceOrientationMask {
        return .portrait
    }

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {

        ApplicationDelegate.shared.application(
            application,
            didFinishLaunchingWithOptions: launchOptions
        )

        if #available(iOS 10.0, *) {
            let center = UNUserNotificationCenter.current()
            center.delegate = self
            center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
                if granted {
                    DispatchQueue.main.async {
                        application.registerForRemoteNotifications()
                    }
                }
            }
        } else {
            let settings = UIUserNotificationSettings(
                types: [.alert, .sound, .badge],
                categories: nil
            )
            application.registerUserNotificationSettings(settings)
            application.registerForRemoteNotifications()
        }

        return true
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        AppEvents.shared.activateApp()
    }

    func application(
        _ application: UIApplication,
        didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data
    ) {
        let tokenString = deviceToken
            .map { String(format: "%02.2hhx", $0) }
            .joined()

        VibratenutoDate.saveRubatoPushen(tokenString)
    }

    func application(
        _ application: UIApplication,
        didFailToRegisterForRemoteNotificationsWithError error: Error
    ) {
        print(error.localizedDescription)
    }
}

@main
struct SehiApp: App {
    @UIApplicationDelegateAdaptor(SehiDelegate.self) var appDelegate
    
    @StateObject var diminishedUtil = DiminishedUtil.shared
    
    init() {
        CiaccaturaJin.shared.startObserve()
        VibratenutoDate.tuneRepriseCache()
    }
    
    var body: some Scene {
        WindowGroup {
            NocturneRootHost(isLegatoSigned: !diminishedUtil.uprightLogUser.isEmpty)
                .ignoresSafeArea()
                .id(diminishedUtil.uprightLogUser.isEmpty)
        }
    }
}
