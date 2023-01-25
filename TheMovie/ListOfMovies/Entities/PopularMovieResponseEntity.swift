
import Foundation

//MARK: Array-model results api call

struct PopularMovieResponseEntity: Decodable {
    let results: [PopularMovieEntity]
}
