//
//  ViewController.swift
//  PhotoLibrary_02
//
//  Created by Kenny on 2021/01/22.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate { // Photo Library Picker관련 Class 추가

    @IBOutlet weak var imgView: UIImageView!
    
    let picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        picker.delegate = self
    }


    @IBAction func btnPhoto(_ sender: UIButton) {
        let photoAlert = UIAlertController(title: "사진 가져오기", message: "Photo Library에서 사진을 가져 옵니다.", preferredStyle: UIAlertController.Style.actionSheet) // Alert가 화면 밑에서 돌출
        
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {ACTION in
            self.picker.sourceType = .photoLibrary
            self.present(self.picker, animated: false, completion: nil) // animated: true로 해서 차이점을 확인해 보세요!

        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        photoAlert.addAction(okAction)
        photoAlert.addAction(cancelAction)
        
        present(photoAlert, animated: true, completion: nil)
    }
    
    // Photo Library에서 사진 가져오기(함수 이름만 입력하면 준비된 함수임). Print해보면 위치를 알 수 있음.
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            imgView.image = image
            //print(info)
        }
        dismiss(animated: true, completion: nil)
        
    }

    
    
    
    
    
} // ---

