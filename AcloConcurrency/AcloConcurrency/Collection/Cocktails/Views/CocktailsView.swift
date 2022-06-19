import SwiftUI

struct CocktailsView: View {

    private let ingredientName: String

    @ObservedObject private var cocktailsViewModel =
    CocktailsViewModel(filterService: FilterService())
    @State private var navigateToDescription = false
    @State private var cocktailName: String = ""
    @State private var cocktailImage: String = ""

    init(ingredientName: String){
        self.ingredientName = ingredientName
    }

    var body: some View {
            ScrollView{
                HStack{
                    LazyVGrid(columns: [GridItem(), GridItem()], spacing: 18) {
                        ForEach(cocktailsViewModel.cocktails){ cocktail in
                            CocktailViewCell(cocktail: cocktail)
                                .onTapGesture {
                                    navigateToDescription = true
                                    cocktailName = cocktail.cocktailName
                                    cocktailImage = cocktail.cocktailImage
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
        .navigationViewStyle(.stack)
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
