import Foundation
import RxSwift

class Riddle8Solution {
    
    func solve(source: Observable<Void>, scheduler: SchedulerType) -> Observable<Void> {
        return source.delaySubscription(200, scheduler: scheduler)
    }
}
