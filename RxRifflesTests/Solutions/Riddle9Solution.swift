import Foundation
import RxSwift

class Riddle9Solution {
    
    func solve(main: Observable<Void>, trigger: Observable<Void>) -> Observable<Void> {
        return main.takeUntil(trigger)
    }
}
