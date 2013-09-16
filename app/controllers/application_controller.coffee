# TODO debug forgery with singe page application
#before 'protect from forgery', ->
#    protectFromForgery '014bab01fb364db464d3f1c9a4c4fe8e4032ed0b'



action "generateId", ->
    pubkey = body.pubkey
    if not pubkey
        send 400
    else
        exec = require('child_process').exec
        console.log process.cwd()
        console.log
        pubkey = pubkey.replace(/\r\n/g, '')
        console.log pubkey
        child = exec "python pki.py -s '#{pubkey}' -n 'frank' -w 'https://frank.cozycloud.cc/'", (error, stdout, stderr) ->
            if error
                console.log error
                console.log stderr
                send 'error', 500
            else
                send stdout

action "getId", ->
