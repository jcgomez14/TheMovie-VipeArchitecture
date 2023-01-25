
import Foundation

// 0605a33b8975c99883a5d898aa67667b
// /movie/popular

protocol ListOfMoviesInteractorProtocol: AnyObject {
    func getListOfMovies() async -> PopularMovieResponseEntity
}


class ListOfMoviesInteractor: ListOfMoviesInteractorProtocol {
    
    //MARK: API Call
    
    func getListOfMovies() async -> PopularMovieResponseEntity {
        let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=0605a33b8975c99883a5d898aa67667b")!
        
        let (data, _) = try! await URLSession.shared.data(from: url)
        return try! JSONDecoder().decode(PopularMovieResponseEntity.self, from: data)
    }
}
