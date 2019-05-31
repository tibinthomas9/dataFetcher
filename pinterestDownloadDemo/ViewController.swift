//
//  ViewController.swift
//  pinterestDownloadDemo
//
//  Created by Tibin Thomas on 13/05/19.
//  Copyright © 2019 tibin. All rights reserved.
//

import UIKit
import dataFetcher
class ViewController: UIViewController {
    var tableView : UITableView = {
        var tv = UITableView(frame: CGRect.zero, style: .grouped)
        return tv
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        tableView.tableHeaderView = nil
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        tableView.backgroundColor = UIColor.green
                // Do any additional setup after loading the view, typically from a nib.
    }

}
extension ViewController : UITableViewDelegate{
    
}
extension ViewController : UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "tvcell")
        cell.textLabel?.text = "sdsdsdsdsdsdddsds1"
        cell.imageView?.image = UIImage()
        if let url = URL(string: "https://homepages.cae.wisc.edu/~ece533/images/airplane.png"),indexPath.row % 2 == 0{
            let request = ImageRequest(url:url)
            request.load { (image) in
                DispatchQueue.main.async {
                    cell.imageView?.image = image
                    cell.setNeedsLayout()
                }
            }
        }
        cell.selectionStyle = .blue
        return cell
    }
    
    
}

