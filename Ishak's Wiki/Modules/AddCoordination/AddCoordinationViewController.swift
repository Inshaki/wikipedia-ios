//~~~**DELETE THIS HEADER**~~~

import UIKit
class AddCoordinationViewController: UIViewController {
    var presenter: AddCoordinationPresenter?
    
    @IBOutlet var saveButton: UIButton!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var latTextField: UITextField!
    @IBOutlet var lonTextField: UITextField!
    
    @IBOutlet var thumbsUp: UIImageView!
    
    override func viewDidLoad() {
        setViews()
    }
    @IBAction func onCancelPressed(_ sender: Any) {
        presenter?.onCancelPressed()
    }
    
    
    @IBAction func onSaveButtonPressed(_ sender: Any) {
        
        presenter?.onSavePressed(name: nameTextField.text, lat: latTextField.text, lon: lonTextField.text)
    }
    @IBAction func onNameChange(_ sender: Any) {
        presenter?.onNameChanged(name: nameTextField.text)
    }
    @IBAction func onLatChange(_ sender: Any) {
        presenter?.onLatChanged(lat: latTextField.text)
    }
    @IBAction func onLonChange(_ sender: Any) {
        presenter?.onLonChanged(lon: lonTextField.text)
    }

    func setViews() {
        saveButton.layer.cornerRadius = 10
        saveButton.layer.borderWidth = 1
        saveButton.layer.borderColor = UIColor.link.cgColor
    }
    
    func showTextFieldErrorBorder(textField: UITextField, show: Bool) {
        textField.layer.borderColor = UIColor.red.cgColor //your color
        textField.layer.borderWidth = show ? 2.0 : 0.0
    }
}

extension AddCoordinationViewController: AddCoordinationView {
    func latitudeValidation(hasSucces: Bool) {
        showTextFieldErrorBorder(textField: latTextField, show: !hasSucces)
    }
    
    func nameValidation(hasSucces: Bool) {
        showTextFieldErrorBorder(textField: nameTextField, show: !hasSucces)
    }
    
    func longitudeValidation(hasSucces: Bool) {
        showTextFieldErrorBorder(textField: lonTextField, show: !hasSucces)
    }
    
    func onSuccessScreen() {
       
        thumbsUp.isHidden = false
        latTextField.isEnabled = false
        lonTextField.isEnabled = false
        nameTextField.isEnabled = false
    }
    
    
}
