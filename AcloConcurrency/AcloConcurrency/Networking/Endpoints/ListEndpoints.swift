import Foundation

enum ListEndpoints {
    case latestCocktails
    case popularCocktails
}

extension ListEndpoints: Endpoint {

    var path: String {
        switch self {
        case .latestCocktails:
            return "latest.php"
        case .popularCocktails:
            return "popular.php"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .latestCocktails, .popularCocktails:
            return .get
        }
    }

    var header: [String: String]? {
        let accessToken = "c09ba6fd47msh410923876a79afap14a540jsnfc3f6e79749f"
        switch self {
        case .latestCocktails, .popularCocktails:
            return [
                "X-RapidAPI-Key": accessToken,
                "X-RapidAPI-Host": "the-cocktail-db.p.rapidapi.com"
            ]
        }
    }

    var body: [String: String]? {
        switch self {
        case .latestCocktails, .popularCocktails:
            return nil
        }
    }
}
