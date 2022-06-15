import SwiftUI

@main
struct AlcoConcurrencyApp: App {
    
    @StateObject private var collectionsViewModel: CollectionsViewModel
    
    init() {
        let filterService = FilterService()
        _collectionsViewModel = StateObject(
            wrappedValue: CollectionsViewModel(filterService: filterService)
        )
    }
    
    var body: some Scene {
        WindowGroup {
            TabView{
                CollectionsView(viewModel: collectionsViewModel)
                    .tabItem {
                        Label("Collections", systemImage: "heart.fill")
                    }
                SharingView()
                    .tabItem {
                        Label("Sharing", systemImage: "message.and.waveform.fill")
                    }
                SearchView()
                    .tabItem {
                        Label("Sharing", systemImage: "rectangle.and.text.magnifyingglass")
                    }
            }
            .accentColor(.pink)
        }
    }
}
