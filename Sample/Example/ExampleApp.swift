import SwiftUI
import Web3Modal
import WalletConnectSign

#if DEBUG
import Atlantis
#endif

@main
struct ExampleApp: App {
    init() {
        
        #if DEBUG
        Atlantis.start()
        #endif
        
        let metadata = AppMetadata(
            name: "Web3Modal Swift Dapp",
            description: "Web3Modal DApp sample",
            url: "wallet.connect",
            icons: ["https://avatars.githubusercontent.com/u/37784886"],
            redirect: .init(native: "w3mdapp://", universal: nil)
        )
        
        let secrets = Secrets.load()

        Networking.configure(
            groupIdentifier: secrets.groupIdentifier, 
            projectId: secrets.projectID,
            socketFactory: WalletConnectSocketClientFactory()
        )

        Web3Modal.configure(
            projectId: secrets.projectID,
            metadata: metadata
        )
    }

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
