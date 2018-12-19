//
//  ViewController.swift
//  Mememev1.0
//
//  Created by Srikar Thottempudi on 12/16/18.
//  Copyright © 2018 Srikar Thottempudi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let mememeTextAttributes: [NSAttributedString.Key: Any] = [NSAttributedString.Key.strokeColor: UIColor.black,
                                                               NSAttributedString.Key.foregroundColor: UIColor.white,
                                                               NSAttributedString.Key.font: UIFont(name: "HelveticaNeue-CondensedBlack", size: 40)!,
                                                               NSAttributedString.Key.strokeWidth: 0]
    
    let mememeTextFieldDelegate = CustomMememeTextFieldDelegate()
    
    struct MememeGenerator {
        var topTextFieldInImage: String
        var bottomTextFieldInImage: String
        var originalImage: UIImage
        var memeMeImage: UIImage
    }

    @IBOutlet weak var albumToolbarItem: UIToolbar!
    @IBOutlet weak var cameraToolbarButton: UIButton!
    @IBOutlet weak var selectedImage: UIImageView!
    @IBOutlet weak var topTextField: UITextField!
    @IBOutlet weak var bottomTextField: UITextField!
    @IBOutlet weak var shareButton: UIBarButtonItem!
    @IBOutlet weak var cancelButton: UIBarButtonItem!
    @IBOutlet weak var albumToolbar: UIToolbar!
    @IBOutlet weak var shareNavbar: UINavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        configureTextFields(textField: topTextField)
        configureTextFields(textField: bottomTextField)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        cameraToolbarButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
        shareButton.isEnabled = (selectedImage.image != nil)
        cancelButton.isEnabled = (selectedImage.image != nil)
        subscribeToKeyboardNotifications()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        unsubscribeFromKeyboardNotifications()
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            selectedImage.image = image
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func albumPicker(_ sender: Any) {
        sourcePicker(sourceType: UIImagePickerController.SourceType.photoLibrary)
    }
    
    
    @IBAction func cameraPicker(_ sender: Any) {
        sourcePicker(sourceType: UIImagePickerController.SourceType.camera)
    }
    
    @IBAction func shareMeme(_ sender: Any) {
        let memedImage = generateMememeImage()
        let shareImageController = UIActivityViewController(activityItems: [memedImage], applicationActivities: nil)
        save(memedImage)
        present(shareImageController, animated: true, completion: nil)
    }
    
    @IBAction func cancelMeme(_ sender: Any) {
        selectedImage.image = nil
        configureTextFields(textField: topTextField, text: "top")
        configureTextFields(textField: bottomTextField, text: "bottom")
    }
    
    func configureTextFields(textField: UITextField, text: String? = nil) {
        textField.defaultTextAttributes = mememeTextAttributes
        textField.delegate = mememeTextFieldDelegate
        textField.textAlignment = NSTextAlignment.center
        if text != nil {
            textField.text = text
        }
    }
    
    func sourcePicker(sourceType: UIImagePickerController.SourceType) {
        let sourcePickerController = UIImagePickerController()
        sourcePickerController.delegate = self
        sourcePickerController.sourceType = sourceType
        present(sourcePickerController, animated: true, completion: nil)
    }
    
    func subscribeToKeyboardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        if bottomTextField.isFirstResponder {
            view.frame.origin.y = -getKeyboardHeight(notification)
        }
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        view.frame.origin.y = 0
    }
    
    func getKeyboardHeight(_ notification: Notification) -> CGFloat {
        let userInfo = notification.userInfo
        let keyboardSize = userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue
        return keyboardSize.cgRectValue.height
    }
    
    func unsubscribeFromKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    func save(_ memeImage: UIImage) {
        let meme = MememeGenerator(topTextFieldInImage: topTextField.text!, bottomTextFieldInImage: bottomTextField.text!, originalImage: selectedImage.image!, memeMeImage: memeImage)
        
    }
    
    func generateMememeImage() -> UIImage {
        self.albumToolbar.isHidden = true
        self.shareNavbar.isHidden = true
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        view.drawHierarchy(in: self.view.frame, afterScreenUpdates: true)
        let memedImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        self.albumToolbar.isHidden = false
        self.shareNavbar.isHidden = false
        return memedImage
    }
}

