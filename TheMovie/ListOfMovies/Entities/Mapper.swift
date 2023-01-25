
import Foundation

struct Mapper {
    func map(entity: PopularMovieEntity) -> MovieViewCellModel {
        MovieViewCellModel(title: entity.title, overview: entity.overview, imageURL: URL(string:"https://image.tmdb.org/t/p/w200/" + entity.imageURL))
    }
}
