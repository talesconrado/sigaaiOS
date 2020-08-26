//
//  AlertsView.swift
//  SIGAA-UFC-Mobile
//
//  Created by Tales Conrado on 26/08/20.
//  Copyright © 2020 Tales Conrado. All rights reserved.
//

import UIKit

enum AlertsView {
    
    case userError
    case networkError
    
    func alert() -> UIAlertController {
        
        var alert: UIAlertController
        
        switch self {
        case .userError:
            alert = UIAlertController(title: "Erro.",
                                          message: "Confira novamente seu usuário e senha.",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        case .networkError:
            alert = UIAlertController(title: "Erro de conexão.",
                                          message: "Confira sua conexão de rede. " +
                                                    "Se estiver tudo ok, aguarde alguns minutos e tente novamente.",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        }
        
        return alert
    }
}
