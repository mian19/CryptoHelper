//
//  ViewController.swift
//  CryptoHelper
//
//  Created by Kyzu on 22.04.22.
//

import UIKit

class CryptoViewController: UIViewController{
        
    private var tableView: UITableView!
    private var viewModels = [CryptoTableViewCellViewModel]()
    
    
    override func loadView() {
        let customView = UIView(frame: UIScreen.main.bounds)
        view = customView
        tableView = UITableView(frame: view.bounds)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CryptoTableViewCell.self, forCellReuseIdentifier: CryptoTableViewCell.identifier)
        view.addSubview(tableView)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Crypto coins"
        
        APICaller.shared.getAllCryptoData{[weak self] result in
            
            switch result {
            case .success(let models):
                self?.viewModels = models.compactMap({CryptoTableViewCellViewModel(
                    name: $0.name ?? "" , symbol: $0.symbol ?? "" , price: $0.price ?? ""
                )})
                
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
            
        }

       
    }
    
//    private func setElements() {
//        NSLayoutConstraint.activate([
//
//
//
//        ])
//    }


}

extension CryptoViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CryptoTableViewCell.identifier, for: indexPath) as! CryptoTableViewCell
        cell.configure(with: viewModels[indexPath.row])
        cell.backgroundColor = .orange
        return cell
    }
}

