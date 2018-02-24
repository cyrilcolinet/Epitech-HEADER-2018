module.exports =
    class Comments
        constructor: (grammar) ->
            @grammar = grammar.toLowerCase()
            @com = {
                "default": {
                    "start": "##",
                    "middle": "##",
                    "end": "##"
                },
                "c": {
                    "start": "/*",
                    "middle": "**",
                    "end": "*/"
                },
                "c++": {
                    "start": "/*",
                    "middle": "**",
                    "end": "*/"
                },
                "html": {
                    "start": "<!--",
                    "middle": "--",
                    "end": "-->"
                },
                "python": {
                    "start": "#!/usr/bin/env python\n##",
                    "middle": "##",
                    "end": "##"
                },
                "perl": {
                    "start": "#!/usr/bin/env perl\n##",
                    "middle": "##",
                    "end": "##"
                },
                "php": {
                    "start": "#!/usr/bin/env perl\n<?php\n/*",
                    "middle": "**",
                    "end": "*/"
                },
                "lisp": {
                    "start": ";;",
                    "middle": ";;",
                    "end": ";;"
                }
            }

        getStart: ->
            
