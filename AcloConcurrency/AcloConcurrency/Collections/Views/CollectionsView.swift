import SwiftUI

struct CollectionsView: View {

    @ObservedObject private var viewModel: CollectionsViewModel

    init(viewModel: CollectionsViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationView{
            ZStack {
                List {
                    ForEach(viewModel.drinks) { drink in
                        Text(drink.name)
                    }
                }

                LoaderView(isActive: .constant(viewModel.didFetchingDrinks))
            }
            .onAppear {
                viewModel.getPopularCocktails()
            }
        }
    }
}
