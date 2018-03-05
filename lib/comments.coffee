module.exports =
    class Comments
        constructor: (grammar) ->
            @grammar = grammar.toLowerCase()
            @arr = []
            console.log @grammar
            if @grammar == "c" || @grammar == "cpp" || @grammar == "css" || @grammar == "javascript" || @grammar == "java" || @grammar == "go"
                @arr[0] = "/*"
                @arr[1] = "**"
                @arr[2] = "*/"
            else if @grammar == "html"
                @arr[0] = "<!--"
                @arr[1] = "  --"
                @arr[2] = "  -->"
            else if @grammar == "python"
                @arr[0] = "#!/usr/bin/env python\n##"
                @arr[1] = "##"
                @arr[2] = "##"
            else if @grammar == "perl"
                @arr[0] = "#!/usr/bin/env perl\n##"
                @arr[1] = "##"
                @arr[2] = "##"
            else if @grammar == "shell script"
                @arr[0] = "#!/bin/bash\n##"
                @arr[1] = "##"
                @arr[2] = "##"
            else if @grammar == "php"
                @arr[0] = "#!/usr/bin/env php\n<?php\n/*"
                @arr[1] = "**"
                @arr[2] = "*/"
            else if @grammar == "lisp" || @grammar == "sql"
                @arr[0] = ";;"
                @arr[1] = ";;"
                @arr[2] = ";;"
            else if @grammar == "latex" || @grammar == "tex"
                @arr[0] = "%%"
                @arr[1] = "%%"
                @arr[2] = "%%"
            else if @grammar == "pascal"
                @arr[0] = "{"
                @arr[1] = ""
                @arr[2] = "}"
            else
                @arr[0] = "##"
                @arr[1] = "##"
                @arr[2] = "##"

        getStart: ->
            return @arr[0]

        getMiddle: ->
            return @arr[1]

        getEnd: ->
            return @arr[2]
