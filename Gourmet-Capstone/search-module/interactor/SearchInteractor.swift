//
//  SearchInteractor.swift
//  Gourmet-Capstone
//
//  Created by Gizem Turker on 28.05.2022.
//

import Foundation

class SearchInteractor : PresenterToInteractorSearchProtocol {
   
    var searchPresenter: InteractorToPresenterSearchProtocol?
    
    func tumYemekleriAl() {
        let url = URL(string: "http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php")!
        
        URLSession.shared.dataTask(with: url){ data,response,error in
            
            if error != nil || data == nil {
                print("Hata")
                return
            }
            
            do {
                let cevap = try JSONDecoder().decode(YemeklerCevap.self, from: data!)
                
                if let liste = cevap.yemekler {
                    self.searchPresenter?.presenteraVeriGonder(yemeklerListesi:liste)
                }
            }catch{
                print(error.localizedDescription)
            }
            
        }.resume()
    }
    
    func yemekAra(aramaKelimesi: String) {
       var istek = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php")!)
        istek.httpMethod = "POST"
        let postString = "yemek_adi=\(aramaKelimesi)"
        istek.httpBody = postString.data(using: .utf8)
        
        URLSession.shared.dataTask(with: istek){ data,response,error in
            if error != nil || data == nil {
                print("Hata")
                return
            }
            
            do {
                let cevap = try JSONDecoder().decode(YemeklerCevap.self, from: data!)
                if let liste = cevap.yemekler {
                    self.searchPresenter?.presenteraVeriGonder(yemeklerListesi: liste)
                }
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
    

}
