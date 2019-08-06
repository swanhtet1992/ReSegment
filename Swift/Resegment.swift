import Foundation

struct Resegment {
    
    private static let RESEGMENT_REGULAR_EX = "(?:(?<!္)([က-ဪဿ၊-၏]|[၀-၉]+|[^က-၏]+)(?![ှျ]?[့္်]))"
    
    static func segment(_ text : String) -> [String] {
        
        var outputs  = text.replacingOccurrences(of: RESEGMENT_REGULAR_EX, with: "𝕊$1", options: [.regularExpression, .caseInsensitive])
    
        
        var ouputArray = outputs.components(separatedBy: "𝕊")
        
        if (ouputArray.count > 0) {
            ouputArray.remove(at: 0)
        }
        
        return ouputArray
    }
}

//Test 1
var input = "ဝန်ကြီးချုပ်ဦးဖြိုးမင်းသိန်း ခွင့်ထပ်တိုင် ရန်ကုန်တိုင်းလွှတ်တော်မှာ YBS စနစ်ပြုပြင်ပြောင်းလဲဖို့ တင်သွင်းတဲ့အဆိုအတည်ပြုဖို့၊ မပြုဖို့ ဆုံးဖြတ်မယ့်မနက်ဖြန်လွှတ်တော်အစည်းအဝေးကိုလည်း ဝန်ကြီးချုပ်ဦးဖြိုးမင်းသိန်းက ခွင့်ထပ်တိုင်ခဲ့ကြောင်းသိရပါတယ်"
var output = Resegment.segment(input)
print(output)

//Test 2
input = "စီအိုင်အေက နှိပ်စက်စစ်ဆေးမှု တွေလုပ်ခဲ့ အမေရိကန်-ဗဟိုထောက်လှမ်းရေး ဌာန CIA ဟာ သမ္မတဟောင်း ဂျော့ချ်ဘုရှ် လက်ထက် စက်တင်ဘာ ၁၁ ရက် တိုက်ခိုက်ခံရမှု နောက်ပိုင်း စစ်ဆေးမှုတွေလုပ်ရာမှာ နှိပ်စက်ညှင်းပန်းမှုတွေ ကျူးလွန်ခဲ့ဖူးတယ်လို့ စီအိုင်အေရဲ့ အကြီးအကဲဟောင်း ဘတ်ဇ်ခရောရှ့်ဂတ်က ဘီဘီစီကို ပြောခဲ့ပါတယ်။"
output = Resegment.segment(input)
print(output)

//Test 3
input = "တောင်ကိုရီးယား အခြေစိုက် Posco Daewoo နှင့် သြစတြေးလျအခြေစိုက် Woodside တို့ အကျိုးတူ ပူးပေါင်းဆောင်ရွက်နေသည့် ရခိုင်ကမ်းလွန်ရှိ AD-7"
output = Resegment.segment(input)
print(output)

//Test 4
input = "၂၀၁၈ခုနှစ်အာရှအားကစားပြိုင်ပွဲတွင် အားကစားနည်းအရေအတွက် တိုးမြင့်လာခဲ့"
output = Resegment.segment(input)
print(output)

//Test 5
input = "ပိဿာချိန်၁၀သားရှိသောကြက်သားများချက်ပြုတ်ကျွေးမွေးလှူဒါန်းသွားသည့်အတွက်ကျေးဇူးတင်ပါသည်။"
output = Resegment.segment(input)
print(output)