
import UIKit

class CoordinationListViewController: UIViewController {

    @IBOutlet var coordinatesTableView: UITableView!
    var presenter: CoordinationListPresenter?
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    
        coordinatesTableView.tableFooterView = UIView()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func addCoordinatesButton(_ sender: Any) {
        presenter?.addNewCoordination()
    }
}

extension CoordinationListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let data: DefaultCellData = presenter?.getTableData(row: indexPath.row, section: indexPath.section),
            let cell = tableView.dequeueReusableCell(withIdentifier: data.getIdentifier()) as? DefaultCellProtocol
            else { return UITableViewCell() }
        
        cell.setData(data: data)
        return cell as? UITableViewCell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRowsInSection(section: section) ?? 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didSelectRow(row: indexPath.row, section: indexPath.section)
    }
    
}

extension CoordinationListViewController: CoordinationListView {
    func openDialog() {
            
    }
    
    func reloadScreen() {
        coordinatesTableView.reloadData()
    }
    
    
}

