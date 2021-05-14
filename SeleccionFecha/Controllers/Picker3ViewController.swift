import UIKit

class FechaLimite {
    let mes: [String]
    let anio: [String]
    
    init(mes: [String], anio: [String]) {
        self.mes = mes
        self.anio = anio
    }
}

class Picker3ViewController: UIViewController {

    @IBOutlet weak var pickercredito: UIPickerView!
    @IBOutlet weak var mes: UILabel!
    @IBOutlet weak var anio: UILabel!
    
    let fechas = FechaLimite(mes: [
        "01", "02", "03", "04", "05", "06", "07", "08", "09", "10", "11", "12"
    ], anio: [
        "2020","2021","2023", "2023", "2024", "2025", "2026", "2027"
    ])
    
    override func viewDidLoad() {
        super.viewDidLoad()

        pickercredito.delegate = self
        pickercredito.dataSource = self
    }
    
    @IBAction func cerrarAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}


extension Picker3ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    
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
            self.mes.text = self.fechas.mes[row]
        } else {
            self.anio.text = self.fechas.anio[row]
        }
    }
}
