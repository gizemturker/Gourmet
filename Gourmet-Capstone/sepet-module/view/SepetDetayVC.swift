//
//  SepetDetayVC.swift
//  Gourmet-Capstone
//
//  Created by Gizem Turker on 26.05.2022.
//

import UIKit

class SepetDetayVC: UIViewController {

    @IBOutlet weak var tableView: UITableViewCell!
    
    var sepetYemekListe = [SepetYemekler]()
    var sepetPresenterNesnesi:ViewToPresenterSepetProtocol?
    
        override func viewDidLoad() {
        super.viewDidLoad()

            
            
            // SepetRouter.createModule(ref: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        sepetPresenterNesnesi?.sepetView.self
    }
    

    @IBOutlet weak var orderButton: UILabel!
}

extension SepetDetayVC : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sepetYemekListe.count
        
    }
    
    // hücrelerin kopyalanması sayı kadar çalışır. sırayla indeks bilgisi verir
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sepet = sepetYemekListe[indexPath.row]
        
        
    // tableviewcelle erişmek istiyor id ve class ı kullanarak
        
        let hucre = tableView.dequeueReusableCell(withIdentifier: "toSepetDetayHucre", for: indexPath) as! TableViewCell
        
        hucre.yemekAdıLabel.text = sepet.yemek_adi
        hucre.yemekFiyatıLabel.text = "\(sepet.yemek_fiyat!) ₺"
        let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(sepet.yemek_resim_adi!)")
        hucre.yemekResimImageView.kf.setImage(with: url)

        hucre.backgroundColor = UIColor(white: 0.95, alpha: 1)
        hucre.contentView.layer.cornerRadius = 10.0
        return hucre
    }
    

    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        
        cell.backgroundColor = UIColor.white
                cell.layer.borderColor = UIColor.secondarySystemBackground.cgColor
                cell.layer.borderWidth = 10
                cell.layer.cornerRadius = 1
                cell.clipsToBounds = true
       

    }
    
}

    
 /*   func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let silAction = UIContextualAction(style: .destructive, title: "Sil"){ (action,view,bool) in
            let yemek = self.yemeklerListe[indexPath.row]
            
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(yemek.yemek_adi!) silinsin mi ?", preferredStyle: .alert)
            
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel){ action in }
            alert.addAction(iptalAction)
            
            let evetAction = UIAlertAction(title: "Evet", style: .destructive){ action in
                self.anasayfaPresenterNesnesi?.sil(yemek?.yemek_adi!)
            }
            alert.addAction(evetAction)
            
            self.present(alert, animated: true)
            
        }
        
        return UISwipeActionsConfiguration(actions: [silAction])
    } */
