/**
 * @license Copyright (c) 2003-2014, CKSource - Frederico Knabben. All rights
 *          reserved. For licensing, see LICENSE.md or
 *          http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function(config) {
	// Define changes to default configuration here. For example:
	config.language = 'zh-cn';
	config.uiColor = '#AADC6E';
	config.font_names = '宋体/宋体;黑体/黑体;仿宋/仿宋_GB2312;楷体/楷体_GB2312;隶书/隶书;幼圆/幼圆;微软雅黑/微软雅黑;'+ config.font_names ;

	config.toolbar = 'Full';
	config.toolbarCanCollapse =   true;
	config.resize_enabled = false;
	config.font_defaultLabel = '宋体';

	config.toolbar_Full = [
			[ 'Source', '-', 'Save', 'NewPage', 'Preview', '-', 'Templates' ],
			[ 'Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-',
					'Print', 'SpellChecker', 'Scayt' ],
			[ 'Undo', 'Redo', '-', 'Find', 'Replace', '-', 'SelectAll',
					'RemoveFormat' ],
			[ 'Form', 'Checkbox', 'Radio', 'TextField', 'Textarea', 'Select',
					'Button', 'ImageButton', 'HiddenField' ],
			[ 'BidiLtr', 'BidiRtl' ],
			'/',
			[ 'Bold', 'Italic', 'Underline', 'Strike', '-', 'Subscript',
					'Superscript' ],
			[ 'NumberedList', 'BulletedList', '-', 'Outdent', 'Indent',
					'Blockquote', 'CreateDiv' ],
			[ 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock' ],
			[ 'Link', 'Unlink', 'Anchor' ],
			[ 'Image', 'Flash', 'Table', 'HorizontalRule', 'Smiley',
					'SpecialChar', 'PageBreak' ], '/',
			[ 'Styles', 'Format', 'Font', 'FontSize' ],
			[ 'TextColor', 'BGColor' ],
			[ 'Maximize', 'ShowBlocks', '-', 'About' ] ];
};
