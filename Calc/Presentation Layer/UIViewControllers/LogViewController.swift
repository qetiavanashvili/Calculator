//
//  LogTableViewController.swift
//  Calc
//
//  Created by Qeti Avanashvili on 18.12.22.
//

import UIKit

class LogViewController: UITableViewController {
    
    // MARK: - Datasource
    
    var datasource: [MathEquation] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        decorateView()
        setupNavigationBar()
    }
    
    // MARK: - Navigation Bar
    
    private func setupNavigationBar() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.doneButtonPressed))
        
    }
    
    @objc private func doneButtonPressed() {
        dismiss(animated: true, completion: nil)
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return datasource.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "EquationTableViewCell", for: indexPath) as? EquationTableViewCell,
            let equation = datasource[safe: indexPath.row]
        else {
            return UITableViewCell()
        }
        
        
        
        cell.lhslabel.text = equation.lhs.formatted()
        cell.rhslabel.text = equation.generateStringRepresentationOfOperation() + " " + (equation.rhs?.formatted() ?? "")
        cell.resultlabel.text = "= " + (equation.result?.formatted() ?? "")
        cell.selectedBackgroundView = UIView()
        decorateCell(cell)
        
        return cell
    }

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard
            let cell = tableView.cellForRow(at: indexPath) as? EquationTableViewCell,
            let equation = datasource[safe: indexPath.row]
        else {
            return
        }
                
        let userInfo: [AnyHashable: Any] = [LogViewController.keys.pasteNumberKey : equation ]
        NotificationCenter.default.post(name: NSNotification.Name(LogViewController.keys.pasteEquationNotification), object: nil, userInfo: userInfo)
        
        tableView.isUserInteractionEnabled = false
        cell.displayTick()
        dismissAfterDelay()
    }
    
    private func dismissAfterDelay() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [weak self] in
            self?.dismiss(animated: true, completion: nil)
        }
    }
    
    
    // MARK: - Decorate
    
    private func decorateCell(_ cell: EquationTableViewCell) {
        let theme = ThemeManager.shared.currentTheme
        cell.backgroundColor = UIColor(hex: theme.backgroundColor)
        cell.selectedBackgroundView?.backgroundColor = UIColor(hex: theme.operationColor)
        cell.lhslabel.textColor = UIColor(hex: theme.displayColor)
        cell.rhslabel.textColor = UIColor(hex: theme.displayColor)
        cell.resultlabel.textColor = UIColor(hex: theme.displayColor)
        cell.lhslabel.highlightedTextColor = UIColor(hex: theme.backgroundColor)
        cell.rhslabel.highlightedTextColor  = UIColor(hex: theme.backgroundColor)
        cell.resultlabel.highlightedTextColor  = UIColor(hex: theme.backgroundColor)
        cell.tick.tintColor = UIColor(hex: theme.operationTitleColor)
    }
    
    private func decorateView() {
        let theme = ThemeManager.shared.currentTheme
        tableView.backgroundColor = UIColor(hex: theme.backgroundColor)
        tableView.tintColor = UIColor(hex: theme.displayColor)
        
        tableView.separatorColor = UIColor(hex: theme.displayColor)
        switch theme.statusBarStyle {
        case .light: tableView.indicatorStyle = .white
        case .dark: tableView.indicatorStyle = .black
        }
    }
}
