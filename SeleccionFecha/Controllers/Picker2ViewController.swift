import UIKit

class Estados {
    var estado: String
    var ciudad: [String]
    
    init(estado:String, ciudad: [String]) {
        self.estado = estado
        self.ciudad = ciudad
    }
    
}

class Picker2ViewController: UIViewController {
    
    @IBOutlet weak var estadoCiudadPicker: UIPickerView!
    @IBOutlet weak var respuestaLabel: UILabel!
    
    var ciudades = [Estados]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ciudades.append(Estados(estado: "Mexico", ciudad: ["Chalco", "Ixtapaluca", "Toluca", "Laredo", "Ecatepec", "Nezahualcoyotl"]))
        ciudades.append(Estados(estado: "Puebla", ciudad: ["Puebla de Zaragoza", "Tehuacan", "Atlixco", "Tecamachalco"]))
        ciudades.append(Estados(estado: "Morelos", ciudad: ["Cuernavaca", "Tepoztlan", "Juiltepec", "Yecapixtla"]))
        
        estadoCiudadPicker.dataSource = self
        estadoCiudadPicker.delegate = self
        
    }
    
    @IBAction func cerrarAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}

extension Picker2ViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 {
            return self.ciudades.count
        } else {
            return self.ciudades[pickerView.selectedRow(inComponent: 0)].ciudad.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 {
            return self.ciudades[row].estado
        } else {
            return self.ciudades[pickerView.selectedRow(inComponent: 0)].ciudad[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        self.estadoCiudadPicker.reloadComponent(1)
        
        self.respuestaLabel.text = """
        \(self.ciudades[pickerView.selectedRow(inComponent: 0)].estado)
        \(self.ciudades[pickerView.selectedRow(inComponent: 0)].ciudad[row])
        """
    }
    
}

extension Picker2ViewController: UIPickerViewDelegate {
    
}
