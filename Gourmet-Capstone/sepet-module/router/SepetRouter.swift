//
//  SepetDetayRouter.swift
//  Gourmet-Capstone
//
//  Created by Gizem Turker on 28.05.2022.
//

import Foundation

class SepetDetayRouter : PresenterToRouterSepetProtocol {
    static func createModule(ref: SepetDetayVC) {
        let presenter = SepetPresenter()
        //View
        ref.sepetPresenterNesnesi = presenter
        //Presenter
        ref.sepetPresenterNesnesi?.sepetInteractor = SepetInteractor()
        ref.sepetPresenterNesnesi?.sepetView = SepetInteractor() as! PresenterToViewSepetProtocol
        //Interactor
        ref.sepetPresenterNesnesi?.sepetInteractor?.sepetPresenter = presenter
    }
}
