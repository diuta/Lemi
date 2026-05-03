import Foundation

class RecipeService {

    static func decodeRecipes(from jsonData: Data) -> [RecipeModel] {
        let decoder = JSONDecoder()

        decoder.keyDecodingStrategy = .convertFromSnakeCase

        do {
            let recipes = try decoder.decode([RecipeModel].self, from: jsonData)
            return recipes
        } catch {
            print("Failed to decode JSON: \(error)")
            return []
        }
    }
}
