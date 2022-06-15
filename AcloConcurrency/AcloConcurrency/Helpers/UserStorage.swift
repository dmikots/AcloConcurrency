import SwiftUI
public class UserStorage: ObservableObject{

    @AppStorage("places") private var places: [PlaceModel] = [PlaceModel.mock]
    func saveNewPlace(_ newPlace: PlaceModel) {
        places.append(newPlace)
    }
    func getPlaces() -> [PlaceModel] {
        return places
    }
}
