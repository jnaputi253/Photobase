//
//  NewItemViewController.swift
//  Photobase
//
//  Created by Juan Naputi on 10/24/17.
//  Copyright © 2017 Juan Naputi. All rights reserved.
//

import UIKit
import CoreData

class NewItemViewController: UIViewController {
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var descriptionField: UITextField!
    @IBOutlet weak var image: UIImageView!
    
    var persistentContainer = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let pickerController: UIImagePickerController
    
    required init?(coder aDecoder: NSCoder) {
        self.pickerController = UIImagePickerController()
        super.init(coder: aDecoder)
        
        self.pickerController.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func onKeyboardDismissed(_ sender: Any) {
        self.resignFirstResponder()
    }
    
    @IBAction func onCameraClicked(_ sender: Any) {
        pickerController.sourceType = .camera
        pickerController.allowsEditing = true
        
        self.present(pickerController, animated: true, completion: nil)
    }
    
    @IBAction func onLibraryClicked(_ sender: Any) {
        self.pickerController.sourceType = .photoLibrary
        self.pickerController.allowsEditing = true
        
        self.present(pickerController, animated: true, completion: nil)
    }
    
    @IBAction func onSaveClicked(_ sender: Any) {
        let entityDescription = NSEntityDescription.entity(forEntityName: "Item", in: persistentContainer)
        let item = Item(entity: entityDescription!, insertInto: persistentContainer)
        item.titletext = titleField.text!
        item.descriptiontext = descriptionField.text!
        
        if let selectedImage = self.image.image {
            item.image = UIImagePNGRepresentation(selectedImage) as NSData?
        }
        
        do {
            try persistentContainer.save()
        } catch {
            print(error)
            return
        }
        
        navigationController!.popViewController(animated: true)
    }

}
