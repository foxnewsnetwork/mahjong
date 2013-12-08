'use strict'
lrSnippet = require('grunt-contrib-livereload/lib/utils').livereloadSnippet
mountFolder = (connect, dir) -> 
  connect.static(require('path').resolve(dir))
module.exports = (grunt) ->
  require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks)

  grunt.initConfig
    pkg: grunt.file.readJSON('package.json'),
    yeoman:
      app: "app"
      dist: "www"
    watch:
      coffee:
        files: ["app/js/{,*/}{,*/}{,*/}{,*/}*.coffee"]
        tasks: ["coffee:client"]
      jade:
        files: ["app/views/{,*/}{,*/}{,*/}{,*/}*.jade"]
        tasks: ["jade:dist"]
      livescript:
        files: ["app/js/{,*/}{,*/}{,*/}{,*/}*.livescript"]
        tasks: ["livescript:client"]
      compass:
        files: ["app/css/{,*/}{,*/}{,*/}{,*/}*.{scss,sass}"]
        task: ["compass:dist"]
      livereload:
        files: ["www/{,*/}{,*/}{,*/}{,*/}{,*/}*.{html,css,js,jpg,png,jpeg,gif,webp,svg}"]
        task: ["livereload"]
    connect:
      options:
        port: 9000,
        hostname: "localhost"
      livereload:
        options:
          middleware: (connect) ->
            [lrSnippet, mountFolder(connect, "www"), mountFolder(connect, "www/views")]
    open:
      server:
        url: "http://localhost:<%= connect.options.port %>"
    jade:
      dist:
        options:
          data:
            debug: false
        files: [{
          expand: true,
          cwd: 'app/views',
          src: '{,*/}{,*/}{,*/}{,*/}*.jade',
          dest: 'www/views',
          ext: '.html'
        }]
    coffee:
      server:
        files: [{
          expand: true,
          cwd: 'src',
          src: '{,*/}{,*/}{,*/}{,*/}*.coffee',
          dest: 'server',
          ext: '.js'
        }]
      client:
        files: [{
          expand: true,
          cwd: 'app/js',
          src: '{,*/}{,*/}{,*/}{,*/}*.coffee',
          dest: 'www/js',
          ext: '.js'
        }]
    livescript:
      client:
        files: [{
          expand: true,
          cwd: 'app/js',
          src: '{,*/}{,*/}{,*/}{,*/}*.ls',
          dest: 'www/js',
          ext: '.js'
        }]
      server:
        files: [{
          expand: true,
          cwd: 'src',
          src: '{,*/}{,*/}{,*/}{,*/}*.ls',
          dest: 'server',
          ext: '.js'
        }]
    compass:
      options:
        sassDir: 'app/css',
        cssDir: 'www/css',
        imagesDir: 'www/img',
        importPath: 'www/components',
        javascriptsDir: 'www/js',
        relativeAssets: true
      dist: {},
      server:
        options:
          debugInfo: true
    ngmin:
      dist:
        files: [{
          expand: true,
          cwd: "www/js",
          src: "*.js",
          dest: "www/js"
        }]
  grunt.renameTask('regarde', 'watch')
  grunt.registerTask "build", [
    'jade:dist',
    'coffee:client',
    'livescript:client',
    'coffee:server',
    'livescript:server',
    'compass:dist',
    'ngmin'
  ]
  grunt.registerTask "server", [
    "build",
    "compass:server",
    "livereload-start",
    "connect:livereload",
    "open",
    "watch"
  ]
  grunt.registerTask "default", "build"