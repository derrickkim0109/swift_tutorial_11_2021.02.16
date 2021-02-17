//
//  AddViewController.swift
//  Database CRUD
//
//  Created by Derrick on 2021/02/16.
//

import UIKit


class AddViewController: UIViewController {
    
    // ----------
    // Properties
    // ----------
    @IBOutlet weak var txtCode: UITextField!
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtMajor: UITextField!
    @IBOutlet weak var txtTelNo: UITextField!
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func btnInsert(_ sender: UIButton) {
        let code = txtCode.text
        let name = txtName.text
        let dept = txtMajor.text
        let phone = txtTelNo.text
        
        let insertModel = InsertModel()
        
        //Bool 값으로 처리
        let result = insertModel.insertItems(code: code!, name: name!, dept: dept!, phone: phone!)
        if result == true {
            let resultAlert = UIAlertController(title: "완료", message: "입력이 되었습니다.", preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {ACTION in
                self.navigationController?.popViewController(animated: true)
            })
            resultAlert.addAction(onAction)
            present(resultAlert, animated: true, completion: nil)
            
        }else{
            let resultAlert = UIAlertController(title: "실패", message: "에러가 발생 되었습니다.", preferredStyle: UIAlertController.Style.alert)
            let onAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
            resultAlert.addAction(onAction)
            present(resultAlert, animated: true, completion: nil)
            
        }
        
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
