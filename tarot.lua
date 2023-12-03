--塔罗牌

msg_order = {}

order_word = "+tarot"

cardtable = {
    "愚者（The Fool，0）",
    "魔术师（The Magician，I）",
    "女祭司（The High Priestess，or the Popess，Ⅱ）",
    "女皇（The Empress，Ⅲ）",
    "皇帝（The Emperor，Ⅳ）",
    "教皇（The Hierophant，or the Pope，V）",
    "恋人（The Lovers，Ⅵ）",
    "战车（The Chariot，Ⅶ）",
    "力量（Strength，Ⅷ）",
    "隐士（The Hermit，Ⅸ）",
    "命运之轮（The Wheel of Fortune，X）",
    "正义（Justice，Ⅺ）",
    "倒吊人（The Hanged Man，Ⅻ）",
    "死神（Death， XIII）",
    "节制（Temperance，XIV）",
    "恶魔（The Devil ，XV）",
    "塔（The Tower，XVI）",
    "星星（The Star，XVII）",
    "月亮（The Moon，XVIII）",
    "太阳（The Sun，XIX）",
    "审判（Judgment，XX）",
    "世界（The World，XXI）"
}

function tarot(msg)

    r = ranint(0,21)

    p = ranint(0,1)

    if p==1 then
        return "{nick}抽到了大阿卡纳牌中的\n"..cardtable[r].." [正位]"
    else
        return "{nick}抽到了大阿卡纳牌中的\n"..cardtable[r].." [逆位]"
    end
end

msg_order[order_word] = "tarot" 
