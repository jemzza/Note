//
//  ViewController.swift
//  Test
//
//  Created by Alexander on 08/07/2019.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
//        self.togglePickerViewVisibility()
        // Do any additional setup after loading the view.
        
        enterTextField.delegate = self
        TextView.delegate = self
        scrollView.delegate = self
        scrollView.isScrollEnabled = true
        
        textViewDidChange(TextView)
        
        let  ArrayOfColor: [CheckedFieldView] = [FirstColor, SecondColor, ThirdColor, FourthColor]
        chageBorderWidthAndColor(ArrayOfColor)

        selectedColor(selectedColorNow)
        
//        let color1 = UIColor(red: 153 / 255, green: 26 / 255, blue: 61 / 255, alpha: 1.0).cgColor
//        let color2 = UIColor(red: 243 / 255, green: 155 / 255, blue: 51 / 255, alpha: 1.0).cgColor
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.frame = self.
        SetGradientForFourthColor()
    }
    
    @IBOutlet weak var TextView: UITextView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var switchDate: UISwitch!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var ContentView: UIView!
    @IBOutlet weak var enterTextField: UITextField!

    

    @IBOutlet weak var FirstColor: CheckedFieldView!
    @IBOutlet weak var SecondColor: CheckedFieldView!
    @IBOutlet weak var ThirdColor: CheckedFieldView!
    @IBOutlet weak var FourthColor: CheckedFieldView!
    
    
    
    var selectedColorNow: UIColor = .white
    
    @IBOutlet weak var datePickerHeightConstraint: NSLayoutConstraint!
    var pickerHeightVisible: CGFloat!
//    var pickerHeightConstraint: Double = datePicker.frame.height
    
    
    
    func togglePickerViewVisibility(animated: Bool = true) {
        if datePickerHeightConstraint.constant != 0 {
            pickerHeightVisible = datePickerHeightConstraint.constant
            datePickerHeightConstraint.constant = 0
        } else {
            datePickerHeightConstraint.constant = pickerHeightVisible
        }
        if animated {
            UIView.animate(withDuration: 0.2, animations: {
                () -> Void in
                self.view.layoutIfNeeded()
            }, completion: nil)
        } else {
            view.layoutIfNeeded()
        }
    }

//    private func showDatePicker(_ flag: Bool){
//        datePicker.isHidden = !flag
//    }
    
    
    @IBAction func actionDatePicker(_ sender: UISwitch) {
        self.datePicker.isHidden = !sender.isOn
//        showDatePicker(switchDate.isOn)
    }
    
    private func selectedColor(_ color:UIColor){
        switch color {
        case .white:
            resetActivateColor()
            FirstColor.isChecked = true
        case .red:
            resetActivateColor()
            SecondColor.isChecked = true
        case .green:
            resetActivateColor()
            ThirdColor.isChecked = true
        default:
            resetActivateColor()
            FourthColor.isChecked = true
//            palleteColorThumbView.selectedColor = noteSelectedColor
        }
    }
    
