//
//  SepetDetayInteractor.swift
//  Gourmet-Capstone
//
//  Created by Gizem Turker on 28.05.2022.
//

import Foundation

import Foundation

class SepetInteractor : PresenterToInteractorSepetProtocol {
    func `sil`(sepet_yemek_id: Int, kullanici_adi: String) {
        print("yaz")
    }
    
    
    var sepetPresenter: InteractorToPresenterSepetProtocol?
    
    func yukle(kullanici_adi:String) {
        
        var istek = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php")!)
        istek.httpMethod = "POST"
        let postString = "kullanici_adi=\(kullanici_adi)"
        istek.httpBody = postString.data(using: .utf8)
        
        URLSession.shared.dataTask(with: istek) {data,response,error in
            if error != nil || data == nil {
                print("hata")
                return
            }
            
            do {
                
                let cevap = try JSONDecoder().decode(SepetYemeklerCevap.self, from: data!)
                if let liste = cevap.sepet_yemekler {
                    
            }
            
        } catch {
        
            print(error.localizedDescription)
        //print(String(describing: error)) // <- ✅ Use this for debuging!
    }
    
}.resume()

}
    
func yemekSil(sepet_yemek_id: Int,kullanici_adi:String) {
     
    }

    
}
