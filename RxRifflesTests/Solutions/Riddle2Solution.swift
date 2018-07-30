import Foundation
import RxSwift

class Riddle2Solution {
    /**
     * Increment each emitted value of the given [source] by 1.
     *
     * Use case: You want to transform the data.
     */
    func solve(source: Observable<Int>) -> Observable<Int> {
        return source.map { $0 + 1 }
    }
}
