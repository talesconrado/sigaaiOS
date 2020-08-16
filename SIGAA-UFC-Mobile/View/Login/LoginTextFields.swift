import UIKit

class LoginTextFields: UITextField {

    let padding = UIEdgeInsets(top: 15, left: 50, bottom: 15, right: 0)

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(x: 10, y: 0, width: 30, height: self.frame.height)
    }
    
    func invalidInput() {
        layer.borderColor = UIColor.red.cgColor
    }
    
    func validInput() {
        layer.borderColor = UIColor.darkGray.cgColor
    }

}
