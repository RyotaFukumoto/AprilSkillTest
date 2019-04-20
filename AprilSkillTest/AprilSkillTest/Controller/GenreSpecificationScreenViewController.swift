//
//  GenreSpecificationScreenViewController.swift
//  AprilSkillTest
//
//  Created by ryota on 2019/04/20.
//  Copyright © 2019 ryota. All rights reserved.
//

import UIKit
import RealmSwift

class GenreSpecificationScreenViewController: UIViewController, UITableViewDelegate,UITableViewDataSource{
    
    @IBOutlet weak var genreSelectTableView: UITableView!
    
    let realm = try! Realm()
    var genreArray : Array<String> = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setUp()
    }
    
/// セットアップ
    func setUp() {
        setUpProtocol()
        setUpData()
        setUpNib()
    }
    
/// プロトコルセットアップ
    func setUpProtocol() {
        self.genreSelectTableView.delegate = self
        self.genreSelectTableView.dataSource = self
    }
    
/// データ取得
    func setUpData() {
        let genreArrayRealm = realm.objects(RestaurantGenreData.self)
        
        for genreRealm in genreArrayRealm {
            genreArray.append(genreRealm.name)
        }
    }
    func setUpNib() {
        genreSelectTableView.register(UINib(nibName: "GenreSpecificationTitleCell", bundle: nil), forCellReuseIdentifier: "titleCell")
        genreSelectTableView.register(UINib(nibName: "GenreSpecificationTableViewCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0{
            let cell:GenreSpecificationTitleCell = tableView.dequeueReusableCell(withIdentifier: "titleCell", for: indexPath) as! GenreSpecificationTitleCell
            return cell

        }
        let cell:GenreSpecificationTableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! GenreSpecificationTableViewCell
        
        cell.genreNameLabel.text = genreArray[indexPath.row]
        
        return cell
        
    }
    
    
}
