//
//  ViewController.swift
//  SwiftUITesting
//
//  Created by jun on 2019/09/10.
//  Copyright © 2019 jun. All rights reserved.
//

import UIKit

final class MainsViewController: UIViewController {
    private var presenter: ViewPresenterProtocol!

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var countUpButton: UIButton!
    @IBOutlet weak var profileFetchButton: UIButton!
    
    var num = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImageView.layer.cornerRadius = 8
        profileImageView.layer.masksToBounds = true
        
        countUpButton.layer.cornerRadius = 8
        countUpButton.layer.masksToBounds = true
        countUpButton.backgroundColor = .systemTeal
        
        profileFetchButton.layer.cornerRadius = 8
        profileFetchButton.layer.masksToBounds = true
        profileFetchButton.backgroundColor = .systemPink
        
        countLabel.text = String(num)
    }
    
    
    @IBAction func TapCountUpButton(_ sender: Any) {
        num += 1
        countLabel.text = String(num)
    }
    
    @IBAction func TapProfileFetchButton(_ sender: Any) {
        let imageURLStr = "https://avatars2.githubusercontent.com/u/1089146?v=4"
        
        guard let encodeImageURLStr = imageURLStr.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        guard let url = URL(string: encodeImageURLStr) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, res, err) in
            if let err = err {
                print("Error: \(err.localizedDescription)")
                return
            }
            
            guard let data = data else { return }
            guard let userImage = UIImage(data: data) else { return }
            
            DispatchQueue.main.async {
                self.profileImageView.image = userImage
            }
            
        }.resume()
    }
    

    func inject(with presenter: ViewPresenterProtocol) {
        self.presenter = presenter
        self.presenter.view = self
    }
}

extension MainsViewController: ViewPresenterOutput {

}
