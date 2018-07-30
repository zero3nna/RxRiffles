import Foundation
import RxSwift

class Riddle6Solution {

    func solve(first: Single<Int>, second: Single<Int>) -> Single<(Int, Int)> {
        return Single.zip(first, second, resultSelector: { t1, t2 in
            (t1, t2)
        })
    }
}

