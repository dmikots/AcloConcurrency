import Foundation

struct CollectionModel: Identifiable, Codable {
    let id: UUID
    let ingredientName: String
    let ingredientImage: String
    var cocktails: [CocktailModel]

    init(ingredientName: String, ingredientImage: String, cocktails: [CocktailModel]){
        self.id = UUID()
        self.ingredientName = ingredientName
        self.ingredientImage = ingredientImage
        self.cocktails = cocktails
    }
}
// swiftlint:disable all
extension CollectionModel {
    static var mock = CollectionModel(ingredientName: "Vodka",
                                      ingredientImage: "https://images.absolutdrinks.com/ingredient-images/Raw/Absolut/65d43459-c926-4b12-a15b-afa7a71c2071.jpg?imwidth=500", cocktails: [CocktailModel.mock])
}
