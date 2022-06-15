import SwiftUI

@main
struct AlcoConcurrencyApp: App {

    @StateObject private var place: PlacesViewModel
    init() {
        _place = StateObject(wrappedValue: PlacesViewModel(userStorage: UserStorage()))
    }

    var body: some Scene {
        WindowGroup {
            TabView{
                PlacesView(placeModel: place)
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
