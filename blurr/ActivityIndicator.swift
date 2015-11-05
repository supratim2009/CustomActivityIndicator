//
//  ActivityIndicator.swift
//  RoomFinder
//
//  Created by 01HW612323 on 05/11/15.
//  Copyright © 2015 Meijer. All rights reserved.
//

import UIKit

class ActivityIndicator:UIView {

    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet var view: UIView!
    
    @IBOutlet weak var bgView: UIView!
    var isModal:Bool = false
    
    

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadFromXIB()
        
    }
    
    func makeAutolayoutCompliant() {
        self.view.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func configureModalBackGround(color bgcolor:UIColor = UIColor.blackColor(), opacity alpha:Float = 0.3) {
        if isModal {
            bgView.backgroundColor = bgcolor
            bgView.layer.opacity = alpha
        }
    }
    
    func loadFromXIB() {
        let nib = UINib(nibName: "ActivityIndicatorView", bundle: NSBundle .mainBundle())
        self.view = nib .instantiateWithOwner(self, options: nil)[0] as! UIView
        makeAutolayoutCompliant()
    }
    
    func showActivityIndicator(inView container:UIView) {
        container .addSubview(self.view!)
        if isModal {
            configureModalIndicatorView(inView: container)
        } else {
            configureNonModalIndicator(inView: container)
        }
        activityIndicatorView.startAnimating()
        container.bringSubviewToFront(self.view!)
    }
    func stopActivityIndicator(fromView container:UIView) {
        activityIndicatorView.stopAnimating()
        self.view! .removeFromSuperview()
        container.userInteractionEnabled = true
    }
    
    func requiresDefaultConfiguration() -> Bool {
        if (bgView.backgroundColor == UIColor.clearColor() && bgView.layer.opacity == 1) {
            return true
        } else {
            return false
        }
    }
    
    private func configureModalIndicatorView (inView container:UIView) {
        if requiresDefaultConfiguration() == true {
            configureModalBackGround()
        }
        
        let dictView = [ "View":self.view!]
        addZeroMarginConstraints(on: container, withViewDictionary: dictView)
        container.userInteractionEnabled = false
    }
    
    private func configureNonModalIndicator(inView container:UIView) {
        addCenter_CenterConstraints(container, forView: self.view!)
        let heightConstraints = NSLayoutConstraint(item: self.view!, attribute: NSLayoutAttribute.Height, relatedBy: .Equal, toItem:nil , attribute: NSLayoutAttribute.Height, multiplier: 1, constant: 200.0)
        let lengthConstraints = NSLayoutConstraint(item: self.view!, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.Width, multiplier: 1, constant: 200.0)
        
        container.addConstraints([heightConstraints,lengthConstraints])
        
    }
    
    func addZeroMarginConstraints(on view:UIView, withViewDictionary dictionary:[String:UIView]) {
        let hConstraints = NSLayoutConstraint .constraintsWithVisualFormat("H:|-0-[\(dictionary.keys.first!)]-0-|", options: NSLayoutFormatOptions.AlignAllLeft, metrics: nil, views: dictionary)
        let vConstraints = NSLayoutConstraint .constraintsWithVisualFormat("V:|-0-[\(dictionary.keys.first!)]-0-|", options: .AlignAllTop, metrics: nil, views: dictionary)
        view .addConstraints(hConstraints)
        view .addConstraints(vConstraints)
    }
    
    func addCenter_CenterConstraints(container:UIView, forView subview:UIView) {
        let centerXConstraints = NSLayoutConstraint(item: subview, attribute: .CenterX, relatedBy: .Equal, toItem: container, attribute: .CenterX, multiplier: 1, constant: 0)
        let centerYConstraints = NSLayoutConstraint(item: subview, attribute: .CenterY, relatedBy: .Equal, toItem: container, attribute: .CenterY, multiplier: 1, constant: 0)
        container .addConstraints([centerXConstraints,centerYConstraints])
    }
    
}
