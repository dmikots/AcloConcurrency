import SwiftUI

struct AddCustomCollectionSheet: View {

    @Environment(\.presentationMode) private var presentationMode

    private let savePlace: (_ place: PlaceModel) -> Void
    @State private var name: String = ""
    @State private var description: String = ""

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
                savePlace(PlaceModel(name: name, description: description, id: UUID()))
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
