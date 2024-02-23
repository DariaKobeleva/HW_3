//
//  ViewController.swift
//  Created by Дарья Кобелева on 02.02.2024.
//

import UIKit

final class SettingsViewController: UIViewController {
    
    @IBOutlet var colorMixView: UIView!
    
    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueValueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    unowned var delegate: SettingsViewControllerDelegate!
    
    
    //MARK: - View Life Circle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorMixView.layer.cornerRadius = 15
        colorMixView.backgroundColor = delegate?.backgroundColor
        
        setValuesForSliders(from: delegate?.backgroundColor)
        
        redValueLabel.text = string(from: redSlider)
        greenValueLabel.text = string(from: greenSlider)
        blueValueLabel.text = string(from: blueSlider)
    }
    
    //MARK: - IB Action
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        switch sender {
        case redSlider:
            redValueLabel.text = string(from: redSlider)
        case greenSlider:
            greenValueLabel.text = string(from: greenSlider)
        default:
            blueValueLabel.text = string(from: blueSlider)
        }
        
        setColor()
    }
    
    @IBAction func doneButtonAction(_ sender: UIButton) {
        delegate.setColor(colorMixView.backgroundColor ?? .white)
        dismiss(animated: true)
    }
}

// MARK: - Private Methods
extension SettingsViewController {
    private func setColor() {
        colorMixView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
    
    private func string(from slider: UISlider) -> String {
        String(format: "%.2f", slider.value)
    }
    
    private func setValuesForSliders(from color: UIColor?) {
        let ciColor = CIColor(color: color ?? .white)
        
        redSlider.value = Float(ciColor.red)
        greenSlider.value = Float(ciColor.green)
        blueSlider.value = Float(ciColor.blue)
    }
}
