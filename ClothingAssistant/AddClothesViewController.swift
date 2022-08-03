//
//  AddClothesViewController.swift
//  ClothingAssistant
//
//  Created by CoopStudent on 7/21/22.
//

import Foundation
import UIKit
import PhotosUI

class AddClothesViewController: UIViewController {

    @IBOutlet weak var photoCollectionView: UICollectionView!
    //var topClothesArray = [UIImage]()
    //var bottomClothesArray = [UIImage]()
    var topClothesArray = [UIImage(named: "bottomImage1"), UIImage(named: "bottomImage2"), UIImage(named:"topImage3") ]
    
    @IBAction func InAddClothesScreenHomeButtonPressed(_ sender: Any) {
        print("BackHome button pressed")
        self.performSegue(withIdentifier: "LaundryHomeSeague", sender: self)
    }
    
    
    //print("\(topClothesArray.count)")
    
    @IBAction func addPhotoButtonPressed(_ sender: UIBarButtonItem) {
        var config = PHPickerConfiguration()
        config.selectionLimit = 0
        
        let phPickerVC = PHPickerViewController(configuration: config)
        phPickerVC.delegate = self
        self.present(phPickerVC, animated: true)
        
        
    }
    
    //bottoms func here
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}

extension AddClothesViewController: PHPickerViewControllerDelegate{
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        dismiss(animated: true)
        for result in results {
            result.itemProvider.loadObject(ofClass: UIImage.self){object,
                error in
                if let image = object as? UIImage{
                    
                    self.topClothesArray.append(image)
                }
                DispatchQueue.main.async {
                    self.photoCollectionView.reloadData()
                }
            }
        }
    }
}


extension AddClothesViewController: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        topClothesArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell =
                collectionView.dequeueReusableCell(withReuseIdentifier:
                "PhotoCell", for: indexPath) as? PhotoCell else {
            return UICollectionViewCell()
        }
        cell.photoImageView.image = topClothesArray[indexPath.row]
        return cell
    }
    }
//scrolling code, if uncodded will show scrolling

extension AddClothesViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //let size = collectionView.frame.size
        //return CGSize(width: size.width, height: size.height)
        
        
        CGSize(width: collectionView.frame.size.width / 3 - 2, height: collectionView.frame.size.height / 5 - 2)
    }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 0
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 0
        }
        
    
    
   /* func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }*/
    
   
    
}


