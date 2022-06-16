import Combine

public class PlacesViewModel: ObservableObject {

    @Published private(set) var places: [PlaceModel] = []

    private let userStorage: UserStorage

    public init(userStorage: UserStorage) {
        self.userStorage = userStorage
    }

    func getPlaces() {
       places = userStorage.getPlaces()
    }

    func savePlace(_ place: PlaceModel) {
        userStorage.saveNewPlace(place)
        getPlaces()
    }

}
