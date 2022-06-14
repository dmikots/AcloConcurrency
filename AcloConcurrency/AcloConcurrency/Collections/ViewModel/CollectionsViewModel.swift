import Combine

public class CollectionsViewModel: ObservableObject {

    @Published private(set) var didFetchingDrinks = false
    @Published private(set) var drinks: [Drink] = []

    private let filterService: FilterServiceable

    public init(filterService: FilterServiceable) {
        self.filterService = filterService
    }

    func getPopularCocktails() {
        Task {
            await didStartFetchingDrinks()
            let result = await filterService.getCocktailsByIngredient(.vodka)
            switch result {
            case let .success(drinks):
                await getDrinks(drinks)
                await didEndFetchingDrinks()
            case let .failure(error):
                print("Error ==>", error)
                await didEndFetchingDrinks()
            }
        }
    }

    @MainActor
    private func getDrinks(_ drinks: [Drink]) {
        self.drinks = drinks
    }

    @MainActor
    private func didStartFetchingDrinks() {
        didFetchingDrinks = true
    }

    @MainActor
    private func didEndFetchingDrinks() {
        didFetchingDrinks = false
    }
}
