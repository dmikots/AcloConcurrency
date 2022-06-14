import SwiftUI

@main
struct AcloConcurrencyApp: App {

    @StateObject private var collectionsViewModel: CollectionsViewModel

    init() {
        let filterService = FilterService()
        _collectionsViewModel = StateObject(
            wrappedValue: CollectionsViewModel(filterService: filterService)
        )
    }

    var body: some Scene {
        WindowGroup {
            CollectionsView(viewModel: collectionsViewModel)
        }
    }
}
