{ CompositeDisposable, Cursor } = require 'atom'
path = require 'path'
Template = require './template'
Comments = require './comments'

module.exports = EpitechHeader =
    insertTemplateStr: null
    updateTemplateStr: null
    subscriptions: null

    activate: (state) ->
        @subscriptions = new CompositeDisposable
        @insertTemplateStr = """
        {{_startcom_}}
        {{_midcom_}} EPITECH PROJECT, {{year}}
        {{_midcom_}} {{project}}
        {{_midcom_}} File description:
        {{_midcom_}} [enter description here]
        {{_endcom_}}\n
        """

        @subscriptions.add atom.commands.add 'atom-workspace', 'epitech-header:insert': => @insert()

    deactivate: ->
        @subscriptions.dispose()

    serialize: ->

    getFileProject: (file) ->
        unless file?
            return 'project'
        filePath = file.path
        project = atom.project.relativizePath(filePath)
        unless project?
            return 'project'
        if project[0] is null
            return 'project'
        paths = project[0].split('/')
        return paths.pop()

    getCurrentLanguage: (grammar) ->
        comments = new Comments(grammar)
        return comments

    insert: (event) ->
        template = new Template(@insertTemplateStr)
        editor = atom.workspace.getActiveTextEditor()
        hasHeader = @containsHeader editor
        unless editor?
            return
        if hasHeader == true
            return
        coordinates = editor.getCursorBufferPosition()
        editor.moveToTop()
        editor.moveToBeginningOfLine()
        buffer = atom.workspace.getActivePaneItem().buffer
        if !buffer
            return
        project = @getFileProject buffer.file
        date = new Date()
        curdate = date.toDateString()
        curdate = curdate.split ' '
        year = curdate.pop()
        com = @getCurrentLanguage editor.getGrammar().name
        template.replace '{{_startcom_}}', com.getStart()
        template.replace '{{_midcom_}}', com.getMiddle()
        template.replace '{{_endcom_}}', com.getEnd()
        template.replace '{{year}}', year
        template.replace '{{project}}', project
        editor.insertText template.getTemplate()
        editor.setSelectedBufferRange com.getCursorRange()
        console.log(com.getCursorRange())

    containsHeader: (editor) ->
        header = '.*\n.* EPITECH PROJECT, .*\n.* .*\n.* File description:\n.*\t.*\n.*\n'
        regex = new RegExp header, 'g'
        tmp = false
        editor.scan regex, ({stop}) ->
            tmp = true
            stop()
        return tmp
