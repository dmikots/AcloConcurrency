import Foundation

public protocol FilterServiceable {

    func getCocktailsByIngredient(_ ingredient: String) async -> Result<[Drink], RequestError>
}

public struct FilterService: HTTPClient, FilterServiceable {

    public func getCocktailsByIngredient(
        _ ingredient: String
    ) async -> Result<[Drink], RequestError> {
        await sendRequest(
            endpoint: FilterEndpoints.ingredient(name: ingredient),
            responseModel: DrinksEntity.self
        ).map(\.drinks)
    }
}

private struct DrinksEntity: Decodable {
    let drinks: [Drink]
}
