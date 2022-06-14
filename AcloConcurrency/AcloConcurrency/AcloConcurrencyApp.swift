import SwiftUI

@main
struct AcloConcurrencyApp: App {

    @StateObject private var collectionsViewModel: CollectionsViewModel

    init() {
        let listService = ListService()
        _collectionsViewModel = StateObject(
            wrappedValue: CollectionsViewModel(listService: listService)
        )
    }

    var body: some Scene {
        WindowGroup {
            CollectionsView(viewModel: collectionsViewModel)
        }
    }
}
