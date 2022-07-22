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
    var topClothesArray = [UIImage]()
    var bottomClothesArray = [UIImage]()
    
    @IBAction func BackHomeButtonPressed(_ sender: Any) {
        print("BackHome button pressed")
        self.performSegue(withIdentifier: "HomeSeague", sender: self)
    }
    
    
   
    
    @IBAction func addPhotoButtonPressed(_ sender: UIBarButtonItem) {
        var config = PHPickerConfiguration()
        config.selectionLimit = 3
        
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
/*
extension AddClothesViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = UIScreen.main.bounds
        return CGSize(width: size.width, height: size.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
*/
