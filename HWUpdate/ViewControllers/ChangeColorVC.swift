//
//  ChangeColorVC.swift
//  HWUpdate
//
//  Created by Max Stovolos on 7/16/22.
//

import UIKit

//MARK: - NewContactVC

class ChangeColorVC: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var colorV: UIView!
    
    @IBOutlet weak private var blueLabel: UILabel!
    @IBOutlet weak private var greenLabel: UILabel!
    @IBOutlet weak private var redLabel: UILabel!
    
    @IBOutlet var doneButton: UIView!
    
    @IBOutlet weak private var blueCountLabel: UILabel!
    @IBOutlet weak private var greenCountColorLabel: UILabel!
    @IBOutlet weak private var redCountColorLabel: UILabel!
    
    @IBOutlet weak private var redSlider: UISlider!
    @IBOutlet weak private var greenSlider: UISlider!
    @IBOutlet weak private var blueSlider: UISlider!
    
    @IBOutlet weak private var redTextField: UITextField!
    @IBOutlet weak private var greenTextField: UITextField!
    @IBOutlet weak private var blueTextField: UITextField!
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
}
//MARK: - PrivateExtention

private extension ChangeColorVC {
    func setUpUI() {
        setUpSliders()
        setUpView()
        colorLabelsSet()
        setValueTextField()
    }
    
    func setUpSliders() {
        redSlider.value = 1
        redSlider.maximumValue = 1
        redSlider.minimumValue = 0
        redSlider.thumbTintColor = .white
        redSlider.minimumTrackTintColor = .white
        redSlider.maximumTrackTintColor = .red
        
        greenSlider.value = 1
        greenSlider.maximumValue = 1
        greenSlider.minimumValue = 0
        greenSlider.thumbTintColor = .white
        greenSlider.minimumTrackTintColor = .white
        greenSlider.maximumTrackTintColor = .green
        
        blueSlider.value = 1
        blueSlider.maximumValue = 1
        blueSlider.minimumValue = 0
        blueSlider.thumbTintColor = .white
        blueSlider.minimumTrackTintColor = .white
        blueSlider.maximumTrackTintColor = .blue
        
    }
    //цвет вью
    func colorLabelsSet() {
        redCountColorLabel.text = String(format: "%.1f", redSlider.value)
        redTextField.text = String(format: "%.1f", redSlider.value)
        
        greenCountColorLabel.text = String(format: "%.1f", greenSlider.value)
        greenTextField.text = String(format: "%.1f", greenSlider.value)
        
        blueCountLabel.text = String(format: "%.1f", blueSlider.value)
        blueTextField.text = String(format: "%.1f", blueSlider.value)
    }
    
    func setValueTextField() {
        redTextField.text = String(redSlider.value)
        greenTextField.text = String(greenSlider.value)
        blueTextField.text = String(blueSlider.value)
    }
    
    func setUpView() {
        colorV.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
//    func setSliderAndTextField(_ slider: UISlider) {
//        let currentSlider = slider.value
//        switch slider.tag {
//        case 0: redTextField.text = String(currentSlider)
//        case 1: greenTextField.text = String(currentSlider)
//        case 2: blueTextField.text = String(currentSlider)
//        default: break
//        }
    //}
}

//MARK: - Protocols

extension ChangeColorVC: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        
        if let currentValue = Float(text) {
            switch textField.tag {
            case 0: redSlider.value = currentValue
            case 1: greenSlider.value = currentValue
            case 3: blueSlider.value = currentValue
            default: break
            }
            setUpView()
            colorLabelsSet()
        }
    }
}

//MARK: - IBAction

extension ChangeColorVC {
    
    @IBAction func redSliderAction(_ sender: Any) {
        colorLabelsSet()
        setUpView()
    }
    
    @IBAction func greenSliderAction(_ sender: Any) {
        colorLabelsSet()
        setUpView()
    }
    
    @IBAction func blueSliderAction(_ sender: Any) {
        colorLabelsSet()
        setUpView()
    }
    
    @IBAction func doneActionButton() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "fierstPage") as! ViewController
        vc.view.backgroundColor = colorV.backgroundColor
    }
    
    @IBAction func redTextFieldAction() {
    }
}
