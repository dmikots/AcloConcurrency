import Combine

public class CocktailsViewModel: ObservableObject {

    @Published private(set) var didFetchingDrinks = false
    @Published private(set) var drinks: [Drink] = []
    @Published private(set) var cocktails: [CocktailModel] = []

    private let filterService: FilterServiceable

    public init(filterService: FilterServiceable) {
        self.filterService = filterService
    }

    func getPopularCocktails(_ ingredientName: String) {
        Task {
            await didFetchingDrinks(true)
            let result = await filterService.getCocktailsByIngredient(ingredientName)
            switch result {
            case let .success(drinks):
                await getDrinks(drinks)
                await didFetchingDrinks(false)
            case let .failure(error):
                print("Error ==>", error)
                await didFetchingDrinks(false)
            }
        }
    }

    @MainActor
    private func getDrinks(_ drinks: [Drink]) {
        self.drinks = drinks
        _ = drinks.map { drink in
            cocktails.append(
                CocktailModel(
                    id: drink.id,
                    name: drink.name,
                    image: drink.image
                )
            )
        }
    }

    @MainActor
    private func didFetchingDrinks(_ value: Bool) {
        didFetchingDrinks = value
    }
}
