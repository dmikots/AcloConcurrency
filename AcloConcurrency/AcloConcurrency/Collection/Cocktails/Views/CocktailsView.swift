import SwiftUI

struct CocktailsView: View {

    private let ingredientName: String

    @StateObject private var cocktailsViewModel: CocktailsViewModel
    @State private var navigateToDescription = false
    @State private var cocktailName: String = ""
    @State private var cocktailImage: String = ""

    init(ingredientName: String){
        self.ingredientName = ingredientName
        _cocktailsViewModel = StateObject(
            wrappedValue: CocktailsViewModel(filterService: FilterService())
        )
    }

    var body: some View {
        ScrollView{
            HStack{
                LazyVGrid(columns: [GridItem(), GridItem()], spacing: 18) {
                    ForEach(cocktailsViewModel.cocktails){ cocktail in
                        CocktailViewCell(cocktail: cocktail)
                            .onTapGesture {
                                navigateToDescription = true
                                cocktailName = cocktail.name
                                cocktailImage = cocktail.image
                            }
                    }
                }
            }
            NavigationLink(isActive: $navigateToDescription) {
                CocktailDescriptionView(image: cocktailImage, name: cocktailName)
            } label: {
                EmptyView()
                    .frame(height: 1)
            }
        }
        .navigationTitle(ingredientName)
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            cocktailsViewModel.getPopularCocktails(ingredientName)
        }
    }
}

struct CocktailsView_Previews: PreviewProvider {
    static var previews: some View {
        CocktailsView(ingredientName: "vodka")
    }
}
