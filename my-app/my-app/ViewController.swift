//
//  ViewController.swift
//  my-app
//
//  Created by Aryan on 01/11/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var greetlabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func greetbtn(_ sender: Any) {

//        let url = URL(string: "https://bit.ly/2LMtByx")!

        let url = URL(string: "https://bit.ly/2LMtByx")!

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                let image = UIImage(data: data)
            } else if let error = error {
                print("HTTP Request Failed \(error)")
            }
        }

        task.resume()
        
        
        if(textField.text!.count>0){
            greetlabel.textColor = UIColor.black
            greetlabel.text = "hello \(textField.text!)"
            //            print(textField.text)
            
            textField.text = ""
        }else{
            greetlabel.textColor = UIColor.red
            greetlabel.text = "empty text"
        }

    }
    
    @IBAction func deleteBtn(_ sender: Any) {
        greetlabel.text = ""
    }
}

