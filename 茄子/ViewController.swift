//
//  ViewController.swift
//  茄子
//
//  Created by jake on 16/3/8.
//  Copyright © 2016年 茄子. All rights reserved.

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate {
    let Dra:DraVC = DraVC.init()
    let Tool:UIToolbar = UIToolbar.init()
    let Nav:UINavigationBar = UINavigationBar.init()
    let Titilescroll: UIScrollView = UIScrollView.init()
    let rect: CGRect = UIApplication.sharedApplication().statusBarFrame
    let all:All = All.init()
    let school:School = School.init()
    let streetphoto :Streetphoto = Streetphoto.init()
    let graduate :Graduate = Graduate.init()
    let snow:Snow = Snow.init()
    let Button1: UIButton = UIButton.init(frame: CGRectMake(0, 0, 100, 46))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("pushi:"), name: "push", object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("AnimationForDraw"), name: "backhome", object: nil)
       
        Buildbar()
        SetToolbar()
        SetUserPhoto()
        SetNavigationbar()
        SetTitilescrollview()
        SetButtonForTitleScrollview()
        self.addChildViewController(Dra)
    }

    override func viewWillAppear(var animated: Bool) {
        self.navigationController?.navigationBarHidden = true
        animated = true
        Buttonaction(Button1)
        self.view.transform = CGAffineTransformMakeTranslation( 0, 0)
    }
        func Buildbar()
    {
        Nav.frame = CGRectMake(0, 0, (self.navigationController?.navigationBar.frame.width)!, (self.navigationController?.navigationBar.frame.height)! + rect.height)
        self.view.addSubview(Nav)
    }
    
    func SetUserPhoto()
    {
        let User: UIImageView = UIImageView.init(frame: CGRectMake(10, 0, self.navigationController!.navigationBar.frame.height, self.navigationController!.navigationBar.frame.height))
        User.layer.masksToBounds = true
        User.layer.cornerRadius = self.navigationController!.navigationBar.frame.height / 2
        User.layer.borderWidth = 2
        User.layer.borderColor = UIColor.whiteColor().CGColor
        User.image = UIImage.init(named: "user.jpg")
        User.userInteractionEnabled = true
        let TouchGesture:UITapGestureRecognizer = UITapGestureRecognizer.init(target: self, action: Selector("Ueraction"))
        User.addGestureRecognizer(TouchGesture)
        self.Tool.addSubview(User)
    }
    
    func Ueraction()
    {
        
        
        self.view.addSubview(childViewControllers[0].view)
        childViewControllers[0].view.transform = CGAffineTransformMakeTranslation( -self.view.frame.width , 0)
        let leftgesture :UISwipeGestureRecognizer = UISwipeGestureRecognizer.init(target: self, action: Selector("AnimationForDraw"))
        leftgesture.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(leftgesture)

        UIView.animateWithDuration(1, animations: {
                    if(self.view.frame.origin.x != 0)
            {
                self.view.transform = CGAffineTransformMakeTranslation( 0, 0)
                self.tabBarController?.tabBar.transform = CGAffineTransformMakeTranslation( 0, 0)
                
            }
            else
                    {
                        self.view.transform = CGAffineTransformMakeTranslation( self.view.frame.width * 3 / 4, 0)
                        self.tabBarController?.tabBar.transform = CGAffineTransformMakeTranslation( self.view.frame.width * 3 / 4, 0)

            
            }
            }, completion: {
                
                (Bool finished) in
                if(self.view.frame.origin.x == 0)
                {
                self.childViewControllers[0].view.removeFromSuperview()
                }
                
            }
        )
        
    }
    func AnimationForDraw()
    {
        UIView.animateWithDuration(1, animations: {
            self.view.transform = CGAffineTransformMakeTranslation( 0, 0)
            self.tabBarController?.tabBar.transform = CGAffineTransformMakeTranslation( 0, 0)
            
        
            }, completion: {
                (Bool finished) in
                self.childViewControllers[0].view.removeFromSuperview()
        
        })
        
        
    }
    func SetTitilescrollview()
    {

        Titilescroll.backgroundColor = UIColor.blackColor()
        Titilescroll.frame = CGRectMake(0, (self.navigationController?.navigationBar.frame.height)! + rect.height + 1,self.view.frame.width , 46)
        Titilescroll.contentSize = CGSizeMake(500 , 0)
        self.automaticallyAdjustsScrollViewInsets = false
        
    }
    
    func SetNavigationbar()
    {
        self.title = "主页"
        self.Nav.barTintColor = UIColor.blackColor()
        self.Nav.translucent = false
    }
    
    func SetToolbar()
    {
        Tool.frame = CGRectMake(0, 20, self.view.frame.width, 40)
        Tool.backgroundColor = UIColor.blackColor()
        Tool.barTintColor = UIColor.blackColor()
        Tool.translucent = false
        self.view.addSubview(Tool)
        let titilelable:UILabel = UILabel.init()
        titilelable.frame = CGRectMake(self.view.frame.width / 2 - 25 , 0 , 50 , Tool.frame.height )
        titilelable.text = "推荐"
        titilelable.backgroundColor = UIColor.blackColor()
        titilelable.textColor = UIColor.whiteColor()
        Tool.addSubview(titilelable)
    }

    func SetButtonForTitleScrollview()
    {
        
        Button1.backgroundColor = UIColor.blackColor()
        Button1.setTitle("全部", forState: UIControlState.Normal)
        Button1.addTarget(self, action: Selector("Buttonaction:"), forControlEvents: UIControlEvents.TouchDown)
        Button1.tag = 1
        self.Titilescroll.addSubview(Button1)
        let Button2: UIButton = UIButton.init(frame: CGRectMake(100, 0, 100, 46))
        Button2.backgroundColor = UIColor.blackColor()
        Button2.setTitle("校园", forState: UIControlState.Normal)
        Button2.addTarget(self, action: Selector("Buttonaction:"), forControlEvents: UIControlEvents.TouchDown)
        Button2.tag = 2
        self.Titilescroll.addSubview(Button2)
        let Button3: UIButton = UIButton.init(frame: CGRectMake(200, 0, 100, 46))
        Button3.backgroundColor = UIColor.blackColor()
        Button3.addTarget(self, action: Selector("Buttonaction:"), forControlEvents: UIControlEvents.TouchDown)
        Button3.tag = 3
        Button3.setTitle("街拍", forState: UIControlState.Normal)
        self.Titilescroll.addSubview(Button3)
        let Button4: UIButton = UIButton.init(frame: CGRectMake(300, 0, 100, 46))
        Button4.backgroundColor = UIColor.blackColor()
        Button4.setTitle("唯美毕业季", forState: UIControlState.Normal)
        Button4.addTarget(self, action: Selector("Buttonaction:"), forControlEvents: UIControlEvents.TouchDown)
        Button4.tag = 4
        self.Titilescroll.addSubview(Button4)
        let Button5: UIButton = UIButton.init(frame: CGRectMake(400, 0, 100, 46))
        Button5.backgroundColor = UIColor.blackColor()
        Button5.setTitle("雪景", forState: UIControlState.Normal)
        Button5.addTarget(self, action: Selector("Buttonaction:"), forControlEvents: UIControlEvents.TouchDown)
        Button5.tag = 5
        self.Titilescroll.addSubview(Button5)
        self.view.addSubview(Titilescroll)
        
    }
    
    func Buttonaction(btn:UIButton)
    {
        switch btn.tag
        {
        case 1:
            Clearviews()
            all.view = SetFrameForViewOfTitleview(all)
            self.view.addSubview(all.view)
        case 2 :
            Clearviews()
            school.view = SetFrameForViewOfTitleview(school)
            self.view.addSubview(school.view)
            
        case 3 :
            Clearviews()
            streetphoto.view = SetFrameForViewOfTitleview(streetphoto)
            self.view.addSubview(streetphoto.view)
        case 4 :
            Clearviews()
            graduate.view = SetFrameForViewOfTitleview(graduate)
            self.view.addSubview(graduate.view)
        case 5 :
            Clearviews()
            snow.view = SetFrameForViewOfTitleview(snow)
            self.view.addSubview(snow.view)
        default:
            print("null")
            
        }
    }
    
    func pushi(noti:NSNotification)
    {
        
        let dd:AnyObject = noti.object!
        self.navigationController?.pushViewController(dd as! UIViewController, animated: true)
    }
    func Clearviews ()
    {    let views: [UIView] = self.view.subviews
        for willdestroyed in views
        {
            if(willdestroyed == self.all.view || willdestroyed == self.streetphoto.view || willdestroyed == school.view || willdestroyed == graduate.view || willdestroyed == snow.view)
            {
                willdestroyed.removeFromSuperview()
            
            }
        }
        
    }
    
    func SetFrameForViewOfTitleview(willset:UIViewController) ->UIView
    {
        willset.view.frame = CGRectMake(0, (self.navigationController?.navigationBar.frame.height)! + rect.height + 1 + 46, self.view.frame.width, self.view.frame.height - (self.tabBarController?.tabBar.frame.height)!)
        return willset.view
    }
    
    func SetUserPicture()
    {
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

}

