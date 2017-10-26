//
//  NewItemViewControllerExtensions.swift
//  Photobase
//
//  Created by Juan Naputi on 10/24/17.
//  Copyright © 2017 Juan Naputi. All rights reserved.
//

import UIKit

extension NewItemViewController : UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let capturedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            image.image = capturedImage
        }
        
        self.dismiss(animated: true, completion: nil)
    }
}

extension NewItemViewController : UINavigationControllerDelegate {
    
}
