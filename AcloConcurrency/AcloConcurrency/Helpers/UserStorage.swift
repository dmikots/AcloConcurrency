import SwiftUI
public class UserStorage: ObservableObject{
    @AppStorage("places") var places: [PlaceModel] = [PlaceModel.mock]
    func saveNewPlace(_ newPlace: PlaceModel)  {
        places.append(newPlace)
        }
    }
