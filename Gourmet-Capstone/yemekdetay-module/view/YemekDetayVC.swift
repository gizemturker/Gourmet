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
    var sepetYemek:Sepet_Yemekler?
    var yemekKayitPresenterNesnesi:ViewToPresenterYemekKayitProtocol?
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
      

        if let y = yemek {
            self.navigationItem.title = y.yemek_adi
            detayYemek.text = y.yemek_adi
            detayFiyat.text = "\(y.yemek_fiyat!) ₺"
            detayImage.image = UIImage(named: y.yemek_resim_adi!)
            let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(y.yemek_resim_adi!)")
            detayImage.kf.setImage(with: url)
            
        }
        
        YemekKayitRouter.createModule(ref: self)
        
    }
    
    @IBAction func addCartButton(_ sender: Any) {
        
    
        if let y = yemek {
            yemekKayitPresenterNesnesi?.ekle(yemek_adi: y.yemek_adi!, yemek_resim_adi: y.yemek_resim_adi!, yemek_fiyat: Int(y.yemek_fiyat!)! , yemek_adet: Int(labelX.text!)!, kullanici_adi: "gizemturker")
              }
        
        // .sepeteEkle yemekadi resim fiyat yemek adet kullanıcı adı verilecek.
        
    }
    
    
    @IBAction func stepperButton(_ sender: UIStepper) {
        
        labelX.text = String(Int(sender.value))
    }
    /*override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toSepet" {
            _ = sender as? Yemekler
            _ = segue.destination as! SepetDetayVC
        }
    }
    */

    
}


