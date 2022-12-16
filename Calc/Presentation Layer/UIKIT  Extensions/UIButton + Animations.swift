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
        moveUp()
    }
    
    
    func growLarger() {
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseIn) {
            self.transform = CGAffineTransform(scaleX: 4, y: 4)
        } completion: { _ in
            
        }
    }
        
        func makeSmaller() {
            UIView.animate(withDuration: 1, delay: 0, options: .curveEaseIn) {
                self.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            } completion: { _ in
                
            }
                
    }
    
    func moveUp() {
        UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseOut) {
            self.transform = CGAffineTransform(translationX: 0, y: -50)
        } completion: { _ in
            UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseInOut) {
                self.transform = CGAffineTransform(translationX: 0, y: 5)
            } completion: { _ in
                UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseInOut) {
                        self.transform = CGAffineTransform(translationX: 0, y: -2)
                    } completion: { _ in
                        UIView.animate(withDuration: 0.1, delay: 0, options: .curveEaseInOut) {
                            self.transform = CGAffineTransform(translationX: 0, y: 0)
                        } completion: { _ in
                    
                        }
                    }
                }
            }
        
        }
    
    }
