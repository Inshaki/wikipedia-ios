
import UIKit

class CoordinationListViewController: UIViewController {

    @IBOutlet var coordinatesTableView: UITableView!
    var presenter: CoordinationListPresenter?
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    
        coordinatesTableView.tableFooterView = UIView()
        // Do any additional setup after loading the view.
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(pulledToRefresh), for: .valueChanged)
        coordinatesTableView.refreshControl = refreshControl
    }
    
    @objc private func pulledToRefresh() {
        presenter?.refreshDetail()
    }

    
    @IBAction func addCoordinatesButton(_ sender: Any) {
        presenter?.addNewCoordination()
    }
}

extension CoordinationListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let data: DefaultCellData = presenter?.getTableData(row: indexPath.row, section: indexPath.section),
            let cell = tableView.dequeueReusableCell(withIdentifier: data.getIdentifier()) as? (UITableViewCell & DefaultCellProtocol)
            else { return UITableViewCell() }
        
        cell.setData(data: data)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRowsInSection(section: section) ?? 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectRow(row: indexPath.row, section: indexPath.section)
    }
    
}

extension CoordinationListViewController: CoordinationListView {
    func reloadScreen() {
        coordinatesTableView.refreshControl?.endRefreshing()
        coordinatesTableView.reloadData()
    }
    
    
}

