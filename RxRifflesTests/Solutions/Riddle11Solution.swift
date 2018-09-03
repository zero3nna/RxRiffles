import Foundation
import RxSwift

class Riddle11Solution {
    
    func solve(source: Observable<Void>, scheduler: SchedulerType) -> Observable<Void> {
        return source.throttle(300, scheduler: scheduler)
    }
}
