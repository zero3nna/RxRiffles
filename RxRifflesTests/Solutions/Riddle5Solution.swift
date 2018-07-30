import Foundation
import RxSwift

class Riddle5Solution {

    func solve(first: Observable<Int>, second: Observable<Int>) -> Observable<Int> {
        return Observable.combineLatest(first, second, resultSelector: { t1, t2 in
            t1 + t2
        })
    }
}
