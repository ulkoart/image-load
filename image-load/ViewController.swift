//
//  ViewController.swift
//  image-load
//
//  Created by user on 18/11/2019.
//  Copyright © 2019 Artem Ulko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let string = "https://sun9-27.userapi.com/c847018/v847018449/1e6518/2h2CfUJH-Ws.jpg?ava=1"
        guard let url = URL(string: string) else { return }
        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            print ("Done!")
            guard let data = data else { return }
            
            DispatchQueue.main.async {
                let image = UIImage(data:data)
                self.imageView.image = image
            }
        }
        task.resume()
    }


}

