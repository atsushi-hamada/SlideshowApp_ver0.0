//
//  ViewController.swift
//  SlideshowApp
//
//  Created by cpcadmin on 2024/02/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    let imageName = ["gazo1","gazo2","gazo3"]
    var imageNo = 0
    var timer:Timer!
    var playState = 0
    
    @IBAction func unwind(_segue: UIStoryboardSegue){
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        image.isUserInteractionEnabled = true
        image.addGestureRecognizer(UITapGestureRecognizer(target: self,action:#selector(imageTapped(_:))))
    }
    @objc func imageTapped(_ sender: UITapGestureRecognizer){
        self.performSegue(withIdentifier: "toZoom", sender: self)
        }
    override func prepare(for segue:UIStoryboardSegue, sender: Any?){
        let zoomViewController : ZoomViewController = segue.destination as! ZoomViewController
        stop()
        zoomViewController.zoomimageNo = imageNo
    }
    @objc func updateTimer(_ timer: Timer){
        if playState == 1{
            nextpic()
        }
    }
    
    func stop(){
        playState = 0
        playButton.setTitle("再生", for:.normal)
        nextButton.isEnabled = true
        backButton.isEnabled = true
        playState = 0
        if self.timer != nil {
            self.timer.invalidate()
            self.timer = nil
        }
    }
    
    func play(){
        playState = 1
        playButton.setTitle("停止", for:.normal)
        nextButton.isEnabled = false
        backButton.isEnabled = false
        if self.timer == nil{
            self.timer = Timer.scheduledTimer(timeInterval: 2, target:self, selector: #selector(updateTimer(_:)), userInfo:nil, repeats:true)
        }
    }
    
    func nextpic(){
        self.imageNo += 1
        if imageNo >= imageName.count{
            imageNo = 0
        }
        let name = imageName[imageNo]
        image.image=UIImage(named:name)
    }
    
    @IBAction func saisei(_ sender: Any) {
        if playState == 0{
            play()
        }else if playState == 1{
            stop()
        }
    }
    
    @IBAction func susumu(_ sender: Any) {
        nextpic()
    }
    
    @IBAction func mdooru(_ sender: Any) {
        self.imageNo -= 1
        if imageNo < 0{
            imageNo = imageName.count-1
        }
        let name = imageName[imageNo]
        image.image=UIImage(named:name)
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue){
    }
}

