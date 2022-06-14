protocol Endpoint {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var header: [String: String]? { get }
    var body: [String: String]? { get }
}

extension Endpoint {

    var baseURL: String {
        return "https://www.thecocktaildb.com/api/json/v1/1/"
    }
}
