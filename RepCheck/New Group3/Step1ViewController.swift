//
//  Step1ViewController.swift
//  RepCheck
//
//  Created by Joel Wall on 30/6/18.
//  Copyright © 2018 Joel Wall. All rights reserved.
//

import UIKit

class Step1ViewController: UIViewController {
    
    @IBOutlet weak var nextButton: UIButton!
    //may need this code later. It's for programatically going to step 2 rather than by storyboard.
    /*
    @IBAction func triggered(_ sender: Any) {
        let viewControllers: [UIViewController] = self.navigationController!.viewControllers
        for aViewController in viewControllers {
            if aViewController is Step2ViewController {
                
                self.show(aViewController, sender:self)
                
                break
            }else{
                let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
                let nextViewController = storyBoard.instantiateViewController(withIdentifier: "step2")
                (nextViewController as! Step2ViewController).pastViewController=self
                self.show(nextViewController, sender:self)
            }
        }
    }*/
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


  //  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {


  //  }


}
