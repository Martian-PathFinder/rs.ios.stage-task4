import Foundation



public extension Int {
    
      var roman: String? {
        let arrayArabic = [1, 4, 5, 9, 10, 40, 50, 90, 100, 400, 500, 900, 1000]
        let arrayRoman = ["I","IV","V","IX","X","XL","L","XC","C","CD","D","CM","M"]
        
         if (self <= 0 || self > 3999) {
                   return nil
          }
        
        var number = self
        var rezult = ""
        
        var n = arrayArabic.count - 1
        while (number > 0) {
           if (number >= arrayArabic[n]) {
               rezult += arrayRoman[n];
               number -= arrayArabic[n];
           }
           else { n -= 1 }
        }
        return rezult;
    }
 
/*
    var roman: String? {
        
        if (self <= 0 || self > 3999) {
            return nil
        }
        
        var romanString = ""
        let m1 = self / 1000
        romanString.append(stringM(int: m1))
        
        let m2 = self % 1000
        let d1 = m2 / 500
        romanString.append(stringD(int: d1))
        
        let d2 = m2 % 500
        let c1 = d2 / 100
        romanString.append(stringC(int: c1))
        
        let c2 = d2 % 100
        let l1 = c2 / 50
        romanString.append(stringL(int: l1))

        let l2 = c2 % 50
        let x1 = l2 / 10
        romanString.append(stringX(int: x1))
        
        let x2 = l2 % 10
        romanString.append(base(int: x2))
        
        return romanString
    }
    
    private func stringM(int: Int) -> String {
        var index = 0
        var str: String = ""
        while (index < int) {
            str.append("M")
            index += 1
        }
        return str
    }
    
    private func stringC(int: Int) -> String {
        if (int == 4) { return "CD" }
        else {
            if (int != 0 && int < 4) {
                var index = 0
                var str = ""
                while (index < int) {
                    str.append("C")
                    index += 1
                }
                return str
            }
            else  { return "" }
         }
    }
    
    private func stringX(int: Int) -> String {
        if (int == 4) { return "XL" }
        else if (int != 0 && int < 4) {
            var index = 0
            var str = ""
            while (index < int) {
               str.append("X")
               index += 1
            }
           return str
        } else { return "" }
    }
    
    private func stringD(int: Int) -> String {
        if (int == 4) { return "CM" }
        else if (int != 0 && int < 4) {
                var index = 0
                var str = ""
                while (index < int) {
                   str.append("D")
                   index += 1
                }
               return str
            } else { return "" }
    }
    
    
    private func stringL(int: Int) -> String {
        if (int == 4) { return "XC" }
        else if (int != 0 && int < 4) {
                var index = 0
                var str = ""
                while (index < int) {
                   str.append("L")
                   index += 1
                }
               return str
            } else { return "" }
    }
    
    
    private func base(int: Int) -> String {
        let str = ["", "I", "II", "III", "IV", "V", "VI", "VII", "VIII", "IX"]
        return str[int]
    }
*/
 
}
