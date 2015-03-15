processors = require '../lib/processors'
assert = require 'assert'
equ = assert.equal

module.exports =
  'test normalize': (test) ->
    demo = 'This shOUld BE loWErcase'
    result = processors.normalize demo
    equ result, 'this should be lowercase'
    test.done()

  'test firstCharLowerCase': (test) ->
    demo = 'ThiS SHould OnlY LOwercase the fIRST cHar'
    result = processors.firstCharLowerCase demo
    equ result, 'thiS SHould OnlY LOwercase the fIRST cHar'
    test.done()

  'test stripPrefix': (test) ->
    demo = 'stripMe:DoNotTouch'
    result = processors.stripPrefix demo
    equ result, 'DoNotTouch'
    test.done()

  'test stripPrefix, ignore xmlns': (test) ->
    demo = 'xmlns:shouldHavePrefix'
    result = processors.stripPrefix demo
    equ result, 'xmlns:shouldHavePrefix'
    test.done()

  'test parseNumbers': (test) ->
    equ processors.parseNumbers('0'), 0
    equ processors.parseNumbers('123'), 123
    equ processors.parseNumbers('15.56'), 15.56
    equ processors.parseNumbers('10.00'), 10
    test.done()