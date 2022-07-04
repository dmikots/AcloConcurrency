import SwiftUI

struct CocktailDescriptionView: View {

    private let image: String
    private let name: String

    init(image: String, name: String){
        self.image = image
        self.name = name
    }

    var body: some View {
        VStack(spacing: 24){
            // Image
            createImage(image: image, name: name)
            ScrollView{
                VStack(spacing: 16){
                    VStack(spacing: 8){
                        Text("Cocktail")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        VStack(spacing: 8){
                            HStack{
                                Text("Glass")
                                Spacer()
                                Text("Flute")
                            }
                            .padding(.horizontal, 8)
                        }
                        .frame(maxWidth: .infinity)
                        .background(Color.gray.opacity(0.7))
                        .cornerRadius(16)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.gray, lineWidth: 2)
                        )
                    }
                    .padding(.horizontal, 17)
                    VStack(spacing: 8){
                        Text("Ingredients")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        VStack{
                            HStack{
                                Text("Glass")
                                Spacer()
                                Text("Flute")
                            }
                            .padding(.horizontal, 8)
                        }
                        .frame(maxWidth: .infinity)
                        .background(Color.gray.opacity(0.7))
                        .cornerRadius(16)
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.gray, lineWidth: 1)
                        )
                    }
                    .padding(.horizontal, 17)
                }
            }
        }
        .frame(maxWidth: .infinity, alignment: .top)
        .navigationTitle(name)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {

                    // add to favorite
                }) {
                    Image(systemName: "star")
                        .font(.headline)
                        .foregroundColor(.pink)
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button(action: {
                    // share to friends
                }) {
                    Image(systemName: "square.and.arrow.up")
                        .font(.headline)
                        .foregroundColor(.pink)
                }
            }
        }
    }
}

@ViewBuilder private func createImage(image: String, name: String) -> some View {
    ZStack(alignment: .bottomLeading){
        AsyncImage(
            url: URL(string: image),
            content: { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
            },
            placeholder: {
                ProgressView()
            }
        )
        Text(name)
            .font(.largeTitle)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading)
            .background(
                Color.black
                .blur(radius: 8)
            )
            .padding(.vertical)
    }
    .cornerRadius(16)
    .overlay(
        RoundedRectangle(cornerRadius: 16)
            .stroke(Color.gray, lineWidth: 1)
    )
    .padding(.horizontal, 16)
}

struct CocktailDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        CocktailDescriptionView(
            image:
                """
https://www.yummytemple.com/wp-content/uploads/2022/04/Strong-B-52-Shot-Cocktail-
with-coffee-liqueur-cream-liqueur-and-triple-sec-2.jpg
""",
            name: "12321"
        )
    }
}
