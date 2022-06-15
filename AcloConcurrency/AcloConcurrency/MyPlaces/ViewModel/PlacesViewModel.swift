import Combine

public class PlacesViewModel: ObservableObject {
    
    @Published private(set) var places: [PlaceModel] = []
    
    private let userStorage: UserStorage
    
    public init(userStorage: UserStorage) {
        self.userStorage = userStorage
    }
    @MainActor
    func getPlaces() {
        Task{
            self.places = userStorage.places
        }
    }
    @MainActor func savePlace(_ place: PlaceModel) {
        Task{
            userStorage.saveNewPlace(place)
        }
        getPlaces()
    }
}
