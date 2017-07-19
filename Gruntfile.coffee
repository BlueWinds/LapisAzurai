fs = require('fs')
files = require('./src/loadOrder').map (f)->('src/' + f)

module.exports = (grunt) ->
  require('time-grunt')(grunt);

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-coffeelint'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-compress'
  grunt.loadNpmTasks 'grunt-string-replace'

  e = {level: 'error'}

  config = {
    coffee:
      all:
        files: 'dist/game/compiled.js': files
    coffeelint:
      app: files
      options:
        braces_spacing: {level: 'error', spaces: 0, empty_object_spaces: 0}
        colon_asignment_spacing: {level: 'error', left: 0, right: 1}
        cyclomatic_complexity: e
        ensure_comprehensions: e
        eol_last: e
        line_endings: {level: 'error', value: 'unix'}
        max_line_length: {level: 'ignore'}
        no_empty_functions: e
        no_empty_param_list: e
        no_interpolation_in_single_quotes: e
        no_nested_string_interpolation: e
        no_private_function_fat_arrows: e
        no_standalone_at: e
        no_this: e
        no_unnecessart_fat_arrows: e
        prefer_english_operator: e
        space_operators: e
        spacing_after_comma: e
    copy:
      static:
        files:
          'dist/game/CC-by-nc-sa-4.0.txt': ['src/content/CC-by-nc-sa-4.0.txt']
          'dist/game/GPL.txt': ['src/engine/GPL.txt']
          'dist/README.txt': ['src/README.txt']
          'dist/game/engine.css': ['src/engine/engine.css']
          'dist/game/content.css': ['src/content/content.css']
      images:
        files: [{
          cwd: 'src/content'
          expand: true
          src: ['**/*.png', '**/*.jpg', '**/*.svg']
          dest: 'dist/game/content'
        }]
    uglify:
      options:
        mangle: false
      libs:
        files:
          'dist/game/lib.js': ['src/lib/*.js']
    watch:
      compile:
        files: ['src/**/*.coffee', 'src/**/*.css']
        tasks: ['compile']
        options:
          livereload: true
      images:
        files: ['src/**/*.svg', 'src/**/*.png', 'src/**/*.jpg', 'src/**/*.css']
        tasks: ['copy:images']
        options:
          livereload: true
      configFiles:
        files: [ 'Gruntfile.coffee', 'src/loadOrder.coffee' ],
        options:
          reload: true
    clean:
      game: ['dist', 'LapisAzurai.zip']
    compress:
      nsfw:
        options:
          archive: './LapisAzurai.zip'
        src: ['**/*']
        cwd: 'dist'
        expand: true
    'string-replace':
      dist:
        files: 'dist/index.html': 'src/index.html'
        options:
          replacements: [{
            pattern: '<svg id="map"></svg>'
            replacement: '<%= grunt.file.read("src/content/Map.svg").replace("content/Map", "game/content/Map") %>'
          }]
  }
  grunt.initConfig config

  grunt.registerTask 'compile', ['coffee', 'copy:static', 'string-replace']
  grunt.registerTask 'lib', ['uglify', 'copy:images']
  grunt.registerTask 'full-compile', ['lib', 'coffeelint', 'compile']
  grunt.registerTask 'full-build', ['clean', 'full-compile', 'compress']
  grunt.registerTask 'default', ['lib', 'coffeelint', 'compile', 'watch:compile']
