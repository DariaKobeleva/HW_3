//
//  backgroundColorViewController.swift
//  ColorizedApp
//
//  Created by Дарья Кобелева on 21.02.2024.
//

import UIKit

protocol SettingsViewControllerDelegate: AnyObject {
    var backgroundColor: UIColor { get }
    
    func setColor(_ color: UIColor)
}

final class MainViewController: UIViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let settingsVC = segue.destination as? SettingsViewController
        settingsVC?.delegate = self
    }
}

// MARK: - SettingsViewControllerDelegate
extension MainViewController: SettingsViewControllerDelegate {
    var backgroundColor: UIColor {
        view.backgroundColor ?? .white
    }
    
    func setColor(_ color: UIColor) {
        view.backgroundColor = color
    }
}
