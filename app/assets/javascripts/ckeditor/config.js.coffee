# http://docs.cksource.com/ckeditor_api/symbols/CKEDITOR.config.html#.toolbar_Full
CKEDITOR.editorConfig = (config) ->
  config.language = 'de'  
  config.toolbar_Pure = [    
    { name: 'clipboard',   items: [ 'Cut','Copy','Paste','PasteText','PasteFromWord','-','Undo','Redo' ] },
    { name: 'editing',     items: [ 'Find','Replace','-','SelectAll','-','SpellChecker', 'Scayt' ] },
    { name: 'tools',       items: [ 'Maximize', 'ShowBlocks','-','About' ] }
    '/',
    { name: 'basicstyles', items: [ 'Bold','Italic','Underline','Strike','Subscript','Superscript','-','RemoveFormat' ] },
    { name: 'paragraph',   items: [ 'NumberedList','BulletedList','-','Outdent','Indent','-','Blockquote','CreateDiv','-','JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock','-','BidiLtr','BidiRtl' ] },
    '/',
    { name: 'links',       items: [ 'Link','Unlink','Anchor' ] },
    { name: 'insert',      items: [ 'Image','Flash','Youtube', 'Table','HorizontalRule','Smiley','SpecialChar','PageBreak' ] },
     '/',
    { name: 'styles',      items: [ 'Styles','Format','Font','FontSize' ] },
    { name: 'colors',      items: [ 'TextColor','BGColor' ] },    
  ]
  config.allowedContent = true;
  config.toolbar = 'Pure'
  config.extraPlugins = 'youtube';
  config.youtube_width = '640';
  config.youtube_height = '480';
  config.youtube_related = true;
  true