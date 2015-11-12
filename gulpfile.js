var gulp = require('gulp');
var coffee = require('gulp-coffee');
var inject = require('gulp-inject');
var debug = require('gulp-debug');
var concat = require('gulp-concat');
var livereload = require('gulp-livereload');

var COFFEE_STATIC_PATH = './static/coffee/*.coffee';
var STYLES_STATIC_PATH = [
  './bower_components/bootstrap/dist/css/bootstrap.min.css',
  './static/css/style.css'
];
var PUBLIC_JS_STATIC_PATH = './public/js/';
var PUBLIC_CSS_STATIC_PATH = './public/css/';

gulp.task('scripts', function() {
  return gulp.src(COFFEE_STATIC_PATH)
    .pipe(debug({title: 'coffee:'}))
    .pipe(coffee())
    .pipe(gulp.dest(PUBLIC_JS_STATIC_PATH))
    .pipe(livereload());
});

gulp.task('styles', function() {
  gulp.src(STYLES_STATIC_PATH)
    .pipe(debug({title: 'styles:'}))
    .pipe(concat('style.css'))
    .pipe(gulp.dest(PUBLIC_CSS_STATIC_PATH));
});

gulp.task('watch', function() {
  livereload.listen(35729);
  gulp.watch(COFFEE_STATIC_PATH, ['scripts']);
  gulp.watch(STYLES_STATIC_PATH, ['styles']);
});

gulp.task('default', ['scripts', 'styles', 'watch']);
