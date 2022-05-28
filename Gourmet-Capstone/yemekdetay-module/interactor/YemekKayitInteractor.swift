//
//  YemekKayitInteractor.swift
//  Gourmet-Capstone
//
//  Created by Gizem Turker on 27.05.2022.
//

import Foundation



class YemekKayitInteractor : PresenterToInteractorYemekKayitProtocol{
    func yemekEkle(yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: Int, yemek_adet: Int, kullanici_adi: String) {
        var istek = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php")!)
        istek.httpMethod = "POST"
        let postString = "yemek_adi=\(yemek_adi)&yemek_fiyat=\(yemek_fiyat)&yemek_resim_adi=\(yemek_resim_adi)&yemek_siparis_adet=\(yemek_adet)&kullanici_adi=\(kullanici_adi)"

        istek.httpBody = postString.data(using: .utf8)

        URLSession.shared.dataTask(with: istek){ data,response,error in
            if error != nil || data == nil {
                print("Hata")
                return
            }
            do{
                if let json = try JSONSerialization.jsonObject(with: data!,options: []) as? [String:Any] {
                    print(json)
                }
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func yemekSil(yemek_id: Int, kullanici_adi: String) {
        print("sdfsjkj")
    }
    
    
    var yemekKayitPresenter: PresenterToInteractorYemekKayitProtocol?
    
    var YemekKayitPresenter: InteractorToPresenterYemekKayitProtocol?

    }

