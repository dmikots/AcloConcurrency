import Combine

public class CollectionViewModel: ObservableObject {

    @Published private(set) var places: [CollectionModel] = []
}
// swiftlint:disable all
extension CollectionViewModel {
    static var placesMock =
    [
        CollectionModel(
            ingredientName: "martini",
            ingredientImage:
                "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b3/Marini_IMG_0024.JPG/274px-Marini_IMG_0024.JPG", cocktails: [CocktailModel.mock]
        ),
        CollectionModel(
            ingredientName:
                "prosecco",
            ingredientImage:
                "https://s.wine.style/images_gen/170/170138/0_0_orig.jpg", cocktails: [CocktailModel.mock]
        ),
        CollectionModel(
            ingredientName: "beer",
            ingredientImage:
                "https://mosbrew.ru/media/brand_images/w1000_square/2021-09-27_16-04-17__6bccc02a-1f93-11ec-bc49-525400531e2e.jpg", cocktails: [CocktailModel.mock]
        ),
        CollectionModel(
            ingredientName: "gin",
            ingredientImage:
                "https://l-wine.ru/upload/resize_cache/iblock/e2f/800_900_0/e2ff7533fb9fd8c8c28895b6d1047737.png", cocktails: [CocktailModel.mock]
        )
    ]
}
