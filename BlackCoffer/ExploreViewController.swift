//
//  ExploreViewController.swift
//  BlackCoffer
//
//  Created by Gokul Murugan on 20/11/23.
//

import UIKit

class ExploreViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var detailsTableView: UITableView!
    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var searchBar: UISearchBar!
    
    lazy var titleStackView: UIStackView = {
        let titleLabel = UILabel()
        titleLabel.textAlignment = .left
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.text = "Howdy! Gokul Murugan"
        titleLabel.textColor = .white
        let subtitleLabel = UILabel()
        subtitleLabel.textAlignment = .left
        subtitleLabel.font = UIFont.systemFont(ofSize: 12)
        subtitleLabel.text = "Pollachi, Coimbatore"
        subtitleLabel.textColor = .white
        let stackView = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
        stackView.axis = .vertical
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "DetailsTableViewCell", bundle: nil)
        detailsTableView.register(nib, forCellReuseIdentifier: DetailsTableViewCell.identifier)
        
        self.navigationItem.titleView = titleStackView
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        if view.traitCollection.horizontalSizeClass == .compact {
            titleStackView.axis = .vertical
            titleStackView.spacing = UIStackView.spacingUseDefault
        } else {
            titleStackView.axis = .horizontal
            titleStackView.spacing = 20.0
        }
    }
    
    @IBAction func segmentControl(_ sender: UISegmentedControl) {
        detailsTableView.reloadData()
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DetailsTableViewCell.identifier, for: indexPath) as? DetailsTableViewCell
        return cell!
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200.0
    }
    
}
