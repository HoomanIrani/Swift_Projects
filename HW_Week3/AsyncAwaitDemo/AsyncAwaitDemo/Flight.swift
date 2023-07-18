import Foundation

class FlightBookingManager: ObservableObject {
    
    let queue1 = DispatchQueue(label: "queue1")
    let queue2 = DispatchQueue(label: "queue2")
    let flight = Flight()
    
    init() {
        readWriteBookingSeats()
        //useAsyncAwait()
    }
    
    func readWriteBookingSeats() {
        queue1.async {
            let bookedSeat: String = self.flight.bookSeat()
            print("Booked seat is \(bookedSeat)")
        }
        queue2.async {
            let availableSeats: [String] = self.flight.getAvailableSeats()
            print("Available Seats: \(availableSeats)")
        }
    }
    
    
    func useAsyncAwait() {
        
        queue1.async {
            Task {
                let bookedSeat: String = await self.flight.bookSeat()
                print("Booked seat is \(bookedSeat)")
            }
        }
        queue2.async {
            Task {
                let availableSeats: [String] = await self.flight.getAvailableSeats()
                print("Available Seats: \(availableSeats)")
            }
        }
    }
    
}




class Flight: ObservableObject {
    
    let company = "Air India"
    var availableSeats: [String] = ["1A", "1B", "1C"]
    
    let barrierQueue = DispatchQueue(label: "barrierQueue", attributes: .concurrent)
    
    func getAvailableSeats() -> [String] {
        
        barrierQueue.sync(flags: .barrier) {
            return availableSeats
        }
    }
    
    
    
    func bookSeat() -> String {
        
        barrierQueue.sync(flags: .barrier) {
            
            let bookedSeat = availableSeats.first ?? ""  // shared data sourse
            availableSeats.removeFirst()
            return bookedSeat
        }
    }
}
