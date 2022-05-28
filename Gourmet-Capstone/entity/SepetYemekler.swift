//
//  Sepet.swift
//  Gourmet-Capstone
//
//  Created by Gizem Turker on 28.05.2022.
//

import Foundation

class SepetYemekler : Codable {
    
    var sepet_yemek_id:String
    var yemek_adi:String?
    var yemek_fiyat:Int?
    var yemek_resim_adi:String?
    var yemek_siparis_adet:Int?
    var kullanici_adi:String?
    
    init(sepet_yemek_id:String,yemek_adi:String,yemek_fiyat:Int,yemek_resim_adi:String,yemek_siparis_adet:Int,kullanici_adi:String) {
        
        
        self.sepet_yemek_id = sepet_yemek_id
        self.yemek_adi = yemek_adi
        self.yemek_fiyat = yemek_fiyat
        self.yemek_resim_adi = yemek_resim_adi
        self.yemek_siparis_adet = yemek_siparis_adet
        self.kullanici_adi = kullanici_adi
        
    }
    
    
}
