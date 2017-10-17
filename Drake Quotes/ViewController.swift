//
//  ViewController.swift
//  Drake Quotes
//
//  Created by Patrick Conrey on 10/17/17.
//  Copyright © 2017 ConreyDesigns. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Constants and properties
    
    var refreshCount: Int = 1
    
    //MARK: - Outlets
    
    @IBOutlet weak var imgBackground: UIImageView!
    
    @IBOutlet weak var lblQuote: UILabel!
    
    @IBOutlet weak var lblSongTitle: UILabel!
    
    @IBOutlet weak var btnRefresh: UIButton!
    
    //MARK: - Lifecycle methods

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // initial quote fetch
        // fetchQuote()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - Actions
    
    @IBAction func didTapRefresh(_ sender: Any) {
        // refresh quote information
        fetchQuote()
    }
    
    //MARK: - Methods

    /**
     Will fetch information from appropriate endpoint and populate
     quote and song title
     */
    func fetchQuote() {
        
        refreshCount += 1
        let imageIndex = String(describing: refreshCount % 5)
        imgBackground.image = UIImage(named: imageIndex)
        
        // clear out current values
        lblQuote.text = ""
        lblSongTitle.text = ""
        
        // create String reference to endpoint, cast as Request object,
        // fetch information from response
        let endpoint = "url-of-endpoint"
        if let url = URL(string: endpoint) {
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
                
                // check for errors
                if error != nil {
                    // handle error appropriately
                }
                
                // make sure that data isn't nil
                guard let information = data else {
                    // handle error appropriately
                    return
                }
                
                // All good! Process information here
            })
            
        }
        
        
    }

}

