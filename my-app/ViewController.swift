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

        let url = URL(string: "https://v2.jokeapi.dev/joke/Any")!

        let task = URLSession.shared.dataTask(with: url) { data, response, error in
//            print(response!)
            do {
                let json = try JSONSerialization.jsonObject(with: data!) as! Dictionary<String, Any>
//                print(json)
                
                
                if(json["setup"] != nil){
                    print((json["setup"]))
                    greetlabel.text = String(json["setup"]) 
                }else if(json["joke"] != nil){
                    print(json["joke"])
                    greetlabel.text = String(describing: json["joke"] ?? "")
                }
//                let ci = json[String(0)] ?? 0
//                print(ci)
         
            } catch {
                print("error")
            }
        }

        task.resume()
        
        
//        if(textField.text!.count>0){
//            greetlabel.textColor = UIColor.black
//            greetlabel.text = "hello \(textField.text!)"
//            //            print(textField.text)
//
//            textField.text = ""
//        }else{
//            greetlabel.textColor = UIColor.red
//            greetlabel.text = "empty text"
//        }

    }
    
    @IBAction func deleteBtn(_ sender: Any) {
        greetlabel.text = ""
    }
}

