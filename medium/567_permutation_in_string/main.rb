#
# @lc app=leetcode id=567 lang=ruby
#
# [567] Permutation in String
#

# @lc code=start
# @param {String} s1
# @param {String} s2
# @return {Boolean}
def check_inclusion(s1, s2)
  w = s1.length
  hash = s1.chars.each_with_object({}) do |s, h|
    h[s] ? h[s] += 1 : h[s] = 1
  end

  s2.length.times.with_object(false) do |i, ans|
    # 対象文字がハッシュに存在する場合カウンタを減らす
    if hash[s2[i]]
      hash[s2[i]] -= 1
    end

    # windowの長さを超えたらwindowの手前（範囲外）の文字カウンタを増やす
    if i >= w && hash[s2[i - w]]
      hash[s2[i - w]] += 1
    end

    # カウンタが全て0になったらtrueを返す
    if hash.values.all?(&:zero?)
      break true
    end
  end
end

# @lc code=end

# s1 = "abafdsf"
# s2 = "eidbaooofsdfdsfd"
# p check_inclusion(s1, s2)

# s1 = "ab"
# s2 = "eidbaooo"
# p check_inclusion(s1, s2)

# ランダムな指定数の文字列を生成する
# def random_string(length)
#   chars = ("a".."z").to_a
#   Array.new(length) { chars.sample }.join
# end
# s1 = random_string(10**2)
# s2 = random_string(10**4)
# p s2.length - s1.length
# now = Time.now
# p check_inclusion(s1, s2)
# p Time.now - now