//Сброс
    func resetActivateColor() {
        FirstColor.isChecked = false
        SecondColor.isChecked = false
        ThirdColor.isChecked = false
        FourthColor.isChecked = false
    }
    

    
    
    @IBAction func actionFirstColorTapped(_ sender: UITapGestureRecognizer) {
        print("Tap First")
//        self.ContentView.backgroundColor = self.FirstColor.backgroundColor
//        activatedFirst()
        selectedColorNow = .white
        selectedColor(selectedColorNow)
    }
    @IBAction func actionSecondColorTapped(_ sender: UITapGestureRecognizer) {
        print("Tap Second")
//        self.ContentView.backgroundColor = self.SecondColor.backgroundColor
//        activatedSecond()
        selectedColorNow = .red
        selectedColor(selectedColorNow)
    }
    
    @IBAction func actionThirdColorTapped(_ sender: UITapGestureRecognizer) {
        print("Tap Third")
//        self.ContentView.backgroundColor = self.ThirdColor.backgroundColor
//        activatedThird()
        selectedColorNow = .green
        selectedColor(selectedColorNow)
    }
    @IBAction func actionFourthColorTapped(_ sender: UITapGestureRecognizer) {
        print("Tap Fourth")
//        self.ContentView.backgroundColor = self.FourthColor.backgroundColor
//        activatedFourth()
        selectedColorNow = .black
        selectedColor(selectedColorNow)
    }
    @IBAction func actionLongPressTapped(_ sender: UILongPressGestureRecognizer) {
         print("Tap long press")
        let colorPickerViewController = ColorPickerViewController()
        present(colorPickerViewController, animated: true, completion: nil)
//        selectedColorNow = colorPickerViewController
    }
    
    
    //Обновление высоты TextView после поворота экрана
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        textViewDidChange(TextView)
    }
    
    
    //Добавляем рамку для UIView
    func chageBorderWidthAndColor(_ array: Array<CheckedFieldView>) {
        for i in array {
            i.layer.borderWidth = 1
            i.layer.borderColor = UIColor.black.cgColor
        }
        
    }

    


    //Градиент для 4-ого цвета
    func SetGradientForFourthColor() {
        let color1 = UIColor(red: 255 / 255, green: 0 / 255, blue: 0 / 255, alpha: 1.0).cgColor
        let color2 = UIColor(red: 255 / 255, green: 255 / 255, blue: 0 / 255, alpha: 1.0).cgColor
        let color3 = UIColor(red: 0 / 255, green: 255 / 255, blue: 0 / 255, alpha: 1.0).cgColor
        let color4 = UIColor(red: 0 / 255, green: 191 / 255, blue: 255 / 255, alpha: 1.0).cgColor
        let color5 = UIColor(red: 0 / 255, green: 0 / 255, blue: 255 / 255, alpha: 1.0).cgColor
        let color6 = UIColor(red: 255 / 255, green: 105 / 255, blue: 180 / 255, alpha: 1.0).cgColor
        let color7 = UIColor(red: 255 / 255, green: 0 / 255, blue: 0 / 255, alpha: 1.0).cgColor
        let colorWhite1 = UIColor(red: 255 / 255, green: 255 / 255, blue: 255 / 255, alpha: 1.0).cgColor
        let colorWhite2 = UIColor(red: 255 / 255, green: 255 / 255, blue: 255 / 255, alpha: 0.0).cgColor


        let gradientLayer = CAGradientLayer()
        let gradientLayerVertical = CAGradientLayer()
        
        gradientLayer.frame = FourthColor.bounds
        FourthColor.clipsToBounds = true
        gradientLayer.colors = [color1, color2, color3, color4, color5, color6, color7]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.0)
        FourthColor.layer.insertSublayer(gradientLayer, at: 0)
        
        
        gradientLayerVertical.frame = FourthColor.bounds
        FourthColor.clipsToBounds = true
        gradientLayerVertical.colors = [colorWhite1, colorWhite2]
        gradientLayerVertical.startPoint = CGPoint(x: 0.0, y: 1.0)
        gradientLayerVertical.endPoint = CGPoint(x: 0.0, y: 0.2)
        FourthColor.layer.insertSublayer(gradientLayerVertical, at: 1)
    }
    
}






//Динамическое изменение высоты TextView
extension ViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {
        //        print(textView.text)
        let size = CGSize(width: view.frame.width - 32, height: .infinity)
        let estimatedSize = textView.sizeThatFits(size)
        textView.constraints.forEach {(constraint) in
            if constraint.firstAttribute == .height {
                constraint.constant = estimatedSize.height
            }
        }
    }
}


//Прячем Switch
private extension ViewController {
    
    func setupView() {
        self.switchDate.isOn = false
        self.datePicker.isHidden = true
    }
    
    
//Прячем клавиатуру при тапе
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
        
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    

}


//Прячем клаву при нажатии return
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        enterTextField.resignFirstResponder()
        return false
    }
}

