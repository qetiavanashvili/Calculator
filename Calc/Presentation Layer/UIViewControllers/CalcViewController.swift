//
//  ViewController.swift
//  Calc
//
//  Created by Qeti Avanashvili on 15.11.22.
//

import UIKit


class CalcViewController: UIViewController {
    
    // MARK: IBOutlets
    
    @IBOutlet weak var lcdDisplay: LCDDisplay!
    
    @IBOutlet weak var pinpadButton0: UIButton!
    @IBOutlet weak var pinpadButton1: UIButton!
    @IBOutlet weak var pinpadButton2: UIButton!
    @IBOutlet weak var pinpadButton3: UIButton!
    @IBOutlet weak var pinpadButton4: UIButton!
    @IBOutlet weak var pinpadButton5: UIButton!
    @IBOutlet weak var pinpadButton6: UIButton!
    @IBOutlet weak var pinpadButton7: UIButton!
    @IBOutlet weak var pinpadButton8: UIButton!
    @IBOutlet weak var pinpadButton9: UIButton!
    
    @IBOutlet weak var clearButton: UIButton!
    @IBOutlet weak var negateButton: UIButton!
    @IBOutlet weak var percentageButton: UIButton!
    
    @IBOutlet weak var equalButton: UIButton!
    @IBOutlet weak var divideButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    
    @IBOutlet weak var decimalButton: UIButton!
    
    var needToDisplayWelcomeIntro = true

    
    // MARK: Color Themes
    
    private var currentTheme: CalculatorTheme {
        return ThemeManager.shared.currentTheme
    }
    
    
    // MARK: - Calculator Engine
    private var calculatorEngine = CalculatorEngine()
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addThemeGestureRecogniser()
        redecorateView()
        registerForNotification()

