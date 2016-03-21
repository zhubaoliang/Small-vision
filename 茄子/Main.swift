//
//  Main.swift
//  茄子
//
//  Created by jake on 16/3/12.
//  Copyright © 2016年 茄子. All rights reserved.
//

import UIKit

class Main: UIViewController {
    let First:Firstview = Firstview.init()
    let Draw:DraVC = DraVC.init()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(Draw.view)
        self.view.addSubview(First.view)
        self.title = "主页"
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("present:"), name: "present", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("pushi:"), name: "push", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("Tabright"), name: "tabright", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("Tableft"), name: "tableft", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "Firstright", name: "firstright", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "Firstleft", name: "firstleft", object: nil)
        
        
    }
    override func viewWillAppear(var animated: Bool) {
        animated = true
        self.tabBarController?.tabBar.transform = CGAffineTransformMakeTranslation(0, 0)
        self.tabBarController?.tabBar.hidden = false
        self.navigationController?.navigationBarHidden = true
    }
    func present(noti:NSNotification)
    {
        let vc:AnyObject = noti.object!
        self.presentViewController(vc as! UIViewController, animated: true, completion: nil)
    }
    func pushi(noti:NSNotification)
    {
        let dd:AnyObject = noti.object!
        self.navigationController?.pushViewController(dd as! UIViewController, animated: true)
        
    }
    func  Tabright()
    {
                UIView.animateWithDuration(1, animations: {
        self.tabBarController?.tabBar.transform = CGAffineTransformMakeTranslation(self.view.frame.width * 3 / 4, 0)
        
        })
        
    }
    func Tableft()
    {
        
                UIView.animateWithDuration(1, animations: {
            self.tabBarController?.tabBar.transform = CGAffineTransformMakeTranslation(0, 0)
            
        })
    }
    
    func Firstright()
    {
        UIView.animateWithDuration(1, animations: {
            self.First.view.transform = CGAffineTransformMakeTranslation( self.view.frame.width * 3 / 4, 0)
        
            
        })
    }
    func Firstleft()
    {
        UIView.animateWithDuration(1, animations: {
        self.First.view.transform = CGAffineTransformMakeTranslation( 0, 0)
        
        
            
        })
    }
    
    
    

}