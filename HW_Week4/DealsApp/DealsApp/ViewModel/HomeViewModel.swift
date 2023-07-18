import Foundation
import Combine


class HomeViewModel: ObservableObject {
    
    @Published var dealsData = [Deal]()
    let service = DealsService()
    
    func getDeals() {
        do {
            self.dealsData = try service.fetchDeals()
        }
        catch {
            print(error.localizedDescription)
        }
    }
}


