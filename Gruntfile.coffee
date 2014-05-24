module.exports = (grunt) ->

  # Project configuration.
  grunt.initConfig
    sass:
      dist:
        options:
          style: 'compact'
        files: [
          'dist/app.css': ['src/app.scss', 'bower_components/bootstrap-sass/lib/bootstrap.scss']
        ]
    haml:
      dist:
        options:
          style: 'ugly'
        files: [
          'dist/index.html': 'src/index.haml'
        ]
    coffee:
      dist:
        options:
          join: true
        files:
          'dist/app.js': ['src/app.coffee']
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

  # These plugins provide necessary tasks.
  grunt.loadNpmTasks('grunt-contrib-watch')
  grunt.loadNpmTasks('grunt-contrib-haml')
  grunt.loadNpmTasks('grunt-contrib-sass')
  grunt.loadNpmTasks('grunt-contrib-coffee')

  # Default task.
  grunt.registerTask 'default', ['watch']
