import Foundation

struct PlaceModel: Identifiable, Codable {
    let id: UUID
    let name: String
    let description: String
    let image: String

    init( name: String, description: String){
        self.id = UUID()
        self.name = name
        self.description = description
        self.image =
            """
            https://img.restoclub.ru/uploads/place
            /c/6/7/0/c670f
            3405f20b2c8513908b467548849_w958_h835--big.jpg
            """
    }
}

extension PlaceModel {
    static var mock = PlaceModel(name: "my bar", description: "description")
}
