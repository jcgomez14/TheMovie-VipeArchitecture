
import Foundation
import UIKit

class ListOfMoviesRouter {
    func showListOfMovies(window: UIWindow?) {
        let interactor = ListOfMoviesInteractorMock()
        let presenter = ListOfMoviesPresenter(listOfMovieInteractor: interactor)
        let view = ListOfMoviesView(presenter: presenter)
        presenter.ui = view
        
        window?.rootViewController = view
        window?.makeKeyAndVisible()
    }
}
