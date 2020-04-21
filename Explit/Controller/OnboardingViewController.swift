//
//  OnboardingViewController.swift
//  Explit
//
//  Created by Maulana on 08/04/20.
//  Copyright © 2020 Apple Developer Academy. All rights reserved.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet weak var imageSlider: UIScrollView!
    @IBOutlet weak var paginationSlider: UIPageControl!
    
    var scrollWidth: CGFloat! = 0.0
    var scrollHeight: CGFloat! = 0.0
       
    var captions = [Const.caption.onboardCaptionPage1, Const.caption.onboardCaptionPage2]
    var images = [Const.image.imageOnboardPage1, Const.image.imageOmboardPage2]
    
    override func viewDidLayoutSubviews() {
           scrollWidth = imageSlider.frame.size.width
           scrollHeight = imageSlider.frame.size.height
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.layoutIfNeeded()
        
        self.imageSlider.delegate = self
        imageSlider.isPagingEnabled = true
        imageSlider.showsHorizontalScrollIndicator = false
        imageSlider.showsVerticalScrollIndicator = false
        
        var frame = CGRect(x:0, y:0, width: 0, height: 0)
        
        for index in 0..<captions.count {
            frame.origin.x = scrollWidth * CGFloat(index)
            frame.size = CGSize(width: scrollWidth, height: scrollHeight)
            
            let slider = UIView(frame: frame)
            
            let imageView = UIImageView.init(image: UIImage.init(named: images[index]))
            
            imageView.frame = CGRect(x:0,y:0,width: 315,height: 140)
            imageView.contentMode = .scaleAspectFit
            imageView.center = CGPoint(x:scrollWidth/2,y: scrollHeight/2 - 15)
            
            let caption = UILabel.init(frame: CGRect(x:32,y:imageView.frame.maxY+20,width:scrollWidth-68,height:72))
            caption.numberOfLines = 3
            caption.textAlignment = .center
            caption.font = UIFont.systemFont(ofSize: 16.0)
            caption.textColor = UIColor.white
            
            caption.text = captions[index]
            
            slider.addSubview(imageView)
            slider.addSubview(caption)
            imageSlider.addSubview(slider)
        }
        
        imageSlider.contentSize = CGSize(width: scrollWidth * CGFloat(captions.count), height: scrollHeight)
        
        self.imageSlider.contentSize.height = 1.0
        
        paginationSlider.numberOfPages = captions.count
        paginationSlider.currentPage = 0
        
    }
    
     @IBAction func changePage(_ sender: Any) {
            imageSlider!.scrollRectToVisible(CGRect(x: scrollWidth * CGFloat ((paginationSlider?.currentPage)!), y: 0, width: scrollWidth, height: scrollHeight), animated: true)
        }
        
        func scrollViewDidEndDecelerating(_ imageSLider: UIScrollView) {
            setIndiactorForCurrentPage()
        }
        
        func setIndiactorForCurrentPage()  {
            let page = (imageSlider?.contentOffset.x)!/scrollWidth
            paginationSlider?.currentPage = Int(page)
        }
    }

    extension OnboardingViewController: UIScrollViewDelegate {
        
    }
