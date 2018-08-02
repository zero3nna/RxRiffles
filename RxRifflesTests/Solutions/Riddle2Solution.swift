import Foundation
import RxSwift

class Riddle2Solution {
    
    func solve(source: Observable<Int>) -> Observable<Int> {
        return source.map { $0 + 1 }
    }
}
