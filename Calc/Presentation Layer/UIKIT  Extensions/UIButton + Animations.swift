//
//  UIButton + Animations.swift
//  Calc
//
//  Created by Qeti Avanashvili on 15.12.22.
//

import Foundation
import UIKit

extension UIButton {
    
    func bounce() {
        UIView.animate(withDuration: 0.1, delay: 0, options: [.curveEaseOut]) { [weak self] in
            self?.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        } completion: { _ in
            UIView.animate(withDuration: 0.15, delay: 0, options: [.curveEaseInOut]) { [weak self] in
                self?.transform = CGAffineTransform.identity
            } completion: { _ in
                
            }
        }
    }
}

