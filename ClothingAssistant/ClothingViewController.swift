//
//  ClothingViewController.swift
//  ClothingAssistant
//
//  Created by CoopStudent on 7/22/22.
//

import Foundation
import UIKit
import PhotosUI

class ClothingViewController: UIViewController {
    
    @IBOutlet weak var photoTopCollectionView: UICollectionView!
    var topsArray = [UIImage]()
    
    var bottomsArray = [UIImage]()
    
    @IBOutlet weak var photoBottomCollectionView: UICollectionView!
    
    var fakeTopImgArray = [UIImage(named: "topImage1"), UIImage(named: "topImage2"), UIImage(named:"topImage3") ]
    var fakeBottomImgArray = [UIImage(named: "bottomImage1"), UIImage(named: "bottomImage2"), UIImage(named:"bottomImage3") ]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }
    
    
    @IBAction func ClothingBackHomeButtonPressed(_ sender: Any) {
        print(" clothing back home button pressed")
        self.performSegue(withIdentifier: "ClothingHomeSeague", sender: self)
        
    }
    
    
    
    @IBAction func addTopsButtonPressed(_ sender: Any) {
        var config = PHPickerConfiguration()
        config.selectionLimit = 3
        
        let phPickerVC = PHPickerViewController(configuration: config)
        phPickerVC.delegate = self
        self.present(phPickerVC, animated: true)
        
    }
    
    
    @IBAction func AddBottoms(_ sender: Any) {
        var config2 = PHPickerConfiguration()
        config2.selectionLimit = 3
        
        let phPickerVC2 = PHPickerViewController(configuration: config2)
        phPickerVC2.delegate = self
        self.present(phPickerVC2, animated: true)
    }
}

/*extension ClothingViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return fakeTopImgArray.count
        if collectionView == photoBottomCollectionView{
            return fakeBottomImgArray.count
        }
    }
}*/
extension ClothingViewController: PHPickerViewControllerDelegate{
   
    func picker( _ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult] ) {
    
        dismiss(animated: true)
        
       
        
        for result in results  {
            
            
           
            result.itemProvider.loadObject(ofClass: UIImage.self){ object,
                error in
                
                
                    if let image = object as? UIImage{
                       
                        self.fakeTopImgArray.append(image)
                        self.fakeBottomImgArray.append(image)
                        //self.topsArray.append(image)
                        //self.bottomsArray.append(image)
                    
                    }
                
                DispatchQueue.main.async {
            
                    self.photoTopCollectionView.reloadData()
        
                    self.photoBottomCollectionView.reloadData()
                
                }
            }
            

        }
    
    }
}

// code that is commented out is the image scroller with pictures from photos in apple
/*extension ClothingViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == photoBottomCollectionView{
           //return  bottomsArray.count
            return fakeBottomImgArray.count
        }
        //return topsArray.count
        return fakeTopImgArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == photoBottomCollectionView
        {
            guard let cell2 = photoBottomCollectionView.dequeueReusableCell(withReuseIdentifier: "PhotoBottomsCell", for: indexPath) as? PhotoBottomsCell else{
                return UICollectionViewCell()
            }
            
           
            cell2.photoBottomImageView.image = bottomsArray[indexPath.row]
            
            
                return cell2
            
        }
        guard let cell = photoTopCollectionView.dequeueReusableCell(withReuseIdentifier: "PhotoTopCell", for: indexPath) as? PhotoTopCell else{
            return UICollectionViewCell()
        }
        
        
        cell.photoTopsImageView.image = topsArray[indexPath.row]
        
        return cell
        
    }
    
    }*/
//image scroller with pictures put in begins
extension ClothingViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == self.photoBottomCollectionView{
            return fakeBottomImgArray.count
        }
        return fakeTopImgArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
        
        if collectionView == self.photoBottomCollectionView{
            
            let cell2 = photoBottomCollectionView.dequeueReusableCell(withReuseIdentifier: "PhotoBottomsCell", for: indexPath) as? PhotoBottomsCell
            cell2?.photoBottomImageView.image = fakeBottomImgArray[indexPath.row]
            return cell2!
        }
        
        let cell = photoTopCollectionView.dequeueReusableCell(withReuseIdentifier: "PhotoTopCell", for: indexPath) as? PhotoTopCell
        cell?.photoTopsImageView.image = fakeTopImgArray[indexPath.row]
        return cell!
    }
    //image scroller with pics put in ends
    
}


    extension ClothingViewController: UICollectionViewDelegateFlowLayout{
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let size = collectionView.frame.size
            return CGSize(width: size.width, height: size.height)
        
        }
            
            func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
                return 0
            }
            
            func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
                return 0
            }
            
        
        
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        
       

    
        
        
    
    
  
}
