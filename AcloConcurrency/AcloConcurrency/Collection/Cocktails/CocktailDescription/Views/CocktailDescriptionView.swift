import SwiftUI

struct CocktailDescriptionView: View {
    let image: String
    let name: String
    var body: some View {
        VStack{
            // Image
            ZStack(alignment: .bottomLeading){
                AsyncImage(
                    url: URL(string: image),
                    content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                    },
                    placeholder: {
                        ProgressView()
                    }
                )
                Text(name)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading)
                    .background(Color.black
                        .blur(radius: 8))
                    .padding(.vertical)
            }
            .cornerRadius(16)
            .overlay(
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.gray, lineWidth: 2)
                    )
            .padding(.horizontal, 16)
            Spacer()
        }
        .frame(maxWidth: .infinity, alignment: .top)
    }
}

struct CocktailDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        CocktailDescriptionView(image: "https://www.yummytemple.com/wp-content/uploads/2022/04/Strong-B-52-Shot-Cocktail-with-coffee-liqueur-cream-liqueur-and-triple-sec-2.jpg", name: "12321")
    }
}
