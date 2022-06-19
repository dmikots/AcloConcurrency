import SwiftUI

struct CocktailViewCell: View {

    let cocktail: CocktailModel

    var body: some View {
        ZStack(alignment: .bottomLeading){
            AsyncImage(
                url: URL(string: cocktail.cocktailImage),
                content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: 170, maxHeight: 170)
                },
                placeholder: {
                    ProgressView()
                }
            )
            Text(cocktail.cocktailName)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading)
                .background(Color.black
                    .blur(radius: 8))
                .padding(.vertical)
        }
        .frame(width: 170, height: 170)
        .cornerRadius(20)
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.gray, lineWidth: 1)
        )
    }
}

struct CocktailViewCell_Previews: PreviewProvider {
    static var previews: some View {
        CocktailViewCell(cocktail: CocktailModel.mock)
    }
}
