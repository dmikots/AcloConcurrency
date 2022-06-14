import Foundation

public protocol FilterServiceable {
    func getCocktailsByIngredient(_ ingredient: Ingredient) async -> Result<[Drink], RequestError>
}

public struct FilterService: HTTPClient, FilterServiceable {

    public func getCocktailsByIngredient(
        _ ingredient: Ingredient
    ) async -> Result<[Drink], RequestError> {
        await sendRequest(
            endpoint: FilterEndpoints.ingredient(ingredient),
            responseModel: DrinksEntity.self
        ).map(\.drinks)
    }
}

private struct DrinksEntity: Decodable {
    let drinks: [Drink]
}
