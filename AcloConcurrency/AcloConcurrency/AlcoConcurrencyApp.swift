import SwiftUI

@main
struct AlcoConcurrencyApp: App {

    @StateObject private var placesViewModel: PlacesViewModel

    init() {
        let userStorage = UserStorage()
        _placesViewModel = StateObject(wrappedValue: PlacesViewModel(userStorage: userStorage))
    }

    var body: some Scene {
        WindowGroup {
            TabView{
                PlacesView(placeModel: placesViewModel)
                    .tabItem {
                        Label("My Places", systemImage: "heart.fill")
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
