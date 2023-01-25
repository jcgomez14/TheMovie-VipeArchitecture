
import Foundation

protocol ListOfMoviesUIProtocol: AnyObject {
    func update(movies: [MovieViewCellModel])
}

class ListOfMoviesPresenter {
    
    var ui: ListOfMoviesUIProtocol?
    
    private let listOfMovieInteractor: ListOfMoviesInteractorProtocol
    var movieViewCellModel: [MovieViewCellModel] = []
    private let mapper: Mapper
    
    init(listOfMovieInteractor: ListOfMoviesInteractorProtocol, mapper: Mapper = Mapper()) {
        self.listOfMovieInteractor = listOfMovieInteractor
        self.mapper = mapper
    }
    
    func onViewAppear() {
        Task {
            let models = await listOfMovieInteractor.getListOfMovies().results
            movieViewCellModel = models.map(mapper.map(entity:))
            
            ui?.update(movies: movieViewCellModel)
            
        }
    }
}
