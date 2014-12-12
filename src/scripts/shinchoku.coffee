# Description:
#   進捗どうですか
#
# Commands:
#   hubot shinchoku - 進捗画像をランダムに返す
#   hubot 進捗 - 進捗画像をランダムに返す
#   hubot 進捗どうですか - 進捗状況を返事する
#
# Author:
#   - moqada (original author)
#   - toshimaru

request = require 'request'
cheerio = require 'cheerio'

url = 'http://shinchokudodesuka.tumblr.com/random'
shinchoku_joukyo = [
  "進捗ダメです",
  "http://cdn-ak.f.st-hatena.com/images/fotolife/r/refiute/20130901/20130901163147.gif",
  "逆に進捗どうなったと思いますか？",
  "何の話です？",
  "何の進捗ですか？",
  "まだあわてるような時間じゃない",
]

module.exports = (robot) ->
  robot.respond /(shinchoku|進捗)$/i, (msg) ->
    request url: url, (err, res, body) ->
      $ = cheerio.load body
      imgUrl = $('#posts > div.photo img').attr 'src'
      msg.send imgUrl or 'No Image'

  robot.respond /進捗どうですか/i, (msg) ->
    msg.send msg.random shinchoku_joukyo
