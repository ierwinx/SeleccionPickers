import UIKit

class Picker4ViewController: UIViewController {

    @IBOutlet weak var seleccionEditText: UITextField!
    var pickerView = UIPickerView()
    
    let fechas = FechaLimite(mes: [
        "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"
    ], anio: [
        "2020","2021","2023", "2023", "2024", "2025", "2026", "2027"
    ])
    
    private var mesSel = ""
    private var anioSel = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.delegate = self
        pickerView.dataSource = self
        
        let toolbar = UIToolbar(frame: CGRect(x: 0, y: 0, width: 100.0, height: 44.0))
        
        let botonAceptar = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(aceptarBoton))
        toolbar.setItems([botonAceptar], animated: true)
        
        seleccionEditText.inputAccessoryView = toolbar
        
        seleccionEditText.inputView = pickerView
        seleccionEditText.textAlignment = .center
    }
    
    @objc func aceptarBoton() -> Void {
        self.view.endEditing(true)
    }
    
}

extension Picker4ViewController: UIPickerViewDelegate, UIPickerViewDataSource {

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return self.fechas.mes.count
        } else {
            return self.fechas.anio.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return self.fechas.mes[row]
        } else {
            return self.fechas.anio[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            self.mesSel = self.fechas.mes[row]
        } else {
            self.anioSel = self.fechas.anio[row]
        }
        self.seleccionEditText.text = "\(mesSel) - \(anioSel)"
    }
    
}
