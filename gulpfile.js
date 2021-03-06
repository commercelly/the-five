'use strict';
const gulp = require('gulp');
const sourcemaps = require('gulp-sourcemaps');
const sass = require('gulp-sass');
const autoprefixer = require('autoprefixer');
const postcss = require('gulp-postcss');
const cssnano = require('cssnano');
let uglify = require('gulp-uglify-es').default;
const browserSync = require('browser-sync');

let path = {
    src_sass:'./src/scss/*.scss',
    src_js:'./src/js/theme.js',
}

gulp.task("sassTask", function() {
    return gulp
        .src(path.src_sass)
        .pipe(sourcemaps.init()) // initialize sourcemaps first
        .pipe(sass().on('error', sass.logError))
        .pipe(sourcemaps.write('.')) // write sourcemaps file in current directory
        .pipe(gulp.dest('./assets/css'))
        .pipe(browserSync.stream());
});

// JS task: uglifies JS files to main.js
gulp.task('jsTask', function() {
    return gulp
      .src(path.src_js)
      .pipe(sourcemaps.init())
      .pipe(uglify())
      .pipe(sourcemaps.write()) // Inline source maps.
      .pipe(gulp.dest('./assets/js'))
      .pipe(browserSync.stream());
  });

// Static Server & watching scss/js/html files
gulp.task('serve', gulp.series('sassTask', function() {
    gulp.watch(path.src_sass,
      gulp.series('sassTask'));

    gulp.watch(path.src_js,
      gulp.series("jsTask"));
  }));
  
  gulp.task('default',
    gulp.series('sassTask', "jsTask", 'serve'));