        prepareForWelcomeIntro()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if needToDisplayWelcomeIntro {
            needToDisplayWelcomeIntro = false
            displayWelcomeIntro()
        }
    }
    
    private func prepareForWelcomeIntro() {
        lcdDisplay.alpha = 0
    }
    
    private func displayWelcomeIntro() {
        
        let didRestoreFromLastSession = calculatorEngine.restoreFromLastSession()
        refreshLCDDisplay()
        
        let timeDelay: TimeInterval = 0.25
        if didRestoreFromLastSession {
            slideInLCDDisplay(withDelay: timeDelay)
        } else {
            fadeInLCDDisplay(withDelay: timeDelay)
        }
    }

    private func fadeInLCDDisplay(withDelay delay: TimeInterval) {
        UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseOut) { [weak self] in
            self?.lcdDisplay.alpha = 1
        } completion: { _ in
            
        }
    }
    
    private func slideInLCDDisplay(withDelay delay: TimeInterval) {
        lcdDisplay.transform = CGAffineTransform(translationX: 0, y: lcdDisplay.frame.height * 0.5)
        UIView.animate(withDuration: 0.35, delay: 0, options: .curveEaseOut) { [weak self] in
            self?.lcdDisplay.alpha = 1
            self?.lcdDisplay.transform = CGAffineTransform(translationX: 0, y: 0)
            
        } completion: { _ in
            
        }
    }
    
    
    // MARK: - Gestures
    
    private func addThemeGestureRecogniser() {
        let themeGestureRecogniser = UITapGestureRecognizer(target: self, action: #selector(self.themeGestureRecogniserDidTap(_gesture:)))
        themeGestureRecogniser.numberOfTapsRequired = 2
        themeGestureRecogniser.delegate = self
        lcdDisplay.addGestureRecognizer(themeGestureRecogniser)
    }
    
    @objc private func themeGestureRecogniserDidTap(_gesture: UITapGestureRecognizer) {
        lcdDisplay.prepareForColorThemeUpdate()
        decorateViewWithNextTheme()
    }

    
    // MARK: Decorate
    
    private func decorateViewWithNextTheme() {
        ThemeManager.shared.moveToNextTheme()
        redecorateView()
    }
    
    
    
    private func redecorateView() {
        
        view.backgroundColor = UIColor(hex: currentTheme.backgroundColor)
        lcdDisplay.backgroundColor = UIColor(hex: currentTheme.backgroundColor)
        lcdDisplay.label.textColor = UIColor(hex: currentTheme.displayColor)
        
        setNeedsStatusBarAppearanceUpdate()
        
        decorateButtons()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        switch currentTheme.statusBarStyle {
        case .light: return .lightContent
        case .dark: return .darkContent
        }
    }
    
    
    private func decorateButtons() {
        decoratePinPadButton(pinpadButton0, true)
        decoratePinPadButton(pinpadButton1)
        decoratePinPadButton(pinpadButton2)
        decoratePinPadButton(pinpadButton3)
        decoratePinPadButton(pinpadButton4)
        decoratePinPadButton(pinpadButton5)
        decoratePinPadButton(pinpadButton6)
        decoratePinPadButton(pinpadButton7)
        decoratePinPadButton(pinpadButton8)
        decoratePinPadButton(pinpadButton9)
        
        decorateExtraFunctionButton(clearButton)
        decorateExtraFunctionButton(negateButton)
        decorateExtraFunctionButton(percentageButton)
        
        decorateOperationButton(divideButton)
        decorateOperationButton(multiplyButton)
        decorateOperationButton(addButton)
        decorateOperationButton(minusButton)
        decorateOperationButton(equalButton)
        decoratePinPadButton(decimalButton)
    }
    
    
    private func decorateButton(_ button: UIButton, _ usingSlicedImage: Bool = false) {
        let image = usingSlicedImage ? UIImage(named: UIImage.keys.circleSliced) : UIImage(named: UIImage.keys.circle)
        button.setBackgroundImage(image, for: .normal)
        button.backgroundColor = .clear
    }
    
    private func decorateExtraFunctionButton(_ button:UIButton) {
        decorateButton(button)
        
        button.tintColor = UIColor(hex: currentTheme.extraFunctionColor)
        button.setTitleColor(UIColor(hex: currentTheme.extraFunctionTitleColor), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
    }
    
    private func decorateOperationButton(_ button:UIButton) {
        decorateButton(button)
        
        button.tintColor = UIColor(hex: currentTheme.operationColor)
        button.setTitleColor(UIColor(hex: currentTheme.operationTitleColor), for: .normal)
        button.setTitleColor(UIColor(hex: currentTheme.operationTitleSelectedColor), for: .selected)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 50)
        
        if button.isSelected {
            selectOperationButton(button, true)
        }
    }
    
    private func decoratePinPadButton(_ button: UIButton, _ usingSlicedImage: Bool = false) {
        decorateButton(button, usingSlicedImage)
        
        button.tintColor = UIColor(hex: currentTheme.pinpadColor)
        button.setTitleColor(UIColor(hex: currentTheme.pinpadTitleColor), for: .normal)
        
        button.titleLabel?.font = UIFont.systemFont(ofSize: 30)
    }
    
    // MARK: - Select Operation Buttons
    
    private func deselectOperationsButtons() {
        selectOperationButton(divideButton, false)
        selectOperationButton(multiplyButton, false)
        selectOperationButton(minusButton, false)
        selectOperationButton(addButton, false)
        
    }
    
    private func selectOperationButton(_ button: UIButton, _ selected: Bool) {
        button.tintColor = selected ? UIColor(hex: currentTheme.operationSelectedColor) : UIColor(hex: currentTheme.operationColor)
        button.isSelected = selected
    }
    
    
    
    // MARK: - IBActions
    
    @IBAction private func clearPressed() {
        clearButton.bounce()
        deselectOperationsButtons()
        
        calculatorEngine.clearPressed()
        refreshLCDDisplay()
    }
    
    @IBAction private func negatePressed() {
        negateButton.bounce()
        
        calculatorEngine.negatePressed()
        refreshLCDDisplay()
        
    }
    
    @IBAction private func percentagePressed() {
        percentageButton.bounce()
        
        calculatorEngine.percentagePressed()
        refreshLCDDisplay()
    }
    
    // MARK: - Operations
    
    @IBAction private func addPressed() {
        addButton.bounce()
        
        deselectOperationsButtons()
        selectOperationButton(addButton, true)
        
        calculatorEngine.addPressed()
        refreshLCDDisplay()
    }
    
    @IBAction private func minusPressed() {
        minusButton.bounce()
        
        deselectOperationsButtons()
        selectOperationButton(minusButton, true)
        
        calculatorEngine.minusPressed()
        refreshLCDDisplay()
    }
    
    @IBAction private func multiplyPressed() {
        multiplyButton.bounce()
        
        deselectOperationsButtons()
        selectOperationButton(multiplyButton, true)
        
        
        calculatorEngine.multiplyPressed()
        refreshLCDDisplay()
    }
    
    @IBAction private func dividePressed() {
        divideButton.bounce()
        
        deselectOperationsButtons()
        selectOperationButton(divideButton, true)
        
        
        calculatorEngine.dividePressed()
        refreshLCDDisplay()
    }
    
    @IBAction private func equalsPressed() {
        equalButton.bounce()
        
        deselectOperationsButtons()
        
        calculatorEngine.equalsPressed()
        refreshLCDDisplay()
    }
    
    // MARK: - Number Input
    
    @IBAction private func decimalPressed() {
        decimalButton.bounce()
        
        deselectOperationsButtons()
        calculatorEngine.decimalPressed()
        refreshLCDDisplay()
    }
    
    @IBAction private func numberPressed(_ sender: UIButton) {
        sender.bounce()

        deselectOperationsButtons()
        let number = sender.tag
        calculatorEngine.pinPadPressed(number)
        refreshLCDDisplay()
    }
    
    // MARK: - Refresh LCDDisplay
    
    private func refreshLCDDisplay () {
        lcdDisplay.label.text = calculatorEngine.lcdDisplayText
    }
    
    // MARK: - Notifications
    private func registerForNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.didRecievePasteNotification(notification:)), name: Notification.Name(LCDDisplay.keys.pasteNumberNotification), object: nil)

        NotificationCenter.default.addObserver(self, selector: #selector(self.didReceiveHistoryLogNotification(notification:)), name: Notification.Name(LCDDisplay.keys.historyLogNotification), object: nil)
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.didReceivePasteMathEquationNotification(notification:)), name: Notification.Name(LogViewController.keys.pasteEquationNotification), object: nil)
        
    }
    
    @objc private func didReceivePasteMathEquationNotification(notification: Notification) {
        
        guard let mathEquation = notification.userInfo?[LogViewController.keys.pasteNumberKey] as? MathEquation else { return }
        
        pasteMathEquationIntoCalculator(from: mathEquation)
    }
    
    
    @objc private func didRecievePasteNotification(notification: Notification) {
        guard let doubleValue = notification.userInfo?[LCDDisplay.keys.pasteNumberKey] as? Double else { return }
        
        pasteNumberIntoCalculator(from: Decimal(doubleValue))
    }
    
    @objc private func didReceiveHistoryLogNotification(notification: Notification) {
        
        presentHistoryLogScreen()
    }
    
    // MARK: - History Log Screen
    
    private func presentHistoryLogScreen() {
        let storyboard = UIStoryboard(name: UIStoryboard.keys.mainStoryboard, bundle: nil)
        guard let logViewController = storyboard.instantiateViewController(withIdentifier: UIStoryboard.keys.logViewController) as? LogViewController else {
            return
        }
        
        logViewController.datasource = calculatorEngine.historyLog
        
        let navigationController = UINavigationController(rootViewController: logViewController)
        
        let theme = ThemeManager.shared.currentTheme
        navigationController.navigationBar.backgroundColor = UIColor(hex: theme.backgroundColor)
        navigationController.navigationBar.tintColor = UIColor(hex: theme.displayColor)
        navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        present(navigationController, animated: true, completion: nil)
    }
    
    
    
    // MARK: Copy and paste
    private func pasteNumberIntoCalculator(from decimal: Decimal) {
        calculatorEngine.pasteInNumber(from: decimal)
        refreshLCDDisplay()
    }
    
    
    private func pasteMathEquationIntoCalculator(from mathEquation: MathEquation) {
        calculatorEngine.pasteInMathEquation(from: mathEquation)
        refreshLCDDisplay()
        
    }
}

extension CalcViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        touch.view is LCDDisplay
    }
}

