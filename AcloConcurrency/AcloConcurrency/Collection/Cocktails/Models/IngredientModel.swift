import Foundation

struct IngredientModel: Identifiable, Codable {
    let id: UUID
    let ingredientName: String
    let ingredientImage: String

    init(ingredientName: String, ingredientImage: String) {
        self.id = UUID()
        self.ingredientName = ingredientName
        self.ingredientImage = ingredientImage
    }
}

extension IngredientModel {
    static var mock = IngredientModel(
        ingredientName: "Kahlua",
        ingredientImage: "https://www.thecocktaildb.com/images/ingredients/Kahlua-Medium.png"
    )
}
