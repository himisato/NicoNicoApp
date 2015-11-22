//
//  ViewController.swift
//  NicoNicoApp
//
//  Created by Himi Sato on 10/28/15.
//  Copyright © 2015 Himi Sato. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var commentTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        commentTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func makeCommentLabel() -> UILabel {
        let label = UILabel()
        label.text = commentTextField.text
        let randY = CGFloat(arc4random()) % (self.view.frame.height - 64) + 64
        label.frame.origin = CGPoint(x: self.view.frame.width, y: randY)
        label.font = UIFont(name: "HirakakuProN-W6", size: CGFloat(arc4random() % 19 + 20))
        label.sizeToFit()
        return label
    }

    @IBAction func tapSubmitButton(sender: UIButton) {
        commentTextField.resignFirstResponder()
        let commentLabel = makeCommentLabel()
        self.view.addSubview(commentLabel)
        NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: "moveComment:", userInfo: commentLabel, repeats: true)
    }
    
    func moveComment(sender: NSTimer){
        let commentlabel = sender.userInfo as! UILabel
        commentlabel.frame.origin.x -= commentlabel.frame.height
    }

    func textFieldShouldReturn(textField: UITextField) -> Bool {
        commentTextField.resignFirstResponder()
        return true
    }
    
}

