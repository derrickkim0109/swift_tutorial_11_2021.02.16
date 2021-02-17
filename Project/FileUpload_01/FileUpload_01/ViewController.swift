//
//  ViewController.swift
//  FileUpload_01
//
//  Created by Kenny Hahn on 2021/01/23.
//

import UIKit

class ViewController: UIViewController,UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    let imagePickerController = UIImagePickerController()
    var imageURL: URL?



    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imagePickerController.delegate = self
    }

    @IBAction func btnPhoto(_ sender: UIButton) {
        // 앨범 호출
        imagePickerController.sourceType = .photoLibrary
        self.present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func btnUpload(_ sender: Any) {
        let imageUploadModel = ImageUploadModel()
        imageUploadModel.uploadImageFile(at: imageURL!, completionHandler: {_,_ in print("Upload Success")})
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            imageView.image = image
            
            imageURL = info[UIImagePickerController.InfoKey.imageURL] as? URL
        }
        
        // 켜놓은 앨범 화면 없애기
        dismiss(animated: true, completion: nil)
    }
    
} // ----

