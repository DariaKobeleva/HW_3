//
//  ViewController.swift
//  Created by Дарья Кобелева on 02.02.2024.
//

import UIKit

final class SettingsColorViewController: UIViewController {
    
    @IBOutlet var colorMixView: UIView!
    
    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greenValueLabel: UILabel!
    @IBOutlet var blueValueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    weak var delegate: ColorSettingsDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorMixView.layer.cornerRadius = 15
        setColor()
        
        redValueLabel.text = string(from: redSlider)
        greenValueLabel.text = string(from: greenSlider)
        blueValueLabel.text = string(from: blueSlider)
        
    }
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        setColor()
        
        switch sender {
        case redSlider:
            redValueLabel.text = string(from: redSlider)
        case greenSlider:
            greenValueLabel.text = string(from: greenSlider)
        default:
            blueValueLabel.text = string(from: blueSlider)
        }
    }
    
    @IBAction func doneButtonAction(_ sender: UIButton) {
        dismiss(animated: true)
        delegate?.setBackgroundColor(colorMixView.backgroundColor ?? .white)
    }
    
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
}


