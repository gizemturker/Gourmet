//
//  SepetDetayVC.swift
//  Gourmet-Capstone
//
//  Created by Gizem Turker on 26.05.2022.
//

import UIKit

class SepetDetayVC: UIViewController, UITableViewDelegate {


    @IBOutlet weak var sepetTableView: UITableView!
    
    
    
    var sepetYemekListe = [Sepet_Yemekler]()
    
    var sepetPresenterNesnesi:ViewToPresenterSepetProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sepetTableView.delegate = self
        sepetTableView.dataSource = self
        
        SepetDetayRouter.createModule(ref: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        sepetPresenterNesnesi?.sepetYukle(kullanici_adi: "gizemturker")
    }
    
    @IBAction func buttonSepetiOnayla(_ sender: Any) {

    }
}

extension SepetDetayVC : PresenterToViewSepetProtocol {
    
    func vieweVeriGonder(sepetListesi sepetYemeklerListesi: Array<Sepet_Yemekler>) {
        self.sepetYemekListe = sepetYemeklerListesi
        DispatchQueue.main.async {
            self.sepetTableView.reloadData()
        }
    }
}

extension SepetDetayVC : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sepetYemekListe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let sepet = sepetYemekListe[indexPath.row]
        let hucre = tableView.dequeueReusableCell(withIdentifier: "sepetHucre", for: indexPath) as! SepetTableViewCell
        
        hucre.sepetYemekAdi.text = sepet.yemek_adi
        hucre.sepetYemekFiyat.text = "\(sepet.yemek_fiyat!) ₺"
        hucre.YemekImageView.image = UIImage(named: sepet.yemek_resim_adi!)
        hucre.sepetYemekAdet.text = "\(sepet.yemek_siparis_adet!)"
        let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(sepet.yemek_resim_adi!)")
        hucre.YemekImageView.kf.setImage(with: url)
        
        hucre.backgroundColor = UIColor(white: 0.95, alpha: 1)
        hucre.sepetHucreArkaPlan.layer.cornerRadius = 10.0
        
        return hucre
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
            let silAction = UIContextualAction(style: .destructive, title: "Sil"){ (action,view,void) in
            let sepet = self.sepetYemekListe[indexPath.row]
            
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(sepet.yemek_adi!) silinsin mi?", preferredStyle: .alert)
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel){ action in }
            alert.addAction(iptalAction)
            
            let evetAction = UIAlertAction(title: "Evet", style: .destructive){ action in
                self.sepetPresenterNesnesi?.sepetYemekSil(sepet_yemek_id: Int(sepet.sepet_yemek_id)!, kullanici_adi: sepet.kullanici_adi!)
        }
            alert.addAction(evetAction)
            self.present(alert, animated: true)
        }
        
        return UISwipeActionsConfiguration(actions: [silAction])
    }
    
}
