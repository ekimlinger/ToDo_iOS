//
//  MasterTableViewController.swift
//  Do It
//
//  Created by Evan Kimlinger on 7/30/16.
//  Copyright © 2016 Evan Kimlinger. All rights reserved.
//

import UIKit

class MasterTableViewController: UITableViewController {

    var toDoItems:NSMutableArray = NSMutableArray()
    
    required init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)!
    }
    
    override init(style: UITableViewStyle) {
        super.init(style: style)
    }
    
    override func viewDidAppear(animated: Bool) {
        
        var userDefaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        var itemListFromUserDefaults: NSMutableArray? = userDefaults.objectForKey("itemList") as? NSMutableArray
        
        if(itemListFromUserDefaults != nil){
            toDoItems = itemListFromUserDefaults!
        }
        
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDoItems.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell

        var toDoItem:NSDictionary = toDoItems.objectAtIndex(indexPath.row) as! NSDictionary
        
        if(toDoItem.objectForKey("itemCompleted") as! Bool == true){
            cell.backgroundColor = UIColor.lightGrayColor()
//            let gradient : CAGradientLayer = CAGradientLayer()
//            let topColor = UIColor(red: (85/255.0), green: (239/255.0), blue: (203/255.0), alpha: 0.1)
//            let bottomColor = UIColor(red: (91/255.0), green: (202/255.0), blue: (255/255.0), alpha: 0.5)
//            var arrayColors:Array<AnyObject> = [topColor.CGColor, bottomColor.CGColor]
//            gradient.colors=arrayColors
//            gradient.frame = cell.bounds
//            cell.layer.insertSublayer(gradient, atIndex: UInt32(indexPath.row))

        } else{
            cell.backgroundColor! = UIColor.whiteColor()
        }
 
        cell.textLabel!.text = toDoItem.objectForKey("itemTitle") as? String
        
        return cell
    }
    
    
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    
        if (segue != nil && segue!.identifier == "showDetail"){
            var selectedIndexPath:NSIndexPath = self.tableView.indexPathForSelectedRow!
            var detailViewController:DetailViewController = segue!.destinationViewController as! DetailViewController
            detailViewController.toDoData = toDoItems.objectAtIndex(selectedIndexPath.row) as! NSDictionary
            
        }
    
    }
    

}


