public struct Drink: Codable, Hashable, Identifiable {

    enum CodingKeys: String, CodingKey {
        case id = "idDrink"
        case name = "strDrink"
        case category = "strCategory"
        case alcoholic = "strAlcoholic"
    }

    public let id: String
    public let name: String
    public let category: String?
    public let alcoholic: String?
}
