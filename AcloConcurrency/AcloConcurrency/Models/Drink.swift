public struct Drink: Codable, Hashable, Identifiable {

    enum CodingKeys: String, CodingKey {
        case id = "idDrink"
        case name = "strDrink"
        case image = "strDrinkThumb"
    }

    public let id: String
    public let name: String
    public let image: String
}
