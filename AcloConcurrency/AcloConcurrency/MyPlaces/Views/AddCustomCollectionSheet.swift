import SwiftUI

struct AddCustomCollectionSheet: View {

    @Environment(\.presentationMode) var presentationMode

    @State private var name: String = ""
    @State private var description: String = ""

    private let savePlace: (_ place: PlaceModel) -> Void

    init(savePlace: @escaping (_ place: PlaceModel) -> Void) {
        self.savePlace = savePlace
    }

    var body: some View {
        VStack(spacing: 20){
            TextField("name", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("description", text: $description)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button(action: {
                savePlace(PlaceModel(id: UUID(), name: name, description: description))
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
        AddCustomCollectionSheet { _ in
        }
    }
}
