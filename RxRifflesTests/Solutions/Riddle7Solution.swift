import Foundation
import RxSwift
import RxSwiftExt

class Riddle7Solution {

    // Solution with RxSwift core only
    func solve(source: Observable<Int>) -> Observable<Int> {
        var cache = Set<Int>()
        
        return source.flatMap { element -> Observable<Int> in
            if cache.contains(element) {
                return Observable<Int>.empty()
            } else {
                cache.insert(element)
                return Observable<Int>.just(element)
            }
        }
    }

    // Solution with RxSwiftExt
    func solve2(source: Observable<Int>) -> Observable<Int> {
        return source.distinct()
    }
}
