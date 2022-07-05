import Foundation

enum FilterEndpoints {
    case ingredient(name: String)
}

extension FilterEndpoints: Endpoint {

    var path: String {
        switch self {
        case let .ingredient(ingredient):
            return "filter.php?i=\(ingredient)"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .ingredient:
            return .get
        }
    }

    var header: [String: String]? {
        switch self {
        case .ingredient:
            return nil
        }
    }

    var body: [String: String]? {
        switch self {
        case .ingredient:
            return nil
        }
    }
}
