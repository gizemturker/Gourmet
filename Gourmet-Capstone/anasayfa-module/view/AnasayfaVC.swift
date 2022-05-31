//
//  ViewController.swift
//  Gourmet-Capstone
//
//  Created by Gizem Turker on 24.05.2022.
//

import UIKit

class AnasayfaVC : UIViewController, UISearchBarDelegate {
    
    @IBOutlet weak var yemeklerTableView: UITableView!
    
    var yemeklerListe = [Yemekler]()
    var anasayfaPresenterNesnesi:ViewToPresenterAnasayfaProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let ud = UserDefaults.standard
        ud.set("Gizem", forKey: "ad")
        let gelenAd = ud.string(forKey: "ad") ?? "isim yok"
        print(gelenAd)
        
        yemeklerTableView.delegate = self
        yemeklerTableView.dataSource = self
        
        
        AnasayfaRouter.createModule(ref: self)

        yemeklerTableView.separatorColor = UIColor(white: 0.95, alpha: 1)
        
       
        self.navigationItem.title = "gourmet"
        
        let appearance = UINavigationBarAppearance()
        
        appearance.backgroundColor = UIColor(named: "mainColor")
        appearance.titleTextAttributes = [.foregroundColor: UIColor(named: "fontColor1")!, NSAttributedString.Key.font: UIFont(name: "Ubuntu-Regular", size: 22)!]
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
    

    }
    override func viewWillAppear(_ animated: Bool) {
        anasayfaPresenterNesnesi?.yemekleriYukle()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toDetay" {
            let yemek = sender as? Yemekler
            let gidilecekVC = segue.destination as! YemekDetayVC
            gidilecekVC.yemek = yemek
        }
    }
    
    @IBAction func buttonDetay(_ sender: Any) {
        performSegue(withIdentifier: "toDetay", sender: nil)
    }
}


extension AnasayfaVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return yemeklerListe.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let yemek = yemeklerListe[indexPath.row]
        
        
        
        let hucre = tableView.dequeueReusableCell(withIdentifier: "yemeklerHucre", for: indexPath) as! TableViewCell
        
        hucre.yemekAdıLabel.text = "\(yemek.yemek_adi!)"
        hucre.yemekFiyatıLabel.text = "\(yemek.yemek_fiyat!) ₺"
        let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(yemek.yemek_resim_adi!)")
        hucre.yemekResimImageView.kf.setImage(with: url)
        
        
        
        hucre.backgroundColor = UIColor(white: 0.95, alpha: 1)
        hucre.contentView.layer.cornerRadius = 10.0
      
        
        return hucre
        
        
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let yemek = yemeklerListe[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: yemek)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    

    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        
        cell.backgroundColor = UIColor.white
                cell.layer.borderColor = UIColor.secondarySystemBackground.cgColor
                cell.layer.borderWidth = 10
                cell.layer.cornerRadius = 1
                cell.clipsToBounds = true
    }
    
}

extension AnasayfaVC : YemekDetayVCToAnasayfaVCProtocol {
    func veriGonder(mesaj: String) {
        
    }
}

extension AnasayfaVC : PresenterToViewAnasayfaProtocol {
    func vieweVeriGonder(yemeklerListesi: Array<Yemekler>) {
        self.yemeklerListe = yemeklerListesi
        DispatchQueue.main.async {
            self.yemeklerTableView.reloadData()
        }
    }
}
    
