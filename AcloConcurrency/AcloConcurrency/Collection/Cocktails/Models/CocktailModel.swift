import Foundation

struct CocktailModel: Identifiable, Codable {
    let id: UUID
    let cocktailName: String
    let cocktailImage: String
    let idDrink: String

    init(
        cocktailName: String,
        cocktailImage: String,
        idDrink: String
    )
    {
        self.id = UUID()
        self.cocktailName = cocktailName
        self.cocktailImage = cocktailImage
        self.idDrink = idDrink
    }
}
// swiftlint:disable all
extension CocktailModel {
    static var mock = CocktailModel(cocktailName: "b52", cocktailImage: "https://www.yummytemple.com/wp-content/uploads/2022/04/Strong-B-52-Shot-Cocktail-with-coffee-liqueur-cream-liqueur-and-triple-sec-2.jpg", idDrink: "23")

}
