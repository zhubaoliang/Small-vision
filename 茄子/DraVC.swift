//
//  DraVC.swift
//  茄子
//
//  Created by jake on 16/3/11.
//  Copyright © 2016年 茄子. All rights reserved.
//

import UIKit

class DraVC: UIViewController {
    let home:UIButton = UIButton.init()
    let set:UIButton = UIButton.init()
    let about:UIButton = UIButton.init()
    let timebook:UIButton = UIButton.init()
    let privilege:UIButton = UIButton.init()
    let nologin:UIButton = UIButton.init()
    override func viewDidLoad() {
        super.viewDidLoad()
        Gestures()
        BuidbuttonForDra()
        self.view.backgroundColor = UIColor(colorLiteralRed: 0.2, green: 0.8, blue: 1, alpha: 1)
    }
    func Gestures()
    {
        let leftgesture :UISwipeGestureRecognizer = UISwipeGestureRecognizer.init(target: self, action: Selector("BackDraw"))
        leftgesture.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(leftgesture)
    }
    
    func BuidbuttonForDra()
    {
        home.frame = CGRectMake(self.view.frame.width  / 6, self.view.frame.height * 3 / 9, self.view.frame.width / 2, self.view.frame.width / 9)
        home.setTitle("首页", forState: UIControlState.Normal)
        home.backgroundColor = UIColor(colorLiteralRed: 0.2, green: 0.8, blue: 1, alpha: 1)
        home.tag = 1
        home.addTarget(self, action: Selector("ButtonActions:"), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(home)
        set.frame = CGRectMake(self.view.frame.width / 6, self.view.frame.height * 4 / 9, self.view.frame.width / 2, self.view.frame.width / 9)
        set.setTitle("设置", forState: UIControlState.Normal)
        set.backgroundColor = UIColor(colorLiteralRed: 0.2, green: 0.8, blue: 1, alpha: 1)
        set.tag = 2
        set.addTarget(self, action: Selector("ButtonActions:"), forControlEvents: UIControlEvents.TouchDown)
        self.view.addSubview(set)
        about.frame = CGRectMake(self.view.frame.width / 6, self.view.frame.height * 5 / 9, self.view.frame.width / 2, self.view.frame.width / 9)
        about.setTitle("关于", forState: UIControlState.Normal)
        about.backgroundColor = UIColor(colorLiteralRed: 0.2, green: 0.8, blue: 1, alpha: 1)
        about.tag = 3
        self.view.addSubview(about)
        timebook.frame = CGRectMake(self.view.frame.width / 6, self.view.frame.height * 6 / 9, self.view.frame.width / 2, self.view.frame.width / 9)
        timebook.setTitle("时光轴", forState: UIControlState.Normal)
        timebook.backgroundColor = UIColor(colorLiteralRed: 0.2, green: 0.8, blue: 1, alpha: 1)
        timebook.tag = 4
        self.view.addSubview(timebook)
        privilege.frame = CGRectMake(self.view.frame.width / 6, self.view.frame.height * 7 / 9, self.view.frame.width / 2, self.view.frame.width / 9)
        privilege.setTitle("优惠", forState: UIControlState.Normal)
        privilege.backgroundColor = UIColor(colorLiteralRed: 0.2, green: 0.8, blue: 1, alpha: 1)
        privilege.tag = 5
        self.view.addSubview(privilege)
        nologin.frame = CGRectMake(self.view.frame.width / 6, self.view.frame.height * 8 / 9, self.view.frame.width / 2, self.view.frame.width / 9)
        nologin.setTitle("退出登录", forState: UIControlState.Normal)
        nologin.backgroundColor = UIColor(colorLiteralRed: 0.2, green: 0.8, blue: 1, alpha: 1)
        nologin.tag = 6
        nologin.addTarget(self, action: Selector("ButtonActions:"), forControlEvents: UIControlEvents.TouchDown)
        self.view.addSubview(nologin)
    }
    
    func ButtonActions(btn:UIButton)
    {

        switch btn.tag
        {
            case 1:
                print("dravc")
            
            ///case 2:
            //print("kk")
            //case 3:
            //case 4:
            //case 5:
            case 6:
                    let Userlogin:login = login.init()
                NSNotificationCenter.defaultCenter().postNotificationName("push", object: Userlogin)
        default:
            print("Error")
            
            
        }
    }
    func BackDraw()
    {
        NSNotificationCenter.defaultCenter().postNotificationName("tableft", object: nil)
            NSNotificationCenter.defaultCenter().postNotificationName("firstleft", object: nil)
    }
    }