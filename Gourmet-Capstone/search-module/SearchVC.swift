//
//  SearchVC.swift
//  Gourmet-Capstone
//
//  Created by Gizem Turker on 26.05.2022.
//

import Foundation
import UIKit
import Kingfisher

class SearchVC : UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var yemeklerListe = [Yemekler]()
    
    var searchPresenterNesnesi:ViewToPresenterSearchProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        searchTableView.delegate = self
        searchTableView.dataSource = self
      //  let yemekler = parseIslemi()
        
        SearchRouter.createModule(ref: self)
       
        self.navigationItem.title = "Search"
        
        let appearance = UINavigationBarAppearance()
        
        // backroundcolor
        
        appearance.backgroundColor = UIColor(named: "mainColor")
        
        // gourmet header color
        
        appearance.titleTextAttributes = [.foregroundColor: UIColor(named: "fontColor1")!, NSAttributedString.Key.font: UIFont(name: "Ubuntu-Regular", size: 22)!]
        
        // statusbar
        navigationController?.navigationBar.barStyle = .black
        
        // real color pallette
        
        navigationController?.navigationBar.isTranslucent = true
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
    

    }
    
    override func viewWillAppear(_ animated: Bool) {
        searchPresenterNesnesi?.yemekleriYukle()
    
    
    }
    
}


extension SearchVC : PresenterToViewSearchProtocol {
    func vieweVeriGonder(yemeklerListesi: Array<Yemekler>) {
        self.yemeklerListe = yemeklerListesi
        DispatchQueue.main.async {
            self.searchTableView.reloadData()
        }
    }
}


extension SearchVC : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let yemek = yemeklerListe[indexPath.row]
        let hucre = tableView.dequeueReusableCell(withIdentifier: "searchHucre", for: indexPath) as! SearchTableViewCell
        hucre.yemekLabel.text = "\(yemek.yemek_adi!)!"
        return hucre
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return yemeklerListe.count
    }
    
}
