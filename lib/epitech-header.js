'use babel';

import { CompositeDisposable, Point, Range } from 'atom';
import { Comments } from './epitech-header-comments';

export default {
    subscriptions: null,
    headerTemplate: '__startcom__\n' +
        '__midcom__ EPITECH PROJECT, __year__\n' +
        '__midcom__ __project__\n' +
        '__midcom__ File description:\n' +
        '__midcom__ \n' +
        '__endcom__\n' +
        '\n',

    activate(state) {
        var editor;

        this.subscriptions = new CompositeDisposable();
        this.subscriptions.add(atom.commands.add('atom-workspace', {
            'epitech-header:create_header': () => this.create_header(),
        }));
    },

    deactivate() {
        this.subscriptions.dispose();
        this.commandPaletteView.destroy();
    },

    create_header() {
        var editor;

        if ((editor = atom.workspace.getActiveTextEditor()) && !this.has_header(editor)) {
            editor.getBuffer().insert(new Point(0, 0), this.define_header(editor));
        }
    },

    define_header() {
        var editor;
        var path;
        var fileName;
        var header;
        var projdir;
        var com;

        if (editor = atom.workspace.getActiveTextEditor()) {
            path = editor.getPath();
            com = this.get_grammar_comments();
            header = this.headerTemplate;
            header = header.replace(new RegExp('__startcom__', 'g'), com.startcom);
            header = header.replace(new RegExp('__midcom__', 'g'), com.midcom);
            header = header.replace(new RegExp('__endcom__', 'g'), com.endcom);
            header = header.replace(new RegExp('__year__', 'g'), 2018);

            if (projdir = atom.project.relativizePath(path)[0]) {
                header = header.replace(new RegExp('__project__', 'g'), projdir.split('/').pop());
            }
        }

        return (header);
    },

    get_grammar_comments() {
        var editor;

        if (editor = atom.workspace.getActiveTextEditor()) {
            return ((Comments[editor.getGrammar().name]) ? Comments[editor.getGrammar().name] : Comments.default);
        }
        return (Comments.default);
    },

    has_header() {
        var editor;
        var tmp;

        tmp = false;
        if (editor = atom.workspace.getActiveTextEditor()) {
            editor.scan(new RegExp('.*\n.* EPITECH PROJECT, .*\n.* .*\n.* File description:\n.*\t.*\n.*\n', 'g'), ({stop}) => {
                tmp = true;
                stop();
            });
        }
        return (tmp);
    },

};
