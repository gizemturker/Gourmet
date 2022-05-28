//
//  YemekKayitRouter.swift
//  Gourmet-Capstone
//
//  Created by Gizem Turker on 27.05.2022.
//

import Foundation

class YemekKayitRouter {
    
    static func createModule(ref: YemekDetayVC) {
        let presenter = YemekKayitPresenter()
        // view
        ref.yemekKayitPresenterNesnesi = presenter
        // presenter
        ref.yemekKayitPresenterNesnesi?.yemekKayitInteractor = YemekKayitInteractor()
        //interactor
        ref.yemekKayitPresenterNesnesi?.yemekKayitInteractor = YemekKayitInteractor()
    }
}
