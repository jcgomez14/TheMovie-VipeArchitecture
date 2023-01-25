
import Foundation
import UIKit

class ListOfMoviesView: UIViewController {
   private let presenter: ListOfMoviesPresenter
    
    private var moviesTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.estimatedRowHeight = 120
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(MovieCellView.self, forCellReuseIdentifier: "MovieCellView")
        return tableView
    }()
    

    init(presenter: ListOfMoviesPresenter) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.onViewAppear()
        setupTableView()
    }
    
    
    func setupTableView() {
        view.addSubview(moviesTableView)
        NSLayoutConstraint.activate([
            moviesTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            moviesTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            moviesTableView.topAnchor.constraint(equalTo: view.topAnchor),
            moviesTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    
        moviesTableView.dataSource = self
     //   moviesTableView.delegate = self
    }
    
}


extension ListOfMoviesView: ListOfMoviesUIProtocol {
    func update(movies: [MovieViewCellModel]) {
        print("Movies", movies)
        DispatchQueue.main.async {
            self.moviesTableView.reloadData()
        }
    }
}


extension ListOfMoviesView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        presenter.movieViewCellModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCellView", for: indexPath) as! MovieCellView
        let model = (presenter.movieViewCellModel[indexPath.row])
        cell.configure(model: model)
        return cell
        
        
        
    }
    
    
}
