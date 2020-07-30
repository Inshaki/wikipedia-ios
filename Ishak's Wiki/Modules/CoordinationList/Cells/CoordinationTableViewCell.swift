//~~~**DELETE THIS HEADER**~~~

import UIKit

class CoordinationTableViewCell: UITableViewCell {
        
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var locationLabel: UILabel!
}

extension CoordinationTableViewCell: DefaultCellProtocol {
    func setData(data: DefaultCellData?) {
        guard let data = data as? CoordinationCellData else { return }
        nameLabel.text = data.name
        locationLabel.text = data.location
    }
}

