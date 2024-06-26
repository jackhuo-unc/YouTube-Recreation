//
//  AdViewModel.swift
//  final project
//
//  Created by Jack Huo on 4/22/24.
//

import Foundation
import UIKit

//copied from ChatGPT
class AdViewModel: ObservableObject {
    @Published var adImage: UIImage?
    @Published var adText: String?
    @Published var isLoading = false
    @Published var adVideoURL: String?
    
    func fetchRandomAdData() {
        isLoading = true
        
        // Fetch random ad image
        guard let imageURL = URL(string: "https://source.unsplash.com/random/300x200") else {
            print("Invalid image URL")
            isLoading = false
            return
        }
        
        URLSession.shared.dataTask(with: imageURL) { data, response, error in
            guard let data = data, error == nil else {
                print("Error fetching ad image: \(error?.localizedDescription ?? "Unknown error")")
                self.isLoading = false
                return
            }
            
            if let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.adImage = image
                    self.isLoading = false
                }
            } else {
                print("Failed to create UIImage from data.")
                self.isLoading = false
            }
        }.resume()
        
        // Generate random ad text
        adText = generateRandomAdText()
        
        //generate random video ad url
        adVideoURL = generateAdVideoURL()
        
    }
    
    private func generateAdVideoURL() ->  String {
        let videoURLS = [
            "Cv1RJTHf5fk?si=0NZN7arUbHVQzCwr",
            "4Wf00i7EKho?si=xLIjVAWdmCtEvd5D",
            "MOo9iJ8RYWM?si=BSfVqcnWNUhedDWj",
            "ugwCBB--k1o",
            "Ia7tatLhbU4",
            "KqRXOIGSdY0",
            "qQa4N3TKbxU",
            "7fE5NIoHw-g",
            "cqRxXwfSjs4",
            "bJ-o9JGE-Cc",
            "RLk_MzXSrwY",
            "-SrEdgNsFnE",
            "0E0m3iw-zf8",
            "Eg6sL89oJbI",
            "B8qmb3Awl2o",
            "Gi9tFRjLbvw",
            "ZQ9vJWFtfOg",
            "J4d1zRV9ej8",
            "4yFhPKFvVA0",
            "r8Nm9GZ1ivY",
            "2Wh6X9UivMw"
        ]
        return videoURLS.randomElement() ?? "Cv1RJTHf5fk?si=0NZN7arUbHVQzCwr"
    }
    
    private func generateRandomAdText() -> String {
        let adTexts = [
            "YOU KNOW YOU WANT IT",
            "I know where you live.",
            "GIVE ME YOUR LIVER",
            "Get yours today!",
            "Buy this or I can and will hurt you.",
            "Shop now!",
            "GET OUT YOUR WALLET!",
            "BUY THIS PLEASE",
            "Do something with your life!",
            "INVEST IN YOUR FUTURE"
        ]
        return adTexts.randomElement() ?? "Amazing offer inside!"
    }
}