# s1 =
#   "flxvrcznjvpetwlglbxwjudtqpzqvlnezneorrzorbvcmewanlepafgsrrrnpbephanazfbxrffjpyyfgebnrnezpgbdzgpnpueusqmazuimfswqkcckovejskabxenbcaazsvloswwkeodbqwhvxuvolckoqbbnmylzdykqwihipfbuwqdjtsnprhvbvskjuqwpavovgtwldzlndpwmtapvuwbshlnzftqvikeugeesftjjfqxqckzcmckerqvkfgmutzfspubcmqdxgibkcctysaacjftxofhsyfvzubtlespxdphkcoexblqsywiaewxrypjltlyuktgcisryrodgwvmvnhmhkxvlxwkeuicjolldhvzjbugqbrprkkrptqpvolwbugjviwtewtfcojmeomitugthftnerwxidotaagigjegcqnvnntqaqzhutvwvyhslwxecgnpkbvqcooqyhwfkzigvwvixvthypyxwkwmxljljewnnsjopbgjfeumiafqbnhuusnwuogqobcaurezmvlsekvoxhmlwjvssrtqqhhcoscumxztetoxorhwyypymamovyeupopsxleapzyrwpuovvscxgghurnyabzpgrhjxsfaijsrcgnxafozqzkxzuprajukehkveqoopkbacynmabxkqawbvrtwbycmscktmhrtqzovvuaiaufnjkedpuwmasoxfcupizsiahnqofrqtwiluabwqwgyoeyrvkckqhozzxwqljwdrfcvhgmxgnasznkbxtvsjcunfzlpotxxsnfzuwjzrbvlazfvfobiukbcwqtjspztcsyscfasoauiofidyghfcsprdfzoavbtogicxnqliknlmiktdznjlmzczdtcinkiownvghvtdqfuigzfsumxbczwornoryzaxxvhiwngkconhdullpvkknjaioxwirycxwzxhhvujyliatmygomyisezkekotaxhhgviyonctjcqxxratadwfubdglijbgfvyloeeorwgrzxlhrexoffiamvdvzuujscreombfwukuudpgahcixvbczupnhawfdzfuiuefbnhevggxejbmbqgwxdcjfoxpmstyignzleofrojkxdotjzbgzyacguvmpgbfiemcmgswfzheosyjykvjsxmegdqtsedqxwhizdrtxqfxngqiiqhdqnkucnvlajdqsxthauceyfdxykklduhpfmswacvfcsyoubdrkqvhgmmrgjccdzoojrncgvapuejthnhkouupbvkvynfupbswyybwwiowdrsbpgfdqjyyjhkchhfllhpvnalptuxbpamxowxsragkazpftugfbxsrpzheymxdzisjguptpqsarhcfmhitdijcsdjtbjvciltewuxzckxnomjxzyimkpngwnryirysnihsorufktzhudantlkwpkgvgyannrgjhesrlefdwmkduhlypuivofvpdlzsrateylguvjrgmmpijxrlmcdqljkosrpjslxhpnvpaokqjkzxewjqxuerjyiitblgxpyfkufzuxwaxjougwiycsrwkyydzodmovuweeirbvuhvagqyjuvxchixdeplbmqepstpigawwljxepceapijvbqovlpwykrpmrqfacnfhbwlmisiuvwyijosxkuogtqpnfmqzoynsgfobzzasrwyazkirlsiiysjwysiqedfocdzzyhodvmhxkwroqxqjwfdlgmxlosbcqsgwnrdzjzwlechqalhqucneolyiypgvbnksjmhgildwbirijufnmsncdsakvswmwhzyelfndxxuvpgaeeibtchnxtbqqwqlrnaudohtiqzwlukrhjyhwvzmletyvndyikrpihpablsriolffyfjnopvdookfaccshcanohnjpafoxeszlhzgkwsdbuhrcqysmgwivobhlpiluzqrubblfvjxprjetvaanjxsloekhomfuysdyuyqorcmcjahvcjqkgmubbsfjfvgskbwkoubiremtdoxxztwvzikfumvdewiybnhsdvqaxvicfcokukryovhcynkqzydteyekflfbclzenbucqtzsgnmpemlfxaihaceoeewykkyepswtoxscqneytxctegnhlmvzvpryjmzvwcnoixiszxksjvhktroafqbwvfegjyvolzwqlmbfeoisqjirnprchgtujddwkvvneznqzmsghpokfhziuegdpieqlpfqalfxqbzrpdoqbujwrplehdacigxnieatlhftvgfqssvunkpoqnntybqaankwywnfgnzfkqayzaunlbqvhrzijpxsjyjmuiqhtfmazkvsqzitrwbawfxbsoqiqdtxzciypqurzdoqhhcnokzbuyvuldwkjcbrlcxagrtfjxxqkmisqzsimvnssmuhxwscqtlqplhlalhntclgakvbvtcrrzzesxcrurpqkrrmffwdinnlebzfradplhapmybwfdfdohhonajvyzgosfqrmfjoujmubrnocohzudbjniswmfqolsyigwteuifmasbubrzrjijhkcdxqgqixeoddrhtpmemigpormizdizhdxnazfiqqrywjselyzekpjtpucrtopokqbupebdvcjzazfeyyyhkuagfsmyrnmkewkaxaznwcdzusfajvamlobazycdjcnqxpgwkokvqejkkaumbksrotynsmwddfmykqkwfzxaspoapvbunvmmtllrzmldohpkrkoyotsycrtbtplxxsuvzrkqgqalelevsrdxtbzfpueasccuabjrhxeopzjgyoouzydyvzxnqqefjrwldltfjgtjafwumxsthgvzqcjjtotdbrokenyrfsjiofsxmlkkkmdsjwvqejdnvewslkkhuclfbvucwxwwgobszgmkewcscaupxisowechkjfylkeffpsaenxkhcogiyqmsgpvtdlowfssmolidndirzkcobmcjcyqymhqdgnckakkyjuzpdwgvfwoitfavpycfoocwewxyvgshfpydbhhgkauprdexcnfvxxqymzugwhbxfidemmbeznjneqmeuzrxkyvbyetangjfetehnlzhybsaigwljsktxdcqkpkbvwnlcwrpofcxxethfspabgrmihcgpmsamptaydawwznlcvmqgdalcwxkdnphxrhgkrjtlfbdxtotjrgimshvzljnvjbywuylhwfadtvqkjjevvvbrumdsbcnexsjzlzzmydghsrxerlttsoujuzhdixkrutvzevnealyzfzgzjdzvapyrsuwyplsvufcpbrtadhoyncxdpcfrzcgukjnuvqhrnhzaimsmaekhmutymgvyjikaaibnmvbmgolfuwmopcpiusimdzsqkmeneqbesjlkrsfieypkkztttiqfcnquiknsgurcoertbeehxgwquvkzvwdapsxznannzkqtukcfwafzyxedjnbdrvbtjkqufovtnbmhrxbofqzljltfkinklrsuyckmufosfoncfpvkoqketlcbkvkoxobbncnoiwedzfgvyqtfwlozewaystejiloauopqctjeitjwyqbxdhtogvqmsvplxvmodtcbpmwyqjcspjwxqatwpsjhngsuanvqjtntnuqplajsevmyqschmgwxfcdkynf"

