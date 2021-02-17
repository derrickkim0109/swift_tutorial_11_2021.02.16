//
//  ViewController.swift
//  PhotoLibrary_01
//
//  Created by Kenny on 2021/01/22.
//

import UIKit
import MobileCoreServices // ***

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate { // <--

    @IBOutlet weak var imgView: UIImageView!
    
    let imagePicker: UIImagePickerController! = UIImagePickerController()
    var captureImage: UIImage!
    var flagImageSave = false // 지정 안하면 PhotoLibrary에 저장

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnLoadImageFromLibrary(_ sender: Any) {
        if (UIImagePickerController.isSourceTypeAvailable(.photoLibrary)){
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary
            imagePicker.mediaTypes = [kUTTypeImage as String]
            imagePicker.allowsEditing = false // true를 하면 이미지 편집창이 보임.
            
            present(imagePicker, animated: true, completion: nil)
        }else{
            myAlert("Photo album inaccessable", message: "Application cannot access the photo album.")
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let mediaType = info[UIImagePickerController.InfoKey.mediaType] as! NSString
        
        if mediaType.isEqual(to: kUTTypeImage as NSString as String){
            captureImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            
            if flagImageSave{ // 이미지를 photolibrary에 저장하고자 할때 사용
                UIImageWriteToSavedPhotosAlbum(captureImage, self, nil, nil)
            }
            
            imgView.image = captureImage
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    
    func myAlert(_ title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }

} // -----

