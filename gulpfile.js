var gulp = require('gulp');
var coffee = require('gulp-coffee');
var inject = require('gulp-inject');
var debug = require('gulp-debug');
var livereload = require('gulp-livereload');

var COFFEE_STATIC_PATH = './static/coffee/*.coffee';
var PUBLIC_STATIC_PATH = './public/js/';

gulp.task('scripts', function() {
  return gulp.src(COFFEE_STATIC_PATH)
    .pipe(debug({title: 'coffee:'}))
    .pipe(coffee())
    .pipe(gulp.dest(PUBLIC_STATIC_PATH))
    .pipe(livereload());
});

gulp.task('watch', function() {
  livereload.listen(35729);
  gulp.watch(COFFEE_STATIC_PATH, ['scripts']);
});

gulp.task('default', ['scripts', 'watch']);
