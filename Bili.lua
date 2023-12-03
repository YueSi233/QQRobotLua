msg_order = {}

function bili(msg)
    ret = ""
    title = {}
    picture = {}
    view = {}
    danmaku = {}
    like = {}
    coin = {}
    favorite = {}
    share = {}
    author = {}
    hrank = {}
    bvid = {}
    pubdate = {}

    for i = 1, 3 do
        url = "https://api.bilibili.com/x/web-interface/ranking/v2?rid=0&type=all"
        res,data = http.get(url)
        if not res then return "api访问失败！月泗没有权限" end
        if #data<2 then return "api无返回！月泗没有权限" end
        json = require("json")
        j = json.decode(data)
            if j.code~=0 then return "获取失败！月泗没有权限\n错误码："..j.code.."，"..j.message end
        title[i] = j.data.list[i].title
        picture[i]  = "[CQ:image,url=" .. j.data.list[i].pic .. "]"
        view[i]  = j.data.list[i].stat.view
        danmaku[i]  = j.data.list[i].stat.danmaku
        like[i]  = j.data.list[i].stat.like
        coin[i]  = j.data.list[i].stat.coin
        favorite[i]  = j.data.list[i].stat.favorite
        share[i]  = j.data.list[i].stat.share
        author[i]  = j.data.list[i].owner.name
        hrank[i]  = j.data.list[i].stat.his_rank
        bvid[i]  = j.data.list[i].bvid
        pubdate[i]  = os.date("%Y-%m-%d %H:%M:%S",j.data.pubdate)
        ret =  ret .. "【" .. i .. "】\n" .. picture[i]  .. "\n" .. title[i]  .. "\n" .. view[i]  .. "播放 · 总弹幕数" .. danmaku[i]  .. "   " .. pubdate[i] 
        if hrank~=0 then
            ret = ret .. "  全站排行榜最高第" .. hrank[i]  .. "名"
        end
        ret = ret .. "\n点赞" .. like[i]  .. " 投币" .. coin[i]  .. " 收藏" .. favorite[i]  .. " 转发" .. share[i]  .. "\n作者：" .. author[i] 
        res,data = http.get("https://api.bilibili.com/x/web-interface/ranking/v2?rid=0&type=all")
        ret = ret .. "\n链接：https://www.bilibili.com/video/" .. bvid[i]  .. "\n"
    end
    return ret
end
msg_order["+bili"] = "bili" 


function biliA(msg)
    ret = ""
    title = {}
    picture = {}
    view = {}
    danmaku = {}
    bvid = {}
    pubdate = {}
    rating = {}

    for i = 1, 3 do
        url = "https://api.bilibili.com/pgc/web/rank/list?season_type=1&day=3"
        res,result = http.get(url)
        json = require("json")
        j = json.decode(result)
            if j.code~=0 then return "获取失败！月泗没有权限\n错误码："..j.code.."，"..j.message end
        title[i] = j.result.list[i].title
        picture[i]  = "[CQ:image,url=" .. j.result.list[i].ss_horizontal_cover .. "]"
        view[i]  = j.result.list[i].stat.view
        danmaku[i]  = j.result.list[i].stat.danmaku
        bvid[i]  = j.result.list[i].url
        rating [i] = j.result.list[i].rating
        ret =  ret .. "【" .. i .. "】\n" .. picture[i]  .. "\n" .. title[i]  .. "\n" .. view[i]  .. "播放 · 总弹幕数" .. danmaku[i]
        ret = ret .. " 评分：" .. rating[i]  .. "分"
        res,data = http.get("https://api.bilibili.com/pgc/web/rank/list?season_type=1&day=3")
        ret = ret .. "\n链接：" .. bvid[i]  .. "\n"
    end
    return ret
end
msg_order["+bAnime"] = "biliA" 
