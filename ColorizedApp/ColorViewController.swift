//
//  backgroundColorViewController.swift
//  ColorizedApp
//
//  Created by Дарья Кобелева on 21.02.2024.
//

import UIKit

protocol ColorSettingsDelegate: AnyObject {
    var backgroundColor: UIColor { get }
    
    func setBackgroundColor(_ color: UIColor)
}

final class ColorViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let settingsColorVC = segue.destination as? SettingsColorViewController
        settingsColorVC?.delegate = self
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

// MARK: - ColorSettingsDelegate
extension ColorViewController: ColorSettingsDelegate {
    var backgroundColor: UIColor {
        view.backgroundColor ?? .white
    }
    
    func setBackgroundColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}
