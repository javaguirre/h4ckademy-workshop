var gulp = require('gulp');
var gutil = require('gulp-util');
var coffee = require('gulp-coffee');
var watch = require('gulp-watch');
var inject = require('gulp-inject');

var COFFEE_STATIC_PATH = './static/coffee/*.coffee';
var PUBLIC_STATIC_PATH = './public/';

gulp.task('coffee', function() {
  gulp.src(COFFEE_STATIC_PATH)
    .pipe(coffee({bare: true}).on('error', gutil.log))
    .pipe(gulp.dest(PUBLIC_STATIC_PATH));
});

gulp.task('watch', function() {
    gulp.watch(COFFEE_STATIC_PATH, ['coffee']);
});

gulp.task('default', []);
