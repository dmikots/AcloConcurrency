import SwiftUI

struct CollectionView: View {

    private let mockArray = CollectionViewModel.placesMock

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
                        ForEach(mockArray.indices){ index in
                            CollectionCellView(
                                numberInRow: index,
                                imageURL: mockArray[index].ingredientImage,
                                ingredientName: mockArray[index].ingredientName
                            )
                            .onTapGesture {
                               ingredientName = mockArray[index].ingredientName
                                activeNavigation  = true
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .top)
                    LazyVGrid(columns: [GridItem(.flexible())], spacing: 18) {
                        ForEach(mockArray.indices){ index in
                            CollectionCellView(
                                numberInRow: index + 1,
                                imageURL: mockArray[index].ingredientImage,
                                ingredientName: mockArray[index].ingredientName
                            )
                            .onTapGesture {
                                ingredientName = mockArray[index].ingredientName
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
        }
        .navigationViewStyle(.stack)
        .navigationTitle("Collections")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct SharingView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionView(collectionModel: CollectionViewModel())
    }
}
