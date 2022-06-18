import SwiftUI

struct CocktailsView: View {

    private let ingredientName: String

    @ObservedObject private var cocktailsViewModel =
    CocktailsViewModel(filterService: FilterService())

    init(ingredientName: String){
        self.ingredientName = ingredientName
    }

    var body: some View {
        NavigationView{
            ScrollView{
                HStack{
                    LazyVGrid(columns: [GridItem(), GridItem()], spacing: 18) {
                        ForEach(cocktailsViewModel.cocktails){ cocktail in
                            CocktailViewCell(cocktail: cocktail)
                        }
                    }
                }
            }
        }
        .navigationViewStyle(.stack)
        .navigationTitle(ingredientName)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            cocktailsViewModel.getPopularCocktails(ingredientName)
       }
    }
}

// struct CocktailsView_Previews: PreviewProvider {
//    static var previews: some View {
//        CocktailsView(cocktails: [CocktailModel.mock, CocktailModel.mock, CocktailModel.mock], ingredientName: "Vodka")
//    }
// }
