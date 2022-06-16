import SwiftUI

struct PlacesView: View {

    @ObservedObject private var placeModel: PlacesViewModel

    @State private var showingSheet = false

    init(placeModel: PlacesViewModel) {
        self.placeModel = placeModel
    }

    var body: some View {
        NavigationView{
            ZStack {
                List {
                    ForEach(placeModel.places) { place in
                        MyPlaceRow(place: place)
                    }
                    .listRowSeparator(Visibility.hidden)
                }
                .listStyle(.plain)
            }
            .navigationTitle("Places")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                  ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        showingSheet.toggle()
                    }) {
                      Image(systemName: "plus")
                            .font(.headline)
                            .foregroundColor(.pink)
                    }
                  }
            }
        }
        .onAppear{
            placeModel.getPlaces()
        }
        .navigationViewStyle(.stack)
        .sheet(isPresented: $showingSheet) {
            AddCustomCollectionSheet(savePlace: placeModel.savePlace)
        }
    }
}

struct PlacesView_Previews: PreviewProvider {
    static var previews: some View {
        PlacesView(placeModel: PlacesViewModel(userStorage: UserStorage()))
    }
}
