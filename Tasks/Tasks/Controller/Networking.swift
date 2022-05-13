import Foundation
import FirebaseFirestore
import Firebase
import UIKit


struct Networking{
    private var db = Firestore.firestore()
    static func getUserInfo() {
        
    }
    
//    let baseURLString = "https://retro.umoiq.com/service/publicJSONFeed?"
//
//    func fetchRoutes (callback: @escaping ([Route]) -> ()){
//        // This would lock user interactions, we want to do this on the background queue
//        // We can use the global queue for this.
//        guard let url = URL(string: "\(baseURLString)command=routeList&a=sf-muni") else {
//            return
//        }
//        //Request with trailing closure
//        let task = URLSession.shared.dataTask(with: url) { maybeData, maybeResponse, mayberError in
//            guard let data: Data = maybeData else{
//                return
//            }
//
////            let dictionary = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
////            print(String (data: data, encoding: .utf8))
//            let decoder = JSONDecoder()
//            do {
//                let response = try decoder.decode(RoutesResponse.self, from: data)
//                let routes: [Route] = response.route
//                callback(routes)
//            } catch{
//                print(error)
//            }
//        }
//        task.resume()
//    }
//
//    // New and fancy way of making requests
//    func fetchRouteConfig(routeTag: String) async throws -> RouteConfig{ // Asynch function that can throw an error
//        let url = URL(string: "\(baseURLString)command=routeConfig&a=sf-muni&r=\(routeTag)")!
//        let (data, _) = try await URLSession.shared.data(from: url)
//        let decoder = JSONDecoder()
//        return try decoder.decode(RouteConfig.self, from: data)
//    }
}
