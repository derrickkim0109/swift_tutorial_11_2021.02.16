//
//  DetailViewController.swift
//  Database CRUD
//
//  Created by Derrick on 2021/02/16.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    
    // ----------
    // Properties
    // ----------
    @IBOutlet weak var txtCode: UITextField!
    
    @IBOutlet weak var txtName: UITextField!
    @IBOutlet weak var txtMajor: UITextField!
    @IBOutlet weak var txtTelNo: UITextField!
    
    
    var receiveItem = DBModel()
                
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        txtCode.text = receiveItem.scode
        txtCode.isUserInteractionEnabled = false
        txtName.text = receiveItem.sname
        txtMajor.text = receiveItem.sdept
        txtTelNo.text = receiveItem.sphone
    }
    
    @IBAction func btnUpdate(_ sender: UIButton) {
        let code = txtCode.text
        let name = txtName.text
        let dept = txtMajor.text
        let phone = txtTelNo.text
        
        let updateModel = UpdateModel()
        
        //Bool 값으로 처리
        let result = updateModel.updateItems(code: code!, name: name!, dept: dept!, phone: phone!)
        if result == true {
            let resultAlert = UIAlertController(title: "완료", message: "수정이 되었습니다.", preferredStyle: UIAlertController.Style.alert)
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
    
    @IBAction func btnDelete(_ sender: UIButton) {
    
        let resultAlert = UIAlertController(title: "삭제", message: "삭제하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
                   let onAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {ACTION in
                       let code = self.txtCode.text
                       
                       let deleteModel = DeleteModel()
                       let result = deleteModel.deleteItems(code: code!)
                       
                       if result == true {
                           let resultAlert = UIAlertController(title: "완료", message: "삭제되었습니다.", preferredStyle: UIAlertController.Style.alert)
                           let onAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: {ACTION in
                               self.navigationController?.popViewController(animated: true)
                           })
                           
                           resultAlert.addAction(onAction)
                           self.present(resultAlert, animated: true, completion: nil)
                           
                       } else {
                           let resultAlert = UIAlertController(title: "실패", message: "에러가 발생하였습니다.", preferredStyle: UIAlertController.Style.alert)
                           let onAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                           resultAlert.addAction(onAction)
                           self.present(resultAlert, animated: true, completion: nil)
                       }
                   })
               
                   let cancelAction = UIAlertAction(title: "CANCEL", style: UIAlertAction.Style.default, handler: nil)
                       resultAlert.addAction(cancelAction)
                       resultAlert.addAction(onAction)
                       present(resultAlert, animated: true, completion: nil)

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
