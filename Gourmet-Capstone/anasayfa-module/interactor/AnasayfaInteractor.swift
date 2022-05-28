//
//  AnasayfaInteractor.swift
//  Gourmet-Capstone
//
//  Created by Gizem Turker on 27.05.2022.
//

import Foundation

class AnasayfaInteractor : PresenterToInteractorAnasayfaProtocol {
    func yemekAra(aramaKelimesi: String) {
        print("dsfsdf")
    }
    
    func yemekSil(yemek_id: Int) {
        print("sdfsdf")
    }
    
  
    
    var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol?
    
    func tumYemekleriAl() {
        _ = [Yemekler]()
        let url = URL(string: "http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php")!
        
        URLSession.shared.dataTask(with: url) {data,response,error in
            if error != nil || data == nil {
                print("hata")
                return
            }
            
            do {
               
                let cevap = try JSONDecoder().decode(YemeklerCevap.self, from: data!)
                if let liste = cevap.yemekler {
                    
                    self.anasayfaPresenter?.presenteraVeriGonder(yemeklerListesi: liste)

                }
                
                
                } catch {
                
                    print(error.localizedDescription)
                //print(String(describing: error)) // <- ✅ Use this for debuging!
            }
            
        }.resume()
        
    }

    
}
