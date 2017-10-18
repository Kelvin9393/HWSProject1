//
//  DetailViewController.swift
//  Project1
//
//  Created by KELVIN LING SHENG SIANG on 13/10/2017.
//  Copyright © 2017 KELVIN LING SHENG SIANG. All rights reserved.
//

import UIKit
import Social

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var selectedImage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = selectedImage
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    
    @objc func shareTapped() {
//        // use UIActivityViewController
//        let vc = UIActivityViewController(activityItems: [imageView.image!], applicationActivities: [])
//        // to achor activity view controller to right bar button item on iPad
//        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
//        present(vc, animated: true)
        
        // use SLComposerViewController
        if let vc = SLComposeViewController(forServiceType: SLServiceTypeFacebook) {
            vc.setInitialText("Look at this great picture!")
            vc.add(imageView.image!)
            vc.add(URL(string: "http://www.photolib.noaa.gov/nssl"))
            present(vc, animated: true)
        }
    }

}
