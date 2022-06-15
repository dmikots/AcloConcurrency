import SwiftUI

struct AddCustomCollectionSheet: View {
    @ObservedObject private var placeModel: PlacesViewModel
    init(placeModel: PlacesViewModel) {
        self.placeModel = placeModel
    }
    @State private var name: String = ""
    @State private var description: String = ""
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack(spacing: 20){
            TextField("name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("description", text: $description)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button(action: {
                placeModel.savePlace(PlaceModel(id: UUID(), name: name, description: description, image: ""))
                presentationMode.wrappedValue.dismiss()
            }) {
                Text("Save")
                    .foregroundColor(.white)
                    .padding(5)
                    .background(.pink)
                    .cornerRadius(8)
            }
        }
        .padding(.horizontal)
    }
}

struct AddCustomCollectionSheet_Previews: PreviewProvider {
    static var previews: some View {
        AddCustomCollectionSheet(placeModel: PlacesViewModel(userStorage: UserStorage()))
    }
}
