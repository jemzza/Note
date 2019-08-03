//
//  ColorPickerViewController.swift
//  Test
//
//  Created by Alexander on 27/07/2019.
//  Copyright © 2019 test. All rights reserved.
//

import UIKit

class ColorPickerViewController: UIViewController {

    
    @IBOutlet weak var SelectedColor: UIView!
    @IBOutlet weak var informationOfColor: UIView!
    @IBOutlet weak var ColorScheme: ColorPalette!
    @IBOutlet weak var Brightness: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        informationOfColor.layer.borderWidth = 1
        informationOfColor.layer.borderColor = UIColor.black.cgColor
        informationOfColor.layer.cornerRadius = 5
        
        SelectedColor.layer.borderWidth = 1
        SelectedColor.layer.borderColor = UIColor.black.cgColor
        
        ColorScheme.layer.borderWidth = 1
        ColorScheme.layer.borderColor = UIColor.black.cgColor
        
//        brightness(Brightness.value)
        // Do any additional setup after loading the view.
        actionSlider(Brightness)
    }
    

    @IBAction func doneTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func actionSlider(_ sender: UISlider) {
//        UIScreen.main.brightness = CGFloat(Brightness.value
        ColorScheme.updateBrightness(alpha: CGFloat(sender.value))
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        actionSlider(Brightness)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
//extension ColorPickerViewController: ColorPaletteDelegate {
//    func colorPickerWillBeginDragging(_ colorPicker: ColorPalletteView) {
//        selectedColor = colorPicker.selectedColor
//    }
//}
