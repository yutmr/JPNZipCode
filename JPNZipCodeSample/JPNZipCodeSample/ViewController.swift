//
//  ViewController.swift
//  JPNZipCodeSample
//
//  Created by YuTamura on 2015/03/15.
//  Copyright (c) 2015年 YuTamura. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var textField: UITextField?
    @IBOutlet var label: UILabel?
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func searchAddress(sender: AnyObject) {
        var zipCode = self.textField?.text
        JPNZipCode.get(zipCode, completionHandler: { (response, error) -> Void in
            if response != nil {
                var status: NSNumber = response!["code"]! as! NSNumber
                
                switch (status.compare(400)) {
                    case .OrderedSame, .OrderedDescending:
                        break;
                    case .OrderedAscending:
                        var address = response!["data"]!["fullAddress"]! as! String
                        dispatch_async(dispatch_get_main_queue(), {
                            self.label!.text = address;
                        })
                        break;
                }
            }
        })
    }
}