# s2 =
#   "yaalpjvqjqqczxgxfyinagfcuvkgoqzeezcgymzlinnibplbkwifxzjazrbaabqstpncuoeuricouwpyqltwwkkojtyqarkuwpmlxchvuwamjzvsqwnzhkneopswdtmvysjumpilfopzeiccnkxjpvdhhqiygpcrnmsarpanfrbdhxpmhuoujxtfyskijevauvojuzzaxxmhtwrtvcjzccwclytwojsbkvbekjdbpmjehgrwyttjakluwhbexeewjfiyjcoqtjehrstjetyyubuhauoqkwojgekglomfrwgknjwbovlnbjqxpgvaqlmhpnuiixtwcxmmwgflkhsclpsgysvuygqswbwblrmvsmyumeylcxufqgrbgrzqelzrsxslomyimfrrvjwkuaezjisnddsqsnonunlqctjlaosplbiyhaptmsjhfeswczhioyclfryrnkkujlrocpzfuiedxvzmmvttixqmaninfadgbogflcukuontwcfpwjargnhyelrlkuziojhfaoyplbtojadvndxihvdhhinjtqetxcgseheunstynawujjipowdnucjzgujzwrwjgiycafkkwzemwpzjxfecefynvoyekfdkgdddyryhlxgtlozjcwyrkokxdlsdsemamcspzriuzlqujsogmgwikksvakmadzwjijhlqsawtrskrqfwunqxzscjiewtibmctcxezflxvrcznjvpetwlglbxwjudtqpzqvlnezneorrzorbvcmewanlepafgsrrrnpbephanazfbxrffjpyyfgebnrnezpgbdzgpnpueusqmazuimfswqkcckovejskabxenbcaazsvloswwkeodbqwhvxuvolckoqbbnmylzdykqwihipfbuwqdjtsnprhvbvskjuqwpavovgtwldzlndpwmtapvuwbshlnzftqvikeugeesftjjfqxqckzcmckerqvkfgmutzfspubcmqdxgibkcctysaacjftzofhsyfvzubtlespxdpukcoexblqsywiaewxrypjltlyuktgcisryrodgwvmvnhmhkxvlxwmeuicjolldhvzjbugqbrprkkrptqpvolwbugjviwtewtfcojmeomitugthftnerwxidotaagigjegcqnvnntqaqzhttvwvyhslwxecgnpkbvqcooqyhwfkzigvwvyxvthypyxwkwmxojljewnnsjopbgjfeumiafqbnhuusnwuogqobcaurezmvlsekvoxhmlwjvssrtqqhhcoscumxztetoxorhwyypymamovyehpopsxleapzyrwpuovvscxgghurnyabzpgrhjxsfaijsqcgnxafozqzkxzuprajukehkveqoopkbacynmabxkqawbvrtwbycmscktmhrtqzovvuaiaufnjkedpuwmasoxfcupizsiahnqofrqtwiluabwqwgyoeyrvkckqhozzxwqljwdrfcvhgmxgnasznkbxtvsjcunfzlpotxxsnfzuwjzrbvlazfvfobiukbcwqtjspztcsyscfasoauiofidyghfcsprdfzoavbtogicxnqliknlmiktdznjlmzczdtcinkiownvghvtdqfuigzfsumxbczwornoryzaxxvhiwngkconhdullpvkknjaioxwirycxwzxhhvrjyliatmygomyisezkekotaxhhgviyonctjcqxxratadwfubdglijbgfvyloeeorwgrzxlhrexoffiamvdvzuujscreombfwukuudpgahcixvbczupnhawfdzfuiuefbnhevggxejbmbqgwxdcjfoxpmstyignzleofrojkxdotjzbgzyacguvmpgbfiemcmgswfzheosyjykvjsxmegdqtsedqxwhixdrtxqfxngqiiqhdqnkucnvlajdqsxthauceyfdxykklduhpfmswacvfcsyoubdrkqvhgmmrgjccdzoojrncgvapuejthnhkouupbvkvynfupbswyybwwiowdrsbpgfdqjyyjhkchhfllhpvnalptuxbpamxowxsragkazpftugfbxsrpzheymxdzisjguptpqsarhcfmhitdijcsdjtbjvciltewuxzckxnomjxzyimkpngwnryirysnihsooufktzhudantlkwpkgvgyannrgjhesrlefdwmkduhlywuivofvpdlzsrateylguvjrgmmpijxrlmcdqljklsrpjslxhpnvpaokqjkzxewjqouerjyiitblqxpyfkufzuxwaxjougwiycsrwkyydzodmovuweeirbvuhvagqyjuvxchixdeplbmqepstpigawwljxepceapijvbqovlpwykrpmrqfacnfhbwlmisiuvwyijosxkuogtqpnfmqzoynsgfobzzasrwyazkirlsiiysjwysiqedfocdzzyhodvmhxkwroqxqjwfdlgmxlosbcqsgwnrdzjzwlechgalhqdcneolyiypgvbnksjmhgildwbirijufnmsncdsakvswmwhzyelfndxxuvpgaeeibtchnxtbqqwqlrnaudohtiqzwlukrhjyhwvzmletyvndyikrpihpablsriolffyfjnopvdookfaccshcanohnjpafoxeszlhzgkwsdbuhrcqysmgwivobhlpiluzqrubblfvjxprjetvaanjxsloekhomfuysdyuyqorcmcjahvcjqkgmubbsfjfvgskbwkoubiremtdoxxztwvzikfumvdewiybnhsdvqaxvicfcokukryovhcynkqzydteyekflfbclzenbucqtzsgnmpemlfxaihaceoeewykkyepswtoxscqneytxctegnhlmvzvpuyjmzvwcnoixiszxksjvhktroafqbwvfegjyvolzwqlmbfeoisqjirnprchgtujddwkvvneznqzmsghpokfhziuegdpieqlpfqalfxqbzrpdoqbujwrplehdacigxnieaulhftvgfqssvunkpoqnntybqaankwywnfgnzfkqayzaunlbqvhrzijpxsjyjmuiqhtfmazkvsqzitrpbawfxbsoqiqdtxzciyqqurzdoqhhcnokzbuyvuldwkjcbrlcxagrtfjxxqkmisqzsimvnsskuhxwscqtlqplhlalhntclgakvbvtcrrzzesxcrurpqkrrmffwdinnlebzfradplhapmybwfdfdohhxnajvyzgosfqrmfjoujmubrnocohzudbjniswmfrolsyigwteuifmasbubrzrjijhkcdxqgqixeoddrhtpmemigpormizdizhdxnazfiqqriwjselyzekpjtpucrtopokqbupebdvcjzazfeyyyhkuagfsmyrnmkewkaxaznwcdzusfajvamlobazycdjcnqxpgwkokvqejkkaumbksrotynsmwddfmykqkwfzxaspoapvbunvmmtllrzmldohpkrkoyotsycrtbtplxxsuvzrkqgqalelevsrdxtbzfpueasccuabjrhxeopzjgyoruzydyvzxnqqefjrwldltfjgtjafwumxsthgvzqcjjtotdbrokenyrfsjiofsxmlkkkmdsjwvqejdnvewslkkhuclfbvucwxwwgobszgmkewcscaupxisowechkjfylkeffpsaenxkhcogiyqmsgpvtdlowfssmolidndirzkcobmcjcyqymhqugnckakkyjuzpdwgvfwoitfavpycfoocwewxyvgshfpydbhhgkauprdexcnfvxxqymzugwhbxfidemmbeznjneqmeuzrxkyvbyetangjfetehnlzhybsaigwldsktxdcqkpkbvwnlcwrpofcxxethfspabgrmihcgpmsamptaydawwznlcvmqgdalcwxkdnphxrhgkrjtlfbdxtotjrgimshvzljnvjbywuylhwfadtvqkjjevvvbrumdsbcnexsjzlzzmydghsrxerlttsoujuzhdixkrutvzevnealyzfzgzjdzvapyrsuwyplsvufcpbrtajhoyncxdpcfrzcgukjnuvqhrnhzaimsmaekhmutymgvyjikaaibnmvbmgolfuwmopcpiusimdzsqkmeneqbesjlkrsfieypkkztttiqfcnquiknsgurcoertbeehxgwquvkzvwdapsxznannzkqtukcfwafzyxedjnbdrvbtjkqufovtnbmhrxbofqzljltfkinklrsuyckmufosfoncfpvkoqketlcbkvkoxobbncnoiwedzfgvyqtfwlozewaystejiloauopqctjeitjwyqbxdhtogvqmsvplxvmodtcbpmwyqjcspjwxqatwpsjhngsuanvqjtntnuqplajsevmypschmgwxfcdkynfzlhsqqwdcgdbxpezgdkpjcoqtaddqfsahlphsqxofdfevbncnjawmmgth"

# now = Time.now
# p check_inclusion(s1, s2)
# p Time.now - now

# s1 = "hello"
# s2 = "ooolleoooleh"
# p check_inclusion(s1, s2)
