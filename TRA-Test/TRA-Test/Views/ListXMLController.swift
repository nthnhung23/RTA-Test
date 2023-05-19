//
//  ListXMLController.swift
//  TRA-Test
//
//  Created by Hồng Nhung on 19/05/2023.
//

import UIKit

class ListXMLController: UIViewController {
    @IBOutlet weak var tbvListXML: UITableView!
    @IBOutlet weak var titleLabel: UILabel!

    private var listPathXML: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.fetchData()
        self.setupTBV()
    }
    
    private func setupTBV() {
        self.tbvListXML.register(
            UINib(nibName: "ItemCell", bundle: nil),
            forCellReuseIdentifier: ItemCell.identifier
        )
        
        self.tbvListXML.delegate = self
        self.tbvListXML.dataSource = self
    }
    
    private func setupView() {
        self.titleLabel.text = "List XML"
    }
    
    private func fetchData() {
        let enumerator = FileManager.default.enumerator(atPath: URL_DEVICE)
        if let filePaths = enumerator?.allObjects as? [String] {
            let txtFilePaths = filePaths.filter{$0.contains(".xml")}
            listPathXML = txtFilePaths
        }
    }
}

//MARK:
extension ListXMLController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listPathXML.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: ItemCell.identifier,
            for: indexPath
        ) as? ItemCell else {
            return UITableViewCell()
        }
        
        cell.bind(with: listPathXML[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
