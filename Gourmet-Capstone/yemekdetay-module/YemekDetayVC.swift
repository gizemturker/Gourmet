//
//  YemekDetayVC.swift
//  Gourmet-Capstone
//
//  Created by Gizem Turker on 26.05.2022.
//

import UIKit

class YemekDetayVC: UIViewController {

    @IBOutlet weak var detayImage: UIImageView!
    @IBOutlet weak var detayFiyat: UILabel!
    @IBOutlet weak var detayYemek: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    
    @IBOutlet weak var labelX: UILabel!
    
    var yemek:Yemekler?
    var yemekKayitPresenterNesnesi:ViewToPresenterYemekKayitProtocol?
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        YemekKayitRouter.createModule(ref: self)

        if let y = yemek {
            detayYemek.text = y.yemek_adi
            detayFiyat.text = "\(y.yemek_fiyat!) ₺"
            detayImage.image = UIImage(named: y.yemek_resim_adi!)
            let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(y.yemek_resim_adi!)")
            detayImage.kf.setImage(with: url)
            
        }

    }
    
    @IBAction func addCartButton(_ sender: Any) {

        yemekKayitPresenterNesnesi?.ekle(yemek_adi: (yemek?.yemek_adi)!, yemek_resim_adi: (yemek?.yemek_resim_adi)!, yemek_fiyat: Int((yemek?.yemek_fiyat)!)!, yemek_adet: Int(labelX.text!)!, kullanici_adi: "gizemturker")
        
        // .sepeteEkle yemekadi resim fiyat yemek adet kullanıcı adı verilecek.
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toSepet" {
            _ = sender as? Yemekler
            _ = segue.destination as! SepetDetayVC
        }
    }
    

    
}


