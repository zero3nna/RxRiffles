import Foundation
import RxSwift

class Riddle10Solution {

    func solve(first: Observable<Int>, function: @escaping (Int) -> Observable<String>) -> Observable<(Int, String)> {
        return first.flatMap { intValue in
            function(intValue).map { (intValue, $0) }
        }
    }
}
