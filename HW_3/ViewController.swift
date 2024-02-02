//
//  ViewController.swift
//  HW_3
//
//  Created by Дарья Кобелева on 02.02.2024.
//

import UIKit


final class ViewController: UIViewController {

    @IBOutlet var colorMixView: UIView!
    
    @IBOutlet var redValueLabel: UILabel!
    @IBOutlet var greeenValueLabel: UILabel!
    @IBOutlet var blueValueLabel: UILabel!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorMixView.layer.cornerRadius = 12
    }

    @IBAction func sliderValueChanged() {
        redValueLabel.text = String(format: "%.2f", redSlider.value)
        greeenValueLabel.text = String(format: "%.2f", greenSlider.value)
        blueValueLabel.text = String(format: "%.2f", blueSlider.value)
        
        colorMixView.backgroundColor = UIColor(
            red: CGFloat(
                redSlider.value
            ),
            green: CGFloat(
                greenSlider.value
            ),
            blue: CGFloat(
                blueSlider.value
            ),
            alpha: 1
        )
    }
    
    
}

