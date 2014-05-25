module.exports = (grunt) ->

  # Project configuration.
  grunt.initConfig
    aws: grunt.file.readJSON('.grunt-aws.json')
    s3:
      options:
        key: '<%= aws.key %>'
        secret: '<%= aws.secret %>'
        bucket: '<%= aws.bucket %>'
        access: 'public-read'
        headers:
          # Two Year cache policy (1000 * 60 * 60 * 24 * 730)
          "Cache-Control": "max-age=630720000, public"
          "Expires": new Date(Date.now() + 63072000000).toUTCString()
      dev:
        upload: [
          src: './dist/*',
          dest: '/'
        ]

    coffee:
      dist:
        options:
          join: true
        files:
          'dist/app.js': ['src/app.coffee']
    copy:
      dist:
        expand: true
        cwd: './public/'
        src: '**'
        dest: './dist/'
        flatten: true
        filter: 'isFile'
    haml:
      dist:
        options:
          style: 'ugly'
        files: [
          'dist/index.html': 'src/index.haml'
        ]
    sass:
      dist:
        options:
          style: 'compact'
        files: [
          'dist/app.css': ['src/app.scss', 'bower_components/bootstrap-sass/lib/bootstrap.scss']
        ]
    watch:
      coffee:
        files: ['src/*.coffee', 'Gruntfile.coffee']
        tasks: ['coffee']
      haml:
        files: ['src/*.haml', 'Gruntfile.coffee']
        tasks: ['haml']
      sass:
        files: ['src/*.scss', 'Gruntfile.coffee']
        tasks: ['sass']
      static:
        files: ['public/*', 'Gruntfile.coffee']
        tasks: ['copy:static']

  # These plugins provide necessary tasks.
  grunt.loadNpmTasks('grunt-contrib-coffee')
  grunt.loadNpmTasks('grunt-contrib-copy')
  grunt.loadNpmTasks('grunt-contrib-haml')
  grunt.loadNpmTasks('grunt-contrib-sass')
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-s3')

  # Default task.
  grunt.registerTask 'default', ['prep', 'watch']
  grunt.registerTask 'prep', ['coffee', 'haml', 'sass', 'copy']
