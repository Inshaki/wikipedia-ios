//~~~**DELETE THIS HEADER**~~~

import Foundation
protocol DefaultCellProtocol {
    func setData(data: DefaultCellData?)
}

protocol DefaultCellData {
    func getIdentifier() -> String
}
