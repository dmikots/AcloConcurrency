import SwiftUI

struct CollectionView: View {

    @ObservedObject private var collectionModel: CollectionViewModel
    @State private var activeNavigation = false
    @State private var ingredientName: String = ""

    init(collectionModel: CollectionViewModel){
        self.collectionModel = collectionModel
    }

    var body: some View {
        NavigationView{
            ScrollView(.vertical, showsIndicators: false) {
                HStack(spacing: 18){
                    LazyVGrid(columns: [GridItem(.flexible())], spacing: 18) {
                        ForEach(collectionModel.places.indices){ index in
                            CollectionCellView(
                                numberInRow: index,
                                imageURL: collectionModel.places[index].ingredientImage,
                                ingredientName: collectionModel.places[index].ingredientName
                            )
                            .onTapGesture {
                                ingredientName = collectionModel.places[index].ingredientName
                                activeNavigation  = true
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .top)
                    LazyVGrid(columns: [GridItem(.flexible())], spacing: 18) {
                        ForEach(collectionModel.places.indices){ index in
                            CollectionCellView(
                                numberInRow: index + 1,
                                imageURL: collectionModel.places[index].ingredientImage,
                                ingredientName: collectionModel.places[index].ingredientName
                            )
                            .onTapGesture {
                                ingredientName = collectionModel.places[index].ingredientName
                                activeNavigation  = true
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .top)
                }
                .padding(.horizontal, 16)
                .navigate(
                    to: CocktailsView(ingredientName: ingredientName),
                          when: $activeNavigation
                )
            }
            .navigationTitle("Collections")
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(.stack)
    }
}

struct SharingView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionView(collectionModel: CollectionViewModel())
    }
}
