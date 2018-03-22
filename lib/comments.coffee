module.exports =
    class Comments
        constructor: (grammar) ->
            @grammar = grammar.toLowerCase()
            @arr = []
            @cursor = [[], []]
            if @grammar == "c" || @grammar == "cpp" || @grammar == "css" || @grammar == "javascript" || @grammar == "java" || @grammar == "go" || @grammar == "c++"
                @arr[0] = "/*"
                @arr[1] = "**"
                @arr[2] = "*/"
                @cursor = [
                    [ 4, @arr[1].length + 1 ],
                    [ 4, @arr[1].length + 25 ]
                ]
            else if @grammar == "html"
                @arr[0] = "<!--"
                @arr[1] = "  --"
                @arr[2] = "  -->"
                @cursor = [
                    [ 4, @arr[1].length + 1 ],
                    [ 4, @arr[1].length + 25 ]
                ]
            else if @grammar == "python"
                @arr[0] = "#!/usr/bin/env python\n\n##"
                @arr[1] = "##"
                @arr[2] = "##"
                @cursor = [
                    [ 6, @arr[1].length + 1 ],
                    [ 6, @arr[1].length + 25 ]
                ]
            else if @grammar == "perl"
                @arr[0] = "#!/usr/bin/env perl\n\n##"
                @arr[1] = "##"
                @arr[2] = "##"
                @cursor = [
                    [ 6, @arr[1].length + 1 ],
                    [ 6, @arr[1].length + 25 ]
                ]
            else if @grammar == "shell script"
                @arr[0] = "#!/bin/bash\n##"
                @arr[1] = "##"
                @arr[2] = "##"
                @cursor = [
                    [ 5, @arr[1].length + 1 ],
                    [ 5, @arr[1].length + 25 ]
                ]
            else if @grammar == "php"
                @arr[0] = "#!/usr/bin/env php\n\n<?php\n/*"
                @arr[1] = "**"
                @arr[2] = "*/"
                @cursor = [
                    [ 7, @arr[1].length + 1 ],
                    [ 7, @arr[1].length + 25 ]
                ]
            else if @grammar == "lisp" || @grammar == "sql"
                @arr[0] = ";;"
                @arr[1] = ";;"
                @arr[2] = ";;"
                @cursor = [
                    [ 4, @arr[1].length + 1 ],
                    [ 4, @arr[1].length + 25 ]
                ]
            else if @grammar == "latex" || @grammar == "tex"
                @arr[0] = "%%"
                @arr[1] = "%%"
                @arr[2] = "%%"
                @cursor = [
                    [ 4, @arr[1].length + 1 ],
                    [ 4, @arr[1].length + 25 ]
                ]
            else if @grammar == "pascal"
                @arr[0] = "{"
                @arr[1] = ""
                @arr[2] = "}"
                @cursor = [
                    [ 4, @arr[1].length + 1 ],
                    [ 4, @arr[1].length + 25 ]
                ]
            else
                @arr[0] = "##"
                @arr[1] = "##"
                @arr[2] = "##"
                @cursor = [
                    [ 4, @arr[1].length + 1 ],
                    [ 4, @arr[1].length + 25 ]
                ]

        getStart: ->
            return @arr[0]

        getMiddle: ->
            return @arr[1]

        getEnd: ->
            return @arr[2]

        getCursorRange: ->
            return @cursor
