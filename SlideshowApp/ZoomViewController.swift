//
//  ZoomViewController.swift
//  SlideshowApp
//
//  Created by cpcadmin on 2024/02/22.
//

import UIKit

class ZoomViewController: UIViewController {
    
    @IBOutlet weak var zoomimage: UIImageView!
    var zoomimageNo = 0
    let zoomimageName = ["gazo1","gazo2","gazo3"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    let zoomname = zoomimageName[zoomimageNo]
        zoomimage.image=UIImage(named:zoomname)
        // Do any additional setup after loading the view.
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
