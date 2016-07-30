//
//  AddViewController.swift
//  Do It
//
//  Created by Evan Kimlinger on 7/30/16.
//  Copyright © 2016 Evan Kimlinger. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var notesTextView: UITextView!
    
    @IBAction func doneButtonPressed(sender: AnyObject) {
        var dataSet : NSMutableDictionary
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
