//
//  ViewController.swift
//  CollectionView
//
//  Created by Julia Semyzhenko on 7/29/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var galleryColectionView: UICollectionView!
    
    var numberOfMemes = 26
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        galleryColectionView.dataSource = self
        galleryColectionView.delegate = self
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        numberOfMemes
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath)
    -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        as! CustomCollectionViewCell
        cell.pictureImageVIew.image = UIImage(named: "\(indexPath.row)")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController")
                as?
                DetailViewController else { return }
        vc.pictureName = "\(indexPath.row)"
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.row % 3 == 0 {
            return CGSize(width: collectionView.frame.width/2.1, height: collectionView.frame.width/1.4)
        }
        else  {
            return CGSize(width: collectionView.frame.width/2.1, height: collectionView.frame.width/2.1)
        }
    }
}
