//
//  ViewController.swift
//  I Spy
//
//  Created by Nash Clinton on 11/15/24.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
           super.viewDidLoad()
           
           scrollView.delegate = self
           
           scrollView.contentSize = imageView.bounds.size
       }

       func viewForZooming(in scrollView: UIScrollView) -> UIView? {
           return imageView
       }
       
       func updateZoomFor(size: CGSize) {

           let widthScale = size.width / imageView.bounds.width
           let heightScale = size.height / imageView.bounds.height
           
           let scale = min(widthScale, heightScale)
           
           scrollView.minimumZoomScale = scale
           scrollView.zoomScale = scale
       }
       
       override func viewDidAppear(_ animated: Bool) {
           super.viewDidAppear(animated)
           
           updateZoomFor(size: scrollView.bounds.size)
       }
       

       override func viewDidLayoutSubviews() {
           super.viewDidLayoutSubviews()
           
           updateZoomFor(size: scrollView.bounds.size)
       }
   }
