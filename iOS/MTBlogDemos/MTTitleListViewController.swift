//
//  MTTitleListViewController.swift
//  MTBlogDemos
//
//  Created by LiMengtian on 2018/4/5.
//  Copyright © 2018 LiMengtian. All rights reserved.
//

import UIKit

class MTTitleListViewController: UIViewController {
    
    var modelList: [MTItemModel] = MTBlogDemosModel.index
    var modelTitle: String = "MTBlogDemos"
    
    fileprivate var tableView: UITableView!
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //DBEUB
//        let vc = MTLayerDelegateViewController()
//        self.navigationController?.pushViewController(vc, animated: true)
        
        //
        
        self.title = modelTitle
        self.setupTableView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - UI
    fileprivate func setupTableView() {
        tableView = UITableView(frame: self.view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }

}

//MARK: - UITableViewDataSource

extension MTTitleListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let item = modelList[indexPath.row]
        cell.textLabel?.text = item.itemName

        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelList.count
    }
}

//MARK: - UITableViewDelegate

extension MTTitleListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let item = modelList[indexPath.row]
        
        if let modelList = item.subModels, modelList.count > 0 {
            let listVC = MTTitleListViewController()
            listVC.modelList = modelList
            listVC.modelTitle = item.itemName
            self.navigationController?.pushViewController(listVC, animated: true)
        } else if let targetControllerClass = item.targetController as? UIViewController.Type  {
            let vc = targetControllerClass.init()
            self.navigationController?.pushViewController(vc, animated: true)
            
        }
    }
}
