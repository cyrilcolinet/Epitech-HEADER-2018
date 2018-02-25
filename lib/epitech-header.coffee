{ CompositeDisposable, Cursor } = require 'atom'
path = require 'path'
Template = require './template'
Comments = require './comments'

module.exports = EpitechHeader =
    insertTemplateStr: null
    updateTemplateStr: null
    subscriptions: null

    activate: (state) ->
        # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
        @subscriptions = new CompositeDisposable
        # Register command that toggles this view

        @insertTemplateStr = """
        {{_startcom_}}
        {{_midcom_}} EPITECH PROJECT, {{year}}
        {{_midcom_}} {{project}}
        {{_midcom_}} File description:
        {{_midcom_}} {{description}}
        {{_endcom_}}\n\n
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
        unless editor?
            return
        coordinates = editor.getCursorBufferPosition()
        editor.moveToTop()
        editor.moveToBeginningOfLine()
        buffer = atom.workspace.getActivePaneItem().buffer
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
        template.replace '{{description}}', ""
        editor.insertText template.getTemplate()
        editor.setCursorBufferPosition [4,3]
