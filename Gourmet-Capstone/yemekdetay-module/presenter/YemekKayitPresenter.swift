//
//  YemekKayitPresenter.swift
//  Gourmet-Capstone
//
//  Created by Gizem Turker on 27.05.2022.
//

import Foundation

class YemekKayitPresenter : ViewToPresenterYemekKayitProtocol {
    var yemekKayitView: PresenterToViewYemekKayitProtocol?
    
    var yemekKayitInteractor: PresenterToInteractorYemekKayitProtocol?
    
    func `sil`(yemek_id: Int, kullanici_adi: String) {
        print("jdhfjd")
    }
    
    func ekle(yemek_adi: String, yemek_resim_adi: String, yemek_fiyat: Int, yemek_adet: Int, kullanici_adi: String) {
        yemekKayitInteractor?.yemekEkle(yemek_adi: yemek_adi, yemek_resim_adi: yemek_resim_adi, yemek_fiyat: yemek_fiyat, yemek_adet: yemek_adet, kullanici_adi: kullanici_adi)
    }

}

