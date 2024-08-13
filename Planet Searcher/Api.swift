import Foundation

struct Planet: Codable, Identifiable {
    let id = UUID()
    var name: String
    var mass: Double
    var radius: Double
    var period: Double
    var semi_major_axis: Double
    var temperature: Int
    var distance_light_year: Double


}

class Api : ObservableObject{
    @Published var planets = [Planet]()
    
    func loadData(name: String, completion:@escaping ([Planet]) -> ()) {
        let name = name.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        let url = URL(string: "https://api.api-ninjas.com/v1/planets?name="+name!)!
        var request = URLRequest(url: url)
        request.setValue("WgWdV8OYu7mHHU3UCyvUjQ==VviX4eTiB5oSaz39", forHTTPHeaderField: "X-Api-Key")
        URLSession.shared.dataTask(with: request) { data, response, error in
            let planets = try! JSONDecoder().decode([Planet].self, from: data!)
            print(planets)
            DispatchQueue.main.async {
                completion(planets)
            }
        }.resume()
    }
}
