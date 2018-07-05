
import UIKit

class Step2ViewController: UIViewController {
    var pastViewController: UIViewController?
    @IBOutlet weak var backButton: UIButton!
    
    @IBAction func triggered(_ sender: Any) {
        
        
        self.navigationController?.popViewController(animated: true)
    }
    // Do any additional setup after loading the view.
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
