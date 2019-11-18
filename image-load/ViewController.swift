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
        
        let string = "https://www.meme-arsenal.com/memes/f6aab486a6eac6412a1918238ec53390.jpg"
        guard let url = URL(string: string) else { return }
        let task = URLSession.shared.dataTask(with: url) {
            (data, response, error) in
            print ("Done!")
            
            if let response = response as? HTTPURLResponse {
                print (response.statusCode)
            }
            
            guard let data = data else { return }
            
            DispatchQueue.main.async {
                let image = UIImage(data:data)
                self.imageView.image = image
            }
        }
        task.resume()
        
        // Json
        
        let stringUrl = "http://api.open-notify.org/astros.json"
        guard let url_json = URL(string: stringUrl) else { return }
        
        let task_json = URLSession.shared.dataTask(with: url_json) {
            (data, response, error) in
            guard error == nil else {
                print (error?.localizedDescription ?? "noDesc")
                return
            }
            
            guard let data = data else { return }
            guard let spaceInfo = try? JSONDecoder().decode(SpaceInfo.self, from: data) else {
                print ("Error: can`t parse SpaceInfo")
                return
            }
            
            print (spaceInfo)
            
            let uniqueSpacecrafts = Set(spaceInfo.people.map { $0.craft })
            print (uniqueSpacecrafts)
           
            
        }
        
        task_json.resume()
        
        
    }


}

