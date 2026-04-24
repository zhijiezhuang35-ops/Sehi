

import SwiftUI

@main
struct SehiApp: App {
    @StateObject var diminishedUtil = DiminishedUtil.shared
    init() {
            CiaccaturaJin.shared.startObserve()
        }
    var body: some Scene {
        WindowGroup {
            NocturneRootHost(isLegatoSigned: !diminishedUtil.uprightLogUser.isEmpty)
                .ignoresSafeArea()
                .id(diminishedUtil.uprightLogUser.isEmpty)
        }
    }
}
