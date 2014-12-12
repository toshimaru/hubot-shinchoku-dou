# Description:
#   進捗どうですか
#
# Commands:
#   shinchoku - 進捗画像をランダムに返す
#   進捗 - 進捗画像をランダムに返す
#
# Author:
#   - moqada (original author)
#   - toshimaru

request = require 'request'
cheerio = require 'cheerio'

url = 'http://shinchokudodesuka.tumblr.com/random'

module.exports = (robot) ->
  robot.respond /進捗どうですか/i, (msg) ->
    request url: url, (err, res, body) ->
      $ = cheerio.load body
      imgUrl = $('#posts > div.photo img').attr 'src'
      msg.send imgUrl or 'No Image'
