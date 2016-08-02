//
//  AddViewController.swift
//  Do It
//
//  Created by Evan Kimlinger on 7/30/16.
//  Copyright © 2016 Evan Kimlinger. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var notesTextView: UITextView!
    
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        view.addGestureRecognizer(tap)
        
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

        // Do any additional setup after loading the view.
    }
    
    //Calls this function when the tap is recognized.
    func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func doneButtonPressed(sender: AnyObject) {

        var userDefaults:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        var itemList:NSMutableArray? = userDefaults.objectForKey("itemList") as? NSMutableArray
        
        var dataSet:NSMutableDictionary = NSMutableDictionary()
        dataSet.setObject(titleTextField.text!, forKey: "itemTitle")
        dataSet.setObject(notesTextView.text, forKey: "itemDetail")
        dataSet.setObject(false, forKey: "itemCompleted")
        
        if itemList != nil{

            var newMutableList:NSMutableArray = NSMutableArray();
            
            for dict:AnyObject in itemList! {
                newMutableList.addObject(dict as! NSDictionary)
            }
            
            userDefaults.removeObjectForKey("itemList")
            newMutableList.insertObject(dataSet, atIndex: 0)
            userDefaults.setObject(newMutableList, forKey: "itemList")
            
            
        } else{
            userDefaults.removeObjectForKey("itemList")
            itemList = NSMutableArray()
            itemList!.addObject(dataSet)
            userDefaults.setObject(itemList, forKey: "itemList")
            
        }
        
        userDefaults.synchronize()
        
        self.navigationController!.popToRootViewControllerAnimated(true)
        
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
