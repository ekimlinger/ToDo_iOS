//
//  DetailViewController.swift
//  Do It
//
//  Created by Evan Kimlinger on 7/30/16.
//  Copyright © 2016 Evan Kimlinger. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var notesTextView: UITextView!
    @IBOutlet var completedSwitch: UISwitch!
    
    
    var toDoData : NSDictionary = NSDictionary()
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextField.userInteractionEnabled = false;
        notesTextView.userInteractionEnabled = false;
        completedSwitch.userInteractionEnabled = true;
        
        titleTextField.text = toDoData.objectForKey("itemTitle") as? String
        notesTextView.text = toDoData.objectForKey("itemDetail") as? String
        completedSwitch.on = toDoData.objectForKey("itemCompleted")! as! Bool
        
        //Gradient Background
        let topColor = UIColor(red: (247/255.0), green: (247/255.0), blue: (247/255.0), alpha: 1)
        let bottomColor = UIColor(red: (91/255.0), green: (228/255.0), blue: (255/255.0), alpha: 1)
        
        let gradientColor: [CGColor] = [topColor.CGColor, bottomColor.CGColor]
        let gradientLocations: [Float] = [0.0/1.0]
        
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientColor
        gradientLayer.locations = gradientLocations
        
        gradientLayer.frame = self.view.bounds
        self.view.layer.insertSublayer(gradientLayer, atIndex: 0)
        // end gradient

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func completedTask(sender: AnyObject) {

        var userDefaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        var itemListArray:NSMutableArray = userDefaults.objectForKey("itemList") as! NSMutableArray
        
        var mutableItemList:NSMutableArray = NSMutableArray()
        
        for dict:AnyObject in itemListArray{
            mutableItemList.addObject(dict as! NSMutableDictionary)
        }
        
        var indexToDo:Int = mutableItemList.indexOfObject(toDoData)
        
        var tempDict: NSMutableDictionary = toDoData.mutableCopy() as! NSMutableDictionary
        
        
        if(toDoData.objectForKey("itemCompleted")! as! Bool == false){
            //Task is being completed
            tempDict.removeObjectForKey("itemCompleted");
            tempDict.setObject(true, forKey: "itemCompleted");

        }else{
            //Task is being incompleted
            tempDict.removeObjectForKey("itemCompleted");
            tempDict.setObject(false, forKey: "itemCompleted");
        }
        mutableItemList[indexToDo] = tempDict as! NSDictionary
        
        userDefaults.removeObjectForKey("itemList")
        userDefaults.setObject(mutableItemList, forKey: "itemList")
        userDefaults.synchronize()
        
        self.navigationController?.popToRootViewControllerAnimated(true)
        
    }
    
    
    
    @IBAction func deleteItem(sender: AnyObject) {
        
        var userDefaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        var itemListArray:NSMutableArray = userDefaults.objectForKey("itemList") as! NSMutableArray
        
        var mutableItemList:NSMutableArray = NSMutableArray()
        
        for dict:AnyObject in itemListArray{
            mutableItemList.addObject(dict as! NSDictionary)
        }
        
        mutableItemList.removeObject(toDoData)
        
        userDefaults.removeObjectForKey("itemList")
        userDefaults.setObject(mutableItemList, forKey: "itemList")
        userDefaults.synchronize()
        
        self.navigationController?.popToRootViewControllerAnimated(true)
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
