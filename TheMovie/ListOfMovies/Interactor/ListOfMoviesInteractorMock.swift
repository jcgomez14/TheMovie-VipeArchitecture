
import Foundation

class ListOfMoviesInteractorMock: ListOfMoviesInteractorProtocol {
    func getListOfMovies() async -> PopularMovieResponseEntity {
        
        return PopularMovieResponseEntity(results: [
            .init(id: 0, title: "Mockup 0", overview: "Description 0", imageURL: "", votes: 0),
            .init(id: 1, title: "Mockup 1", overview: "Description 1", imageURL: "", votes: 1),
            .init(id: 2, title: "Mockup 2", overview: "Description 2", imageURL: "", votes: 2),
            .init(id: 3, title: "Mockup 3", overview: "Description 3", imageURL: "", votes: 3),
            .init(id: 4, title: "Mockup 4", overview: "Description 4", imageURL: "", votes: 4)
        ])
    }
    
    
}
