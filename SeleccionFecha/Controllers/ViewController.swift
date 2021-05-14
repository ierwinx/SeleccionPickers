import UIKit

class ViewController: UIViewController {
    
    // MARK: Propiedades fecha
    @IBOutlet weak var fechaEditText: UITextField!
    var datePicker = UIDatePicker()
    
    // MARK: Propiedades Ciudades
    @IBOutlet weak var estadoEditText: UITextField!
    var pickerView = UIPickerView()
    
    let estado: Array = [
        "Aguascalientes",
        "Baja California",
        "Baja California Sur",
        "Campeche",
        "Chiapas",
        "Chihuahua",
        "Ciudad de México",
        "Coahuila de Zaragoza",
        "Colima",
        "Durango",
        "Guanajuato",
        "Guerrero",
        "Hidalgo",
        "Jalisco",
        "México",
        "Michoacán de Ocampo",
        "Morelos",
        "Nayarit",
        "Nuevo León",
        "Oaxaca",
        "Puebla",
        "Querétaro",
        "Quintana Roo",
        "San Luis Potosí",
        "Sinaloa",
        "Sonora",
        "Tabasco",
        "Tamaulipas",
        "Tlaxcala",
        "Veracruz de Ignacio de la Llave",
        "Yucatán",
        "Zacatecas"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        crearDatePicker()
        crearCiudadPicker()
    }
    
    // MARK: Fechas-Picker
    func crearDatePicker() -> Void {
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 100.0, height: 44.0))
        
        let botonAceptar = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(aceptarBoton))
        toolbar.setItems([botonAceptar], animated: true)
        
        fechaEditText.inputAccessoryView = toolbar
        fechaEditText.inputView = datePicker
    }
    
    @objc func aceptarBoton() -> Void {
        let formatter = DateFormatter()
        //formatter.dateStyle = .short
        formatter.dateFormat = "HH:mm, d MMM y"
        fechaEditText.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    // MARK: Estados-Picker
    func crearCiudadPicker() -> Void {
        pickerView.delegate = self
        pickerView.dataSource = self
        
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 100.0, height: 44.0))
        
        let botonAceptar = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(aceptarBotonCiudad))
        toolbar.setItems([botonAceptar], animated: true)
        
        estadoEditText.inputAccessoryView = toolbar
        
        estadoEditText.inputView = pickerView
        estadoEditText.textAlignment = .center
    }
    
    @objc func aceptarBotonCiudad() -> Void {
        self.view.endEditing(true)
    }

}

//Extencion para picker ciudades
extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.estado.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.estado[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.estadoEditText.text = estado[row]
    }

}
