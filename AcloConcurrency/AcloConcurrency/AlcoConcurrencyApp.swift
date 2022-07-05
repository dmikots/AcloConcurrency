import SwiftUI

@main
struct AlcoConcurrencyApp: App {

    @StateObject private var placesViewModel: PlacesViewModel
    @StateObject private var collectionViewModel: CollectionViewModel

    init() {
        let userStorage = UserStorage()
        _placesViewModel = StateObject(wrappedValue: PlacesViewModel(userStorage: userStorage))
        _collectionViewModel = StateObject(wrappedValue: CollectionViewModel())
    }

    var body: some Scene {
        WindowGroup {
            TabView{
                PlacesView(placeModel: placesViewModel)
                    .tabItem {
                        Label("My Places", systemImage: "heart.fill")
                    }
                CollectionView(collectionModel: collectionViewModel)
                    .tabItem {
                        Label("Collection", systemImage: "message.and.waveform.fill")
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
