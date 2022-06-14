import Foundation

public protocol ListServiceable {
    func getMostLatestCocktails() async -> Result<[Drink], RequestError>
    func getPopularCocktails() async -> Result<[Drink], RequestError>
}

public struct ListService: HTTPClient, ListServiceable {

    public func getPopularCocktails() async -> Result<[Drink], RequestError> {
        await sendRequest(
            endpoint: ListEndpoints.popularCocktails,
            responseModel: DrinksEntity.self
        ).map(\.drinks)
    }

    public func getMostLatestCocktails() async -> Result<[Drink], RequestError> {
        await sendRequest(
            endpoint: ListEndpoints.latestCocktails,
            responseModel: DrinksEntity.self
        ).map(\.drinks)
    }
}

private struct DrinksEntity: Decodable {
    let drinks: [Drink]
}
