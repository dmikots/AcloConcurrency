import Foundation

struct PlaceModel: Identifiable, Codable {
    let name: String
    let description: String
    var id = UUID()
    var image: String =
"https://img.restoclub.ru/uploads/place/c/6/7/0/c670f3405f20b2c8513908b467548849_w958_h835--big.jpg"
}

extension PlaceModel {
    static var mock = PlaceModel(name: "my bar", description: "my favoriteBar")
}
