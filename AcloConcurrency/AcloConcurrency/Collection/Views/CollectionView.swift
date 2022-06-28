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
                        ForEach(collectionModel.mockArray.indices){ index in
                            CollectionCellView(
                                numberInRow: index,
                                imageURL: collectionModel.mockArray[index].ingredientImage,
                                ingredientName: collectionModel.mockArray[index].ingredientName
                            )
                            .onTapGesture {
                               ingredientName = collectionModel.mockArray[index].ingredientName
                                activeNavigation  = true
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .top)
                    LazyVGrid(columns: [GridItem(.flexible())], spacing: 18) {
                        ForEach(collectionModel.mockArray.indices){ index in
                            CollectionCellView(
                                numberInRow: index + 1,
                                imageURL: collectionModel.mockArray[index].ingredientImage,
                                ingredientName: collectionModel.mockArray[index].ingredientName
                            )
                            .onTapGesture {
                                ingredientName = collectionModel.mockArray[index].ingredientName
                                activeNavigation  = true
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .top)
                }
                .padding(.horizontal, 16)
                NavigationLink(isActive: $activeNavigation) {
                    CocktailsView(ingredientName: ingredientName)
                } label: {
                    EmptyView()
                        .frame(height: 1)
                }
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
