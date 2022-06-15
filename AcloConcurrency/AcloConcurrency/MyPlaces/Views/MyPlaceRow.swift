import SwiftUI

struct MyPlaceRow: View {
    private var place: PlaceModel

    init(place: PlaceModel){
        self.place = place
    }

    var body: some View {
        HStack{
            VStack{
                Text(place.name)
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(place.description)
                    .foregroundColor(.gray)
                    .font(.callout)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.leading)
            Spacer()
            AsyncImage(
                url: URL(string: place.image),
                content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: 70, maxHeight: 70)
                        .clipShape(Circle())
                },
                placeholder: {
                    ProgressView()
                }
            )
            .padding()
        }
        .background(.white)
        .cornerRadius(8)
        .padding(.horizontal)
        .shadow(radius: 8)
    }
}

struct MyPlaceRow_Previews: PreviewProvider {
    static var previews: some View {
        MyPlaceRow(place: PlaceModel.mock)
    }
}
