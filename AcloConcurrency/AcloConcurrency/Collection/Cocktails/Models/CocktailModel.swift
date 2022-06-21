import Foundation

struct CocktailModel: Identifiable, Codable {

    let id: String
    let name: String
    let image: String

    init(
        id: String,
        name: String,
        image: String
    )
    {
        self.id = id
        self.name = name
        self.image = image
    }
}

extension CocktailModel {
    static var mock = CocktailModel(
        id: "32",
        name: "b52",
        image: """
https://www.yummytemple.com/wp-content
/uploads/2022/04/Strong-B-52-Shot-Cocktail
-with-coffee-liqueur-cream-liqueur-and-triple
-sec-2.jpg
"""
    )
}
