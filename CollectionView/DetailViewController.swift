//
//  DetailViewController.swift
//  CollectionView
//
//  Created by Julia Semyzhenko on 7/29/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var detailPicture: UIImageView!
    var pictureName = ""
    override func viewDidLoad() {
        detailPicture.image = UIImage(named: pictureName)
        super.viewDidLoad()
        
    }
    
}
