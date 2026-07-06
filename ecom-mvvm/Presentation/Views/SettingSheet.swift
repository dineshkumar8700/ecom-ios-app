import Foundation
import SwiftUI

struct SettingSheet: View {
    @EnvironmentObject var coordinator: HomeCoordinator

    var body: some View {
        Text("Settings")
        Button("Close") {
            coordinator.dismiss()
        }
    }
}